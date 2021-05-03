package controller;

import controller.action.Action;

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
		if (command.equals("")) {
			//action = new 
		} else if (command.equals("")) {
			//action = new
		}
		
		return action
	}
}
