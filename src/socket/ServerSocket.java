package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kiosk.KioskMgr;
import kiosk.OrderHistoryBean;
import kiosk.OrdersBean;
 
@ServerEndpoint(value="/broadcasting", configurator=GetHttpSessionConfigurator.class)
public class ServerSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static Set<Session> pos = Collections.synchronizedSet(new HashSet<Session>());
    private static Set<Session> board = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException, ParseException {
    	JSONParser parser = new JSONParser();
    	JSONObject object = (JSONObject) parser.parse(message);
    	switch(Integer.parseInt(object.get("type").toString())) {
    	case 1:
    		synchronized(clients) {
                for(Session client : clients) {
                	client.getBasicRemote().sendText(message);
                }
            }
    		break;
    	case 2:
    		KioskMgr mgr = new KioskMgr();
    		OrderHistoryBean hbean = new OrderHistoryBean();
    		hbean.setOh_status(1);
    		hbean.setMb_num(Integer.parseInt(object.get("mb_num").toString()));
    		hbean.setOh_io("IN");
    		hbean.setOh_comment("test");
    		hbean.setOh_point(0);
    		mgr.insertOrderHistory(hbean);
    		
    		OrdersBean bean = new OrdersBean();
    		bean.setOh_num(mgr.getRecentOrderNum());
    		bean.setOr_basket(1);
        	bean.setProd_num(Integer.parseInt(object.get("prod_num").toString()));
        	bean.setOr_size(object.get("or_size").toString());
        	bean.setOr_count(Integer.parseInt(object.get("or_count").toString()));
        	bean.setOr_hi(object.get("or_hi").toString());
        	new KioskMgr().insertOrders(bean);
        	
        	synchronized(pos) {
                for(Session p : pos) {
                	p.getBasicRemote().sendText("accept order");
                	System.out.println("accept order");
                }
            }
    		break;
    	case 3:
    		synchronized(board) {
                for(Session b : board) {
                	b.getBasicRemote().sendText(message);
                }
            }
    		break;
    	}  
    }   
    
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
    	HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        String idKey = (String) httpSession.getAttribute("idKey");
    	System.out.println(idKey);
        
        switch(idKey) {
        case "clients":
        	System.out.println(session);
        	clients.add(session);
        	break;
        case "pos":
        	pos.add(session);
        	break;
        case "board":
        	board.add(session);
        	break;
        }
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        pos.remove(session);
        board.remove(session);
        System.out.println("세션 종료");
    }
}
 
 
