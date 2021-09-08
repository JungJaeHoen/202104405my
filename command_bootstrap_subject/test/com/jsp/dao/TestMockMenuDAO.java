package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.datasource.OracleMybatisSqlSessionFactory;
import com.jsp.dto.MenuVO;


public class TestMockMenuDAO {
	
	private SqlSession session;
	private MenuDAO menuDAO;
	
	@Before
	public void init() {
		menuDAO = new MockMenuDAO();
	}
	
	
	@Test
	public void testSelectMainMenu() throws SQLException{
		List<MenuVO> mainMenuList = menuDAO.selectMainMenu(session);
		
		int cnt = 4;
		
		Assert.assertEquals(cnt, mainMenuList.size());
	}
	
	@Test
	public void testSelectSubMenu() throws SQLException{
		String testUpcode = "M000000";
		
		List<MenuVO> subMenuList = menuDAO.selectSubMenu(session, testUpcode);
		
		for (int i = 0; i < subMenuList.size(); i++) {
			Assert.assertEquals(testUpcode, subMenuList.get(i).getUpcode());
		}
		
	}
	
	@Test
	public void testSelectMenuByMcode() throws SQLException{
		String testMcode = "M020100";
		
		MenuVO menu = menuDAO.selectMenuByMcode(session, testMcode);
		
		Assert.assertEquals(testMcode,menu.getMcode());
	}
	
	
	@Test
	public void testSelectMenuByMname() throws SQLException{
		String testMname = "자료실목록";
		
		
		MenuVO menu = menuDAO.selectMenuByMname(session, testMname);
		
		Assert.assertEquals(testMname, menu.getMname());
		
	}
	
	
	
	@After
	public void complete() {
	}
}
