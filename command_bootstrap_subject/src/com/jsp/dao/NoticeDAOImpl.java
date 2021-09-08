package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.NoticeVO;
import com.jsp.request.SearchCriteria;

public class NoticeDAOImpl implements NoticeDAO {

	@Override
	public NoticeVO selectNoticeByNno(SqlSession session, int nno) throws SQLException {
		NoticeVO notice = session.selectOne("Notice-Mapper.selectNoticeByNno",nno);
		return notice;
	}

	@Override
	public List<NoticeVO> selectSearchNoticeList(SqlSession session, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectSearchNoticeList" , cri ,rowBounds);
		
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListCount(SqlSession session, SearchCriteria cri) throws SQLException {
		int count = 0;
		
		count = session.selectOne("Notice-Mapper.selectSearchNoticeListCount",cri);
		
		return count;
	}

	@Override
	public int insertNotice(SqlSession session, NoticeVO notice) throws SQLException {
		int result = 0;
		
		result = session.update("Notice-Mapper.insertNotice",notice);
		
		return result;
	}

	@Override
	public int updateNotice(SqlSession session, NoticeVO notice) throws SQLException {
		int result = 0;
		
		result = session.update("Notice-Mapper.updateNotice",notice);
		
		return result;
	}

	@Override
	public int deleteNotice(SqlSession session, int nno) throws SQLException {
		int result = 0;
		
		result = session.update("Notice-Mapper.deleteNotice",nno);
		
		return result;
	}
	

	@Override
	public int updateNoticeView(SqlSession session, int nno) throws SQLException {
		int result = 0;
		
		result = session.update("Notice-Mapper.updateNoticeView",nno);
		
		return result;
	}

	@Override
	public int updateNoticePoint(SqlSession session, int nno) throws SQLException {
		int result = 0;
		
		result = session.update("Notice-Mapper.updateNoticePoint",nno);
		
		return result;
	}

	@Override
	public void updateDist(SqlSession session) throws SQLException {
		
		session.update("Notice-Mapper.updateDist");
		
	}

}
