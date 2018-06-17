<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>

<table class="table table-bordered">
     <tbody>
     <tr>
         <th style="width: 10px">NO</th>
         <th>제목</th>
         <th style="width: 100px">작성자</th>
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
		 <form name="form" id="form" action="${path}/board/list" method="post" >
		 	<input type="text" class="form-control" name="keyword" id="keyword" value="${search}" placeholder="검색어2" />
		 	<input type="text" class="form-control" name="searchType" id="searchType" value="" />
		 	<input type="text" class="form-control" name="page" id="page" value="" />
		 </form>
            <span class="input-group-btn"m>
                <button type="button" class="btn btn-primary btn-flat" id="searchBtn" onclick="search();">
                    <i class="fa fa-search"></i> 검색
                </button>
            </span>
		 </td>
	 </tr>
	 <tr>
	 <td>
	 ${pageMaker.makeSearch(pageMaker.endPage + 1)}
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