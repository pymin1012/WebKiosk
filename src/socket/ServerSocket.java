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
    	
    	System.out.println("----- Socket �޼��� ���� -----");
    	int type = Integer.parseInt(object.get("type").toString());
    	
    	// From Client To Pos
    	if (type == 1) {
    		EndpointConfig config = configMap.get(session);
        	HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        	int mb_num = (int) httpSession.getAttribute("mb_num");
        	System.out.println("ȸ����ȣ " + mb_num + "���� �ֹ��� �߰��մϴ�.");
        	System.out.println(">>> DB �ֹ� �ֱ� ����");
            
        	OrderHistoryBean ohBean = (OrderHistoryBean) httpSession.getAttribute("ohBean");
        	kMgr.insertOrderHistory(ohBean);
        	
        	// ����Ʈ ����
        	int oh_point = ohBean.getOh_point();
        	mMgr.updatePoint(mb_num, -(oh_point));
        	
        	int oh_tnum = kMgr.getRecentOrderTotalNum();
        	int or_basket = 0;
        	BasketMgr bMgr = (BasketMgr) httpSession.getAttribute("bMgr");
        	LinkedHashMap<Integer, OrdersBean> blist = bMgr.getBasketList();
        	for(int key: blist.keySet()) {
        		OrdersBean obean = blist.get(key);
        		obean.setOh_tnum(oh_tnum);
        		or_basket++;
        		obean.setOr_basket(or_basket);
        		kMgr.insertOrders(obean);
        	}
        	
        	int oh_num = kMgr.getRecentOrderNum(oh_tnum);
        	session.getBasicRemote().sendText(String.valueOf(oh_num));
        	System.out.println("�ֹ���ȣ : " + oh_num);

        	synchronized(pos) {
                for(Session p : pos) {
                	p.getBasicRemote().sendText("order");
                	System.out.println("order");
                }
            }
    	}
    	
    	// From Pos To Board (Accept, Cancle)
    	else if (type == 2) {
    		synchronized(board) {
                for(Session b : board) {
                	b.getBasicRemote().sendText("reload");
                	System.out.println("reload");
                }
            }
    	}
    	
    	// From Pos To Board (Order Ready)
    	else if (type == 3) {
    		synchronized(board) {
                for(Session b : board) {
                	b.getBasicRemote().sendText("ready");
                	System.out.println("ready");
                }
            }
    	}
    }
    
    
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
    	HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        String idKey = (String) httpSession.getAttribute("idKey");
        System.out.println("<Socket ����> �������� : " + idKey);
        
        switch(idKey) {
        case "clients":
        	int mb_num = (int) httpSession.getAttribute("mb_num");
        	System.out.println("ȸ����ȣ " + mb_num + "���� �����Ͽ����ϴ�.");
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
        System.out.println("<Socket ����> �������� : " + idKey);
        if (idKey.equals("clients")) {
        	int mb_num = (int) httpSession.getAttribute("mb_num");
        	System.out.println("ȸ����ȣ " + mb_num + "���� �����Ͽ����ϴ�.");
        }
        configMap.remove(session);
    }
}
 
 
