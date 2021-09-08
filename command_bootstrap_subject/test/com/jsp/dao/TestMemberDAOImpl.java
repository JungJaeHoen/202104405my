/*package com.jsp.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.datasource.OracleMybatisSqlSessionFactory;
import com.jsp.dto.MemberVO;

public class TestMemberDAOImpl {
	private SqlSessionFactory sqlSessionFactory = new OracleMybatisSqlSessionFactory();
	private SqlSession session;
	
	private MemberDAO memberDAO;
	
	@Before
	public void init() {
		session = sqlSessionFactory.openSession(false);//자동으로 커밋되지않게 false를 준다.
		memberDAO = new MockMemberDAO(); 
	}
	
	@Test
	public void testSelectMemberById() throws SQLException {
		String testID = "mimi";
		
		MemberVO member = memberDAO.selectMemberById(session, testID);
		
		Assert.assertEquals(testID, member.getId());
	}
	
	@After
	public void complete() {
		session.rollback();//닫기전에  rollback 한다.
		session.close();
	}
	
}
*/