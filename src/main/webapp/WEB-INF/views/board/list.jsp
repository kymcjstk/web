<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>

<table class="table table-bordered">
     <tbody>
     <tr>
         <th style="width: 10px">NO_${search}</th>
         <th>제목</th>
         <th style="width: 100px">작성자_${boardvo}</th>
         <th style="width: 150px">작성시간</th>
         <th style="width: 50px">조회</th>
     </tr>
     <c:choose>
     	<c:when test="${fn:length(list) > 0}">
        	<c:set var="cnt" value="${fn:length(list)}" />
    	</c:when>
    	<c:otherwise>
    		<c:set var="cnt" value="0" />
    	</c:otherwise>
     </c:choose>
     <c:choose>
     	<c:when test="${cnt eq '0'}">
        <tr>
        	<td>     
                     없음
            </td>
        </tr>
    	</c:when>
    	<c:otherwise>
    		<c:forEach var="boardVO" varStatus="i" items="${list}">
	     <tr>
	         <td>${boardVO.bno}</td>
	         <td><a href="${path}/board/read?bno=${boardVO.bno}">${boardVO.title}</a></td>
	         <td>${boardVO.writer}</td>
	         <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
	         <td><span class="badge bg-aqua">${boardVO.viewcnt}</span></td>
	     </tr>
		     </c:forEach>
    	</c:otherwise>
      </c:choose>
     </tbody>
 </table>
 
 <table>
	 <tr>
		 <td>
		 <%--페이징영역--%>
             <div class="text-center">
                 <ul class="pagination">
                     <%--prev가 true 일 경우--%>
                     <c:if test="${pageMaker.prev}">
                         <%--UriComponents를 사용--%>
                         <li><a href="${path}/board/list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
                     </c:if>
                     <%--시작 페이지 ~ 마지막 페이지까지 반복--%>
                     <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                         <%--현재 목록 페이지가 idx와 일치하면 현재페이지 표시--%>
                         <li <c:out value="${pageMaker.criteria.page == idx? 'class=active':''}"/>>
                                 <%--UriComponents를 사용--%>
                             <a href="${path}/board/list${pageMaker.makeSearch(idx)}">${idx}</a>
                         </li>
                     </c:forEach>
                     <%--next가 true이고 endPage가 0이상일 경우--%>
                     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                         <%--UriComponents를 사용--%>
                         <li><a href="${path}/board/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
                     </c:if>
                 </ul>
             </div>

	         <div class="box-footer">
	             <br/>
	             <div class="form-group col-sm-2">
	             <form name="form" id="form" action="${path}/board/list" method="post" >
	             	<input type="text" name="title" id="title" value="1" />
	                 <select class="form-control" name="searchType" id="searchType">
	                     <option value="n" <c:out value="${search.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
	                     <option value="t" <c:out value="${search.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
	                     <option value="c" <c:out value="${search.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
	                     <option value="w" <c:out value="${search.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
	                     <option value="tc" <c:out value="${search.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
	                     <option value="cw" <c:out value="${search.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
	                     <option value="tcw" <c:out value="${search.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
	                 </select>
	             </div>
	             <div class="form-group col-sm-10">
	                 <div class="input-group">
	                     <input type="text" class="form-control" name="keyword" id="keywordInput" value="${search.keyword}" placeholder="검색어">
	             </form>
	                     <span class="input-group-btn">
	                         <button type="button" class="btn btn-primary btn-flat" id="searchBtn" onclick="search();">
	                             <i class="fa fa-search"></i> 검색
	                         </button>
	                     </span>
	                 </div>
	             </div>
	         </div>
		 </td>
	 </tr>	 
</table>
<script type="text/javascript">

	function search()
	{
		var f = document.getElementById("form");
        f.action = '${path}/board/list';
        f.submit();
    }
    
</script>
 1. eq (==)
 비교하고자 하는 값이 동일한지를 확인할때 사용한다.

2. ne (!=)
 비교하는 값이 동일하지 않은지 확인할때 사용한다.

3. empty (== null)
 비교하는 값이 null 인지 확인할때 사용한다. 
 * null이 아닌경우를 표현할때는 !empty 로 표현하면 된다.

<c:if test="${empty name}">
    홍길동이 아닙니다.
</c:if>
 
 <!--  페이징 기능 추가필요 -->
 
 </body>
 </html>