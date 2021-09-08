<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<title>공지등록</title>

<body style="width:100%; height:100%;">

	<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" >
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공지등록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="#">
				        	<i class="fa fa-dashboard">공지</i>
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	등록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
  	</section>
	<!-- Main content -->
		<div class="regist">
			<!-- form start -->
			<div class="card">				
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="regist.do" method="post">						
						  <div class="form-group row">
							 <label for="title" class="col-sm-3" style="font-size:0.9em;" >
							 	제목</label>	
							<div class="col-sm-9 input-group input-group-sm">
								<input name="title" type="text" class="form-control" id="title" >
							</div>								
						</div>
						<div class="form-group row">
							<label for="writer" class="col-sm-3" style="font-size:0.9em;">
								작성자</label>
							<div class="col-sm-9 input-group-sm">								
								<input class="form-control" name="writer" type="text" class="form-control" id="writer" value="${loginUser.id }" readonly/>
							</div>
							
						</div>
						<div class="form-group row">
							<label for="startdate" class="col-sm-3" style="font-size:0.9em;">시작일</label>
							<div class="col-sm-9 input-group-sm">
								<input name="startdate" type="date" class="form-control" id="startdate"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="enddate" class="col-sm-3" style="font-size:0.9em;">종료일</label>
							<div class="col-sm-9 input-group-sm">
								<input name="enddate" type="date" class="form-control" id="enddate"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="content" class="col-sm-3" style="font-size:0.9em;" >내용</label>
							<div class="col-sm-9 input-group-sm">
								<textarea class="form-control" name="content" class="form-control" id="summernote" style = "height:500px;"></textarea>
							</div>
						</div>					
						
						<div class="card-footer">
							<div class="row">								
							 	<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="location.href='/notice/list.do'"
										class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
								</div>
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="regist_go();" class="btn btn-info">&nbsp;&nbsp;&nbsp;등 &nbsp;&nbsp;록&nbsp;&nbsp;&nbsp;</button>
							 	</div>
							 	
							
							</div>
						</div>
					</form>					
				</div><!-- register-card-body -->
			</div>
		</div>
</div>
<!-- /.content-wrapper -->

<form id="registForm" >
	<input type='hidden' name="title" value="" />
	<input type='hidden' name="writer" value="" />
	<textarea style="display: none;" name="content" ></textarea>
	<input type='hidden' name="startdate" value="" />
	<input type='hidden' name="enddate" value="" />
</form>

<script>
function regist_go(url){
	if(!url) url="regist.do";
	
	if($('input[name="title"]').val() == "" || $('textarea[name="content"]').val() == ""){
		alert("제목 또는 내용이 입력되지 않았습니다.");
		return;
	}
	
	
	var nowdate = "<c:out value='${nowDate}'/>";
	console.log(nowdate);
	
	
	if($('input[name="enddate"]').val() <= nowdate && $('input[name="enddate"]').val() != ""){
		alert("종료날짜를 오늘날짜 또는 오늘보다 이전날짜를 선택할수 없습니다.");
		return;
	}
	
	var registForm=$('#registForm');
	
	registForm.find("[name='title']").val($('input[name="title"]').val());
	registForm.find("[name='writer']").val($('input[name="writer"]').val());
	registForm.find("[name='content']").val($('textarea[name="content"]').val());
	registForm.find("[name='startdate']").val($('input[name="startdate"]').val());
	registForm.find("[name='enddate']").val($('input[name="enddate"]').val());
	
	registForm.attr({
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
			  height: 550,                 // 에디터 높이
			  width: 1195,
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
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
	        	console.log(data.url);
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




</body>










