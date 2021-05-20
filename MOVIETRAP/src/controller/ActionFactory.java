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
		}
		
		
		return action;
	}
}
