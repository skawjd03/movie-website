package kr.coo.civ;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.log4j.Log4j;

@ServerEndpoint("/servicesocket")
@Log4j
public class ServiceController {

	private static List<Session> userList = new ArrayList<Session>();

	@OnOpen
	public void onOpen(Session session, EndpointConfig endpointConfig) {
		userList.add(session);
	}

	@OnMessage
	public void handleMessage(String seatInfo, Session session) throws IOException {
	}

	@OnClose
	public void handleClose(Session session) {
		userList.remove(session);
	}

	public static void sendDate(String jsonData) {
		for (Session user : userList) {
			try {
				user.getBasicRemote().sendText(jsonData);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
