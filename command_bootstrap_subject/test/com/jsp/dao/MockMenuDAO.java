package com.jsp.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MenuVO;

public class MockMenuDAO implements MenuDAO{

	@Override
	public List<MenuVO> selectMainMenu(SqlSession session) throws SQLException {
		
		List<MenuVO> mainMenuList = new ArrayList<MenuVO>();
		
		MenuVO mainMenu1 = new MenuVO();
		MenuVO mainMenu2 = new MenuVO();
		MenuVO mainMenu3 = new MenuVO();
		MenuVO mainMenu4 = new MenuVO();
		
		mainMenu1.setMname("HOME");
		mainMenu2.setMname("회원관리");
		mainMenu3.setMname("공지사항");
		mainMenu4.setMname("자유게시판");
		
		mainMenuList.add(mainMenu1);
		mainMenuList.add(mainMenu2);
		mainMenuList.add(mainMenu3);
		mainMenuList.add(mainMenu4);
		
		return mainMenuList;
	}

	@Override
	public List<MenuVO> selectSubMenu(SqlSession session, String mCode) throws SQLException {
		
		List<MenuVO> subMenuList = new ArrayList<>();
		
		MenuVO subMenu1 = new MenuVO();
		MenuVO subMenu2 = new MenuVO();
		MenuVO subMenu3 = new MenuVO();
		MenuVO subMenu4 = new MenuVO();
		MenuVO subMenu5 = new MenuVO();
		
		if(mCode.equals("M000000")) {
			
			subMenu1.setUpcode("M000000");
			subMenu2.setUpcode("M000000");
			subMenu3.setUpcode("M000000");
			subMenu4.setUpcode("M000000");
			subMenu5.setUpcode("M000000");
			
			subMenu1.setMname("회원관리");
			subMenu2.setMname("공지사항");
			subMenu3.setMname("자유게시판");
			subMenu4.setMname("자료실");
			subMenu5.setMname("HOME");
			
			subMenuList.add(subMenu1);
			subMenuList.add(subMenu2);
			subMenuList.add(subMenu3);
			subMenuList.add(subMenu4);
			subMenuList.add(subMenu5);
			
		}
		
		
		return subMenuList;
	}

	@Override
	public MenuVO selectMenuByMcode(SqlSession session, String mCode) throws SQLException {
		
		MenuVO menu = new MenuVO();
		
		if(mCode.equals("M020100")) {
			menu.setMcode("M020100");
			menu.setMname("공지목록");
			menu.setMurl("/notice/list.do");
		}
		
		
		return menu;
	}

	@Override
	public MenuVO selectMenuByMname(SqlSession session, String mName) throws SQLException {
		
		MenuVO menu = new MenuVO();
		
		if(mName.equals("자료실목록")) {
			
			menu.setMname("자료실목록");
			menu.setMcode("M040100");
			menu.setMurl("/pds/list.do");
		}
		
		return menu;
	}
	
}
