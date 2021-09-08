package com.jsp.action.notice;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.jsp.action.Action;
import com.jsp.controller.FileUploadResolver;
import com.jsp.controller.JSONResolver;
import com.jsp.util.GetUploadPath;
import com.jsp.util.MultipartHttpServletRequestParser;

@MultipartConfig(
		fileSizeThreshold=1024 * 1024 * 10,maxFileSize = 1024*1024*30,maxRequestSize=1024*1024*50 
		//(byte*1024 -> kb / *1024 -> mb 즉 10mb)
)

public class UploadImageAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		String uploadFileName = null;
		
		//1.request 변환
		MultipartHttpServletRequestParser multi = new MultipartHttpServletRequestParser(request);
		
		//2 저장할 경로
		String uploadPath = GetUploadPath.getUploadPath("notice.picture.upload");
		
		//3. 업로드된 이미지 저장
		FileItem[] items = multi.getFileItems("file");
		
		List<File> uploadFiles = FileUploadResolver.fileUpload(items, uploadPath);
		uploadFileName = uploadFiles.get(0).getName();
		
		JSONResolver.view(response, "/noticeImages/"+uploadFileName);
		
		return url;
	}
	

}
