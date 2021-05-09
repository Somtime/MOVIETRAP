package controller;

import controller.action.Action;
import controller.action.LoginFormAction;

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
		// command를 입력 받아 실행 시킬 action을 넣을 Action 변수 생성
		Action action = null;
		
		// Console 창에 커맨드 표시
		System.out.println("ActionFactory : " + command);
		
		// Action/ Command
		if (command.equals("index")) {
			action = new LoginFormAction(); // 로그인/회원가입 페이지
		}
		
		return action;
	}
}
