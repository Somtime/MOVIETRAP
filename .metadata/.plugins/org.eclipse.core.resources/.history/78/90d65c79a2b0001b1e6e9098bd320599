package controller;

import controller.action.Action;
import controller.action.LoginAction;

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
		// command�� �Է¹޾� action�� ������ ���� ����
		Action action = null;
		
		// Consoleâ�� Ŀ�ǵ� ǥ��
		System.out.println("ActionFactory : " + command);
		
		// Action/ Command
		if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("ex")) {
			//action = new
		}
		
		return action;
	}
}
