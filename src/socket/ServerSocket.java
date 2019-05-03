package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
 
@ServerEndpoint("/broadcasting")
public class ServerSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static Session pos = null;
    private static Session board = null;
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException, ParseException {
    	JSONParser parser = new JSONParser();
    	JSONObject object = (JSONObject) parser.parse(message);
    	switch(Integer.parseInt(object.get("type").toString())) {
    	case 1:
        	board.getBasicRemote().sendText(message);
    		break;
    	case 2:
        	pos.getBasicRemote().sendText(message);
    		break;
    	case 3:
    		synchronized(clients) {
                for(Session client : clients) {
                	client.getBasicRemote().sendText(message);
                }
            }
    		break;
    	}
    }
    
    
    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session);
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("세션 종료");
    }
}
 
 
