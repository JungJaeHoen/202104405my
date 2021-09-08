<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />

<head></head>

<title>공지목록</title>

<body>
    <!-- Main content -->
   <section class="content-header">
        <div class="container-fluid">
           <div class="row md-2">
              <div class="col-sm-6">
                 <h1>공지목록</h1>              
              </div>
              <div class="col-sm-6">
                 <ol class="breadcrumb float-sm-right">
                 <li class="breadcrumb-item">
                    <a href="list.do">
                       <i class="fa fa-dashboard"></i>공지
                    </a>
                 </li>
                 <li class="breadcrumb-item active">
                    목록
                 </li>              
            </ol>
              </div>
           </div>
        </div>
   </section>


      <section class="content">
         <div class="card col-sm-12">
            <div class="card-header with-border">
               <button type="button" class="btn btn-primary" onclick="fn_regist()" >공지등록</button>
               <div id="keyword" class="card-tools" style="width:550px;">
                   <div class="input-group row">
                      <!-- search bar -->
                      
                       <!-- sort num -->
                    <select class="form-control col-md-3" name="perPageNum" id="perPageNum"
                       onchange="list_go(1);">
                       <option value="10" >정렬개수</option>
                       <option value="2" ${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>
                       <option value="3" ${cri.perPageNum == 3 ? 'selected':''}>3개씩</option>
                       <option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
                       
                    </select>
                    
                      <!-- search bar -->
                   <select class="form-control col-md-3" name="searchType" id="searchType">
                     <option value=""  ${cri.searchType eq '' ? 'selected':''}>검색구분</option>
                     <option value="t"  ${cri.searchType eq 't' ? 'selected':''}>제목</option>
                     <option value="w"  ${cri.searchType eq 'w' ? 'selected':''}>작성자</option>
                     <option value="c"  ${cri.searchType eq 'c' ? 'selected':''}>내용</option>
                     <option value="wc"  ${cri.searchType eq 'wc' ? 'selected':''}>작성자+내용</option>
                     <option value="tc"  ${cri.searchType eq 'tc' ? 'selected':''}>제목+내용</option>
                     <option value="tw"  ${cri.searchType eq 'tw' ? 'selected':''}>제목+작성자</option>
                     <option value="twc"  ${cri.searchType eq 'twc' ? 'selected':''}>제목+작성자+내용</option>
                  </select>
                  <!-- keyword -->
                      <input  class="form-control" type="text" name="keyword" 
                              placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
                  <span class="input-group-append">
                     <button class="btn btn-primary" type="button" 
                           id="searchBtn" data-card-widget="search" onclick="list_go(1);">
                        <i class="fa fa-fw fa-search"></i>
                     </button>
                  </span>
               <!-- end : search bar -->      
                   </div>
               </div>            
            </div>
            
 
          
            <div class="card-body" style="text-align:center; height:720px;">
            <div class="row">
                <div class="col-sm-6" style="height:677px;">   
                <table class="table table-bordered">
	           		 <tr style="height:30px;">
	                 <th>글번호</th>
	                 <th>제목</th>
	                 <th>작성자</th>
	                 <th>작성일</th>
	                 <th>조회수</th> <!-- yyyy-MM-dd  -->
	                </tr>
	          
	                <c:forEach items="${noticeList }" var="notice" >
	                  <tr style="cursor:pointer; height:61px;" onclick="noticeDetail(${notice.nno});">
	                   <td class = "noticennos">${notice.nno }</td>
	                   	<c:if test="${notice.title.length() gt 13 }">
		                   <td>${notice.title.substring(0,13) }..</td>
	                   	</c:if>
	                   	<c:if test="${notice.title.length() le 13 }">
		                   <td>${notice.title }</td>
	                   	</c:if>
	                   <td>${notice.writer }</td>
	                   <td>
	                      <fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd"/>
	                   </td>
	                   <td>${notice.viewcnt }</td>
	                 </tr>
	                </c:forEach>      
                  </table>
               </div> <!-- col-sm-6 -->
         	   <div class="col-sm-6" id="detailDiv">   
            	 <c:if test="${modifyFlag eq true }">
            	 	 <script>
            	 	 	const detailDiv = document.getElementById('detailDiv');
            	 	 	detailDiv.classList.remove('noticeDetail');
            	 	 </script>
                     <%@ include file="/WEB-INF/views/notice/modifyForm.jsp" %>
            	 </c:if>
             	 <table class="table table-bordered noticeDetail">
            	 </table>
            	</div><!-- col-sm-6 -->
              </div> <!-- row -->
          </div> <!-- card-body -->
          
            
            
          
          
          <div class="card-footer">
             <!-- pagenation -->
             <nav aria-label="Navigation">
                <ul class="pagination justify-content-center m-0">
                   <li class="page-item">
                     <a class="page-link" href="javascript:list_go(1);">
                        <i class="fas fa-angle-double-left"></i>
                     </a>
                  </li>
                  <li class="page-item">
                     <a class="page-link" 
                     href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
                        <i class="fas fa-angle-left"></i>
                     </a>
                  </li>
                  <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
                     <li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
                        <a class="page-link" href="javascript:list_go('${pageNum}');" >
                        ${pageNum }</a>
                     </li>
                  </c:forEach>
                  <li class="page-item">
                     <a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
                        <i class="fas fa-angle-right" ></i>
                     </a>
                  </li>
                  <li class="page-item">
                     <a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
                        <i class="fas fa-angle-double-right"></i>
                     </a>
                  </li>   
                </ul>
             </nav>
          </div>
        </div>
      </section>
      
      

<form id="jobForm">
   <input type='hidden' name="page" value="" />
   <input type='hidden' name="perPageNum" value=""/>
   <input type='hidden' name="searchType" value="" />
   <input type='hidden' name="keyword" value="" />
</form>


<script>
var modiflag  = "<c:out value='${modifyFlag}'/>";
   function list_go(page,url){
	   if(modiflag == 'true'){
		   alert('수정화면을 닫아주세요!');
		   return;
	   }
	   $('.noticeDetailTrs').remove();
	   
      if(!url) url="list.do";
      
      var jobForm=$('#jobForm');
      
      jobForm.find("[name='page']").val(page);
      jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
      jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
      jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
      
      jobForm.attr({
         action:url,
         method:'get'
      }).submit(); 
   }
   
   //팝업창들 뛰우기
   //새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
   function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
      winleft = (screen.width - WinWidth) / 2;
      wintop = (screen.height - WinHeight) / 2;
      var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
                        +"height="+ WinHeight +", top="+ wintop +", left=" 
                        + winleft +", resizable=yes, status=yes"  );
      win.focus() ; 
   }

   //팝업창 닫기
   function CloseWindow(parentURL){
      if(parentURL){
         window.opener.parent.location.href=parentURL;
      }else{
         window.opener.parent.location.reload(true);   
      }
      window.close();
   }

   function noticeDetail(nno){
// 	   console.log(!modiflag);
	   if(modiflag == 'false'){
		   $.getJSON("/notice/detail.do?nno="+nno,function(data){
			   
			   printData(data,$('.noticeDetail'),$('#noticeDetail-template'),'.noticeDetailTrs')
			   
		   });
	   }else{
		   alert()
	   }
   }
   //handle바스 print
   function printData(dataArr,target,templateObject,removeClass){
	
	var template=Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
}

   function fn_regist(){
	   var authority = "<c:out value='${loginUser.authority}'/>";
	   
	   
	   
	   if(authority == 'ROLE_USER'){
		   alert('일반회원은 공지를 등록할 수 없습니다.');
	   }else{
		   location.href='/notice/registForm.do'
	   }
   }
   
   function fn_remove(nno){
	   
	  var nowid = "<c:out value='${loginUser.id}'/>";
	  var writerid = $('#noticeWriter').html();
	  
	  
// 	  console.log(nowid);
// 	  console.log(writerid);
// 	  console.log(nno);
	  
	  if(nowid == writerid){
		 var con = confirm('정말로 삭제하시겠습니까?');
		 if(con == true){
			 location.href='/notice/remove.do?removenno='+nno;
		 }
	  }else{
		  alert('본인이 작성한 게시글만 삭제할 수 있습니다.');
	  }
	  
	  
   }
   
   function fn_modify(nno){
	  var nowid = "<c:out value='${loginUser.id}'/>";
	  var writerid = $('#noticeWriter').html();
	   
	  if(nowid == writerid){
			 location.href='/notice/modifyForm.do?modifynno='+nno;
	  }else{
		  alert('본인이 작성한 게시글만 수정할 수 있습니다.');
	  }
	   
	   
   }
   
   window.onload=function(){
	   var modiflag  = "<c:out value='${modifyFlag}'/>";
// 	   console.log(typeof modiflag);
// 	   console.log(!modiflag);
	   if(modiflag == 'false'){
		   var nno = document.getElementsByClassName('noticennos')[0].innerText;
		   noticeDetail(nno);	   
	   }
	 }
   
