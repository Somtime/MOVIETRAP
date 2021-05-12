package controller;

import controller.action.Action;
import controller.action.EditPayAction;
import controller.action.LoginFormAction;
import controller.action.MembershipAction;
import controller.action.idCheckAction;

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
		} 
		return action;
	}
}
