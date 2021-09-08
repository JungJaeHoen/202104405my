package com.jsp.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.dto.NoticeVO;
import com.jsp.request.SearchCriteria;

public interface NoticeService {
	//게시글 조회
	NoticeVO getNotice(int nno) throws SQLException;
	
	//게시글리스트조회
	Map<String, Object> getNoticeList(SearchCriteria cri)throws SQLException;
	
	//게시글등록
	public int regist(NoticeVO notice) throws SQLException;
	
	//게시글수정
	public int modify(NoticeVO notice) throws SQLException;
	
	//게시글 삭제
	public int remove(int nno) throws SQLException;
	
	//게시글 조회수 증가
	public int view(int nno) throws SQLException;
	
	//게시글 enddate지난거 dist Y로 바꾸기
	public void updateDist() throws SQLException;
	
}
