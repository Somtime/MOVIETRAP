package controller;
import controller.action.*;
public class ActionFactory {
	// Variable
	private static ActionFactory instance = new ActionFactory();
	 
	// Constructor
	private ActionFactory() {}
	
	// Method
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		// command�� �Է� �޾� ���� ��ų action�� ���� Action ���� ����
		Action action = null;
		
		// Console â�� Ŀ�ǵ� ǥ��
		System.out.println("ActionFactory : " + command);
		
		// Action/ Command
		if (command.equals("index")) {
			action = new LoginFormAction();
		} else if (command.equals("edit_pay")) {
			action = new EditPayAction();
		} else if (command.equals("membership")) {
			action = new MembershipAction();
		} else if (command.equals("idcheck")) {
			action = new idCheckAction();
		} else if (command.equals("join_form")) {
			action = new JoinFormAction();
		} else if(command.equals("join")) {
			action = new JoinAction();
		} else if(command.equals("main")) {
			action = new mainAction();
		} else if (command.equals("moviepage")) {
			action = new MoviePageAction();
		} else if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("genre_movie")) {
			action = new GenreMovieGoAction();
		} else if (command.equals("genre_movie_list")) {
			action = new GenreMovieAction();
		} else if (command.equals("qna_send")) {
			action = new QnaSendAction();
		} else if(command.equals("edit_member")) {
			action = new EditMemberAction();
		} else if (command.equals("admin_page")) {
			action = new AdminPageAction();
		} else if (command.equals("update_member_info")) {
			action = new UpdateMemberInfoAction();
 		} else if (command.equals("update_pay_info")) {
 			action = new UpdatePayInfoAction();
 		} else if (command.equals("qna_list")) {
 			action = new QnaListAction();
 		} else if (command.equals("admin_chat_list")) {
 			action = new AdminChatListAction();
 		} else if (command.equals("admin_qna_list")) {
 			action = new AdminQnaListAction();
 		}
		
		
		return action;
	}
}
