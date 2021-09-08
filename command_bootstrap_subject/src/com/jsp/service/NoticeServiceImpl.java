package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.dao.NoticeDAO;
import com.jsp.dto.NoticeVO;
import com.jsp.request.PageMaker;
import com.jsp.request.SearchCriteria;

public class NoticeServiceImpl implements NoticeService {
	
	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public NoticeVO getNotice(int nno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			NoticeVO notice = noticeDAO.selectNoticeByNno(session, nno);
			return notice;
		} finally {
			session.close();
		}
		
	}

	@Override
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		try {
			List<NoticeVO> noticeList =  noticeDAO.selectSearchNoticeList(session, cri);
			
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(noticeDAO.selectSearchNoticeListCount(session, cri));
			
			
			dataMap.put("noticeList", noticeList);
			dataMap.put("pageMaker", pageMaker);
			
			return dataMap;
		} finally {
			session.close();
		}
		
	}

	@Override
	public int regist(NoticeVO notice) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		int result = 0;
		try {
			result = noticeDAO.insertNotice(session, notice);
			return result;
		} finally {
			session.close();
		}
	}

	@Override
	public int modify(NoticeVO notice) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		int result = 0;
		try {
			result += noticeDAO.updateNotice(session, notice);
			result += noticeDAO.updateNoticePoint(session, notice.getNno());
			return result;
		} finally {
			session.close();
		}

	}

	@Override
	public int remove(int nno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		int result = 0;
		try {
			result = noticeDAO.deleteNotice(session, nno);
			return result;
		} finally {
			session.close();
		}

	}

	@Override
	public int view(int nno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		int result = 0;
		try {
			result = noticeDAO.updateNoticeView(session, nno);
			return result;
		} finally {
			session.close();
		}
		
	}

	@Override
	public void updateDist() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			noticeDAO.updateDist(session);
		} finally {
			session.close();
		}
	}

}
