package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
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

import kiosk.BasketMgr;
import kiosk.KioskMgr;
import kiosk.MemberMgr;
import kiosk.OrderHistoryBean;
import kiosk.OrdersBean;
import kiosk.ProductBean;
import kiosk.ProductMgr;
 
@ServerEndpoint(value="/broadcasting", configurator=GetHttpSessionConfigurator.class)
public class ServerSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static Set<Session> pos = Collections.synchronizedSet(new HashSet<Session>());
    private static Set<Session> board = Collections.synchronizedSet(new HashSet<Session>());
    
    private static Map<Session, EndpointConfig> configMap = Collections.synchronizedMap(new HashMap<Session, EndpointConfig>());
    
    private KioskMgr kMgr = new KioskMgr();
    private MemberMgr mMgr = new MemberMgr();
    
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException, ParseException {
    	JSONParser parser = new JSONParser();
    	JSONObject object = (JSONObject) parser.parse(message);
    	
    	System.out.println("----- Socket 메세지 전송 -----");
    	switch(Integer.parseInt(object.get("type").toString())) {
    	case 1:
    		synchronized(clients) {
                for(Session client : clients) {
                	client.getBasicRemote().sendText(message);
                }
            }
    		break;
    		
    	case 2:
    		EndpointConfig config = configMap.get(session);
        	HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        	int mb_num = (int) httpSession.getAttribute("mb_num");
        	System.out.println("회원번호 " + mb_num + "님의 주문을 추가합니다.");
        	System.out.println(">>> DB 주문 넣기 실행");
            
        	OrderHistoryBean ohBean = (OrderHistoryBean) httpSession.getAttribute("ohBean");
        	kMgr.insertOrderHistory(ohBean);
        	
        	int oh_point = ohBean.getOh_point();
        	int oh_total = ohBean.getOh_total();
        	mMgr.updatePoint(mb_num, -(oh_point));
        	mMgr.updatePoint(mb_num, (int)(oh_total * 0.05));
        	
        	int oh_num = kMgr.getRecentOrderNum();
        	int or_basket = 0;
        	BasketMgr bMgr = (BasketMgr) httpSession.getAttribute("bMgr");
        	LinkedHashMap<Integer, OrdersBean> blist = bMgr.getBasketList();
        	for(int key: blist.keySet()) {
        		OrdersBean obean = blist.get(key);
        		obean.setOh_num(oh_num);
        		or_basket++;
        		obean.setOr_basket(or_basket);
        		kMgr.insertOrders(obean);
        	}
        	
        	session.getBasicRemote().sendText(String.valueOf(oh_num));
        	System.out.println("주문번호 : " + oh_num);

        	synchronized(board) {
                for(Session b : board) {
                	b.getBasicRemote().sendText("accept");
                	System.out.println("accept");
                }
            }
    		break;
    		
    	case 3:
    		synchronized(board) {
                for(Session b : board) {
                	b.getBasicRemote().sendText(message);
                }
            }
    		
    		synchronized(pos) {
                for(Session p : pos) {
                	p.getBasicRemote().sendText("check");
                	System.out.println("check");
                }
            }
    		break;
    	}  
    }
    
    
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
    	HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        String idKey = (String) httpSession.getAttribute("idKey");
        System.out.println("<Socket 접속> 접속유형 : " + idKey);
        
        switch(idKey) {
        case "clients":
        	int mb_num = (int) httpSession.getAttribute("mb_num");
        	System.out.println("회원번호 " + mb_num + "님이 접속하였습니다.");
        	clients.add(session);
        	break;
        case "pos":
        	pos.add(session);
        	break;
        case "board":
        	board.add(session);
        	break;
        }
    	configMap.put(session, config);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        pos.remove(session);
        board.remove(session);
        
        EndpointConfig config = configMap.get(session);
    	HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        String idKey = (String) httpSession.getAttribute("idKey");
        System.out.println("<Socket 종료> 접속유형 : " + idKey);
        if (idKey.equals("clients")) {
        	int mb_num = (int) httpSession.getAttribute("mb_num");
        	System.out.println("회원번호 " + mb_num + "님이 종료하였습니다.");
        }
        configMap.remove(session);
    }
}
 
 
