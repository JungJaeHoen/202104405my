package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.NoticeVO;
import com.jsp.request.SearchCriteria;

public interface NoticeDAO {
	// 게시글 정보 조회
	NoticeVO selectNoticeByNno(SqlSession session, int nno) throws SQLException;
	
	// 게시글 리스트 조회
	List<NoticeVO> selectSearchNoticeList(SqlSession session,SearchCriteria cri) throws SQLException;
	
	// 리스트 검색 결과의 전체 리스트 개수
	int selectSearchNoticeListCount(SqlSession session,SearchCriteria cri) throws SQLException;
	
	//게시글 추가
	public int insertNotice (SqlSession session,NoticeVO notice) throws SQLException;
	
	//게시글 수정
	public int updateNotice (SqlSession session, NoticeVO notice) throws SQLException;
	
	//게시글 삭제
	public int deleteNotice (SqlSession session, int nno) throws SQLException;
	
	//게시글 조회수 증가
	public int updateNoticeView (SqlSession session, int nno) throws SQLException;
	
	//게시글 포인트 증가 
	public int updateNoticePoint (SqlSession session, int nno) throws SQLException;
	
	//enddate지난 게시글 dist Y로 바꾸기
	public void updateDist(SqlSession session) throws SQLException;
	
}
