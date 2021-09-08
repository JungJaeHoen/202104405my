<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="newline" value="\n"/>

<title>회원등록</title>


	<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" >
	<!-- Main content -->
		<div class="regist">
			<!-- form start -->
			<div class="card">				
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="regist.do" method="post">				
						  <div class="form-group row">
							 <label for="title" class="col-sm-1" style="font-size:0.9em;" >
							 	제목</label>	
							<div class="col-sm-11 input-group input-group-sm">
								<input name="modititle" type="text" class="form-control" id="title" value=${modifyNotice.title } >
							</div>								
						</div>
						<div class="form-group row">
							<label for="writer" class="col-sm-1" style="font-size:0.9em;">
								작성자</label>
							<div class="col-sm-11 input-group-sm">								
								<input class="form-control" name="modiwriter" type="text" class="form-control" id="writer" value="${loginUser.id }" readonly/>
							</div>
							
						</div>
						<div class="form-group row">
							<label for="startdate" class="col-sm-1" style="font-size:0.9em;">시작일 </label>
							<div class="col-sm-5 input-group-sm">
								<input name="modistartdate" type="date" class="form-control" id="startdate" value=<fmt:formatDate value="${modifyNotice.startDate }" pattern="yyyy-MM-dd "/> />
							</div>
							<label for="enddate" class="col-sm-1" style="font-size:0.9em;">종료일 </label>
							<div class="col-sm-5 input-group-sm">
								<input name="modienddate" type="date" class="form-control" id="enddate" value=<fmt:formatDate value="${modifyNotice.endDate }" pattern="yyyy-MM-dd " /> />
							</div>
						</div>
						<div class="form-group row">
						</div>
						<div class="form-group row">
							<label for="content" class="col-sm-1" style="font-size:0.9em;" >내용</label>
							<div class="col-sm-11">
								<textarea class="form-control" name="modicontent" class="form-control" id="summernote" style = "height:500px;"  >${modifyNotice.content }</textarea>
							</div>
						</div>					
						
						<div class="card-footer">
							<div class="row">								
							 	<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="location.href='/notice/list.do'"
										class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
								</div>
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="modify_go();" class="btn btn-info">&nbsp;&nbsp;&nbsp;수 &nbsp;&nbsp;정&nbsp;&nbsp;&nbsp;</button>
							 	</div>
							 	
							</div>
						</div>
					</form>					
				</div><!-- register-card-body -->
			</div>
		</div>
</div>
<!-- /.content-wrapper -->

<form id="modifyForm" >
	<input type='hidden' name="nno" value="" />
	<input type='hidden' name="title" value="" />
	<input type='hidden' name="content" value="" />
	<input type='hidden' name="startdate" value="" />
	<input type='hidden' name="enddate" value="" />
	 <input type='hidden' name="page" value="" />
   <input type='hidden' name="perPageNum" value=""/>
   <input type='hidden' name="searchType" value="" />
   <input type='hidden' name="keyword" value="" />
</form>

<script>
function modify_go(url){
	if(!url) url="modify.do";
	
	if($('input[name="modititle"]').val() == "" || $('textarea[name="modicontent"]').val() == ""){
		alert("제목 또는 내용이 입력되지 않았습니다.");
		return;
	}
	
	var nowdate = "<c:out value='${nowDate}'/>";
	console.log(nowdate);
	
	
	if($('input[name="modienddate"]').val() <= nowdate && $('input[name="modienddate"]').val() != ""){
		alert("오늘날짜 또는 오늘보다 이전날짜를 선택할수 없습니다.");
		return;
	}
	
	var modifyForm=$('#modifyForm');
	var jobForm=$('#jobForm');
	var modifynno = "<c:out value='${modifynno }'/>";
	
	console.log(modifynno);
	console.log($('textarea[name="modicontent"]').val())
	modifyForm.find("[name='nno']").val(modifynno);
	modifyForm.find("[name='title']").val($('input[name="modititle"]').val());
	modifyForm.find("[name='content']").val($('textarea[name="modicontent"]').val());
	modifyForm.find("[name='startdate']").val($('input[name="modistartdate"]').val());
	modifyForm.find("[name='enddate']").val($('input[name="modienddate"]').val());
    jobForm.find("[name='page']").val(1);
    jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
    jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
    jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	
	modifyForm.attr({
		action:url,
		method:'get'
	}).submit();
	
}
</script>

<script>
document.addEventListener("DOMContentLoaded", function(){
	$('#summernote').summernote({
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['help','codeview']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			  height: 290,                 // 에디터 높이
			  width: 680,
		  minHeight: 290,             // 최소 높이
		  maxHeight: 290,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다. 이미지의 최대 사이즈는 650x650픽셀입니다.',	//placeholder 설정
		  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}
	    
	});
	
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		console.log(file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/notice/uploadimg.do",
			contentType : false,
			processData : false,
			success : function(data) {
	        	//항상 업로드된 파일의 url이 있어야 한다.
	        	console.log(data);
	        	$(editor).summernote('insertImage', data, function($data){
					$data.css('max-width',650)
					$data.css('max-height',650)
				});
	        	
	        	
			},
			dataType : 'json'
		});
	}
	
	
});
</script>