</script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="noticeDetail-template" >
	<tr class="noticeDetailTrs">
		<td><span style="font-weight: 900;" >제목</span></td>
		<td colspan ="2" style="width : 400px;">{{title}}</td>
		<td><span style="font-weight: 900;" >조회수</span> </td>
		<td colspan ="2">{{viewcnt}}</td>
	</tr>
	<tr class="noticeDetailTrs">
		<td><span style="font-weight: 900;"  >작성자</span> </td>
		<td colspan = "2" id="noticeWriter" >{{writer}}</td>
		<td><span style="font-weight: 900;" >작성일/수정일</span> </td>
		<td colspan = "2">
			{{updateDate}}
		</td>
	</tr>
	<tr class="noticeDetailTrs">
		<td><span style="font-weight: 900;" >시작일</span> </td>
		<c:out value="{{startDate}}" escapeXml="false" />
		<td colspan="2">{{startDate}}</td>
		<td><span style="font-weight: 900;" >종료일</span> </td>
		<td colspan="2">{{{endDate}}}</td>
	</tr>
	<tr class="noticeDetailTrs"  >
		<td>
			<span style="font-weight: 900;"  >내용</span>
		</td>
		<td colspan = "5" style="height : 450px; text-align:left; width:400px; table-layout: fixed; ">
			<div style="overflow-y:auto; height:100%; width:100%">
				{{{content}}}
			</div>
		</td>
	</tr>
	<tr class="noticeDetailTrs">
		<td colspan="6">
		<button type="button" class="btn btn-primary" onclick="fn_modify({{nno}})" >게시글수정</button>
		<button type="button" class="btn btn-primary" onclick="fn_remove({{nno}});" >게시글삭제</button>
		</td>
	</tr>
</script>
<!-- handlebarsend -->


</body>




