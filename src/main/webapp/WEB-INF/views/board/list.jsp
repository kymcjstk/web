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
 
 <!--  페이징 기능 추가필요 -->
 
 </body>
 </html>