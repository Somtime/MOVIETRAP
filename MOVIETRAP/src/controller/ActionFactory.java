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
		// command를 입력받아 action을 실행할 변수 생성
		Action action = null;
		
		// Console창에 커맨드 표시
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
