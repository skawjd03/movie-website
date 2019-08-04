package kr.coo.civ;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.log4j.Log4j;

@ServerEndpoint("/websocket/{sc}")
@Log4j
public class SeatController {

	private static HashMap<Integer,ArrayList<Session>> userList = new HashMap<Integer,ArrayList<Session>>();
	public int sc;
	
	@OnOpen
	public void onOpen(Session session, @PathParam("sc") int sc, EndpointConfig endpointConfig) {
		log.info("유저 접속");
		ArrayList<Session> check = userList.get(sc);
		if(check == null) {
			ArrayList<Session> list = new ArrayList<Session>();
			list.add(session);
			userList.put(sc, list);
		}else {
			check.add(session);
		}
		this.sc = sc;
	}

	@OnMessage
	public void handleMessage(String seatInfo, Session session) throws IOException{
		log.info("새로운 결제정보");
		log.info(seatInfo);
		log.info(sc);
		synchronized (userList) {
			ArrayList<Session> sendList = userList.get(sc);
			for (Session user : sendList) {
				if (!user.equals(session)) {
					try {
						user.getBasicRemote().sendText(seatInfo);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@OnClose
	public void handleClose(Session session) {
		ArrayList<Session> byebye = userList.get(sc);
		byebye.remove(session);
	}


}