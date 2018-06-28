<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
<div class="wrapper">
    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                회원 프로필 페이지
                <small>스프링연습예제</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> user</a></li>
                <li class="active">profile</li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">

            <div class="row">
                <div class="col-md-5">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle"
                                 src="${path}/dist/img/profile/${login.uimage}" alt="User profile picture">

                            <h3 class="profile-username text-center">${login.uname}</h3>
                            <div class="text-center">
                                <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userPhotoModal">
                                    <i class="fa fa-photo"> 프로필사진 수정</i>
                                </a>
                            </div>
                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>아이디</b> <a class="pull-right">${login.uid}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>이메일</b> <a class="pull-right">${login.uemail}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>가입일자</b>
                                    <a class="pull-right">
                                        <fmt:formatDate value="${login.regdate}" pattern="yyyy-MM-dd a hh:mm"/>
                                    </a>
                                </li>
                                <li class="list-group-item">
                                    <b>최근 로그인 일자</b>
                                    <a class="pull-right">
                                        <fmt:formatDate value="${login.logdate}" pattern="yyyy-MM-dd a hh:mm"/>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="box-footer text-center">
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userInfoModal">
                                <i class="fa fa-info-circle"> 회원정보 수정</i>
                            </a>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userPwModal">
                                <i class="fa fa-question-circle"> 비밀번호 수정</i>
                            </a>
                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userOutModal">
                                <i class="fa fa-user-times"> 회원 탈퇴</i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#myPosts" data-toggle="tab"><i class="fa fa-pencil-square-o"></i> 나의 게시물</a></li>
                            <li><a href="#myReplies" data-toggle="tab"><i class="fa fa-comment-o"></i> 나의 댓글</a></li>
                            <li><a href="#myBookmarks" data-toggle="tab"><i class="fa fa-bookmark-o"></i> 나의 스크랩</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="myPosts">
                                <table id="myPostsTable" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 20px">번호</th>
                                            <th>제목</th>
                                            <th style="width: 150px">작성시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="boardVO" varStatus="i" items="${userBoardList}">
                                    <tr>
                                        <td>${i.index + 1}</td>
                                        <td>
                                            <a href="${path}/board/read?bno=${boardVO.bno}">
                                                <c:choose>
                                                    <c:when test="${fn:length(boardVO.title) > 30}">
                                                        <c:out value="${fn:substring(boardVO.title, 0, 29)}"/>....
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${boardVO.title}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                        </td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${boardVO.regdate}"/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="myReplies">
                                <table id="myRepliesTable" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 10px">번호</th>
                                            <th style="width: 250px">게시글 제목</th>
                                            <th style="width: 250px">내용</th>
                                            <th style="width: 150px">작성시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="userReply" varStatus="i" items="${userReplies}">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>
                                                <a href="${path}/board/read?bno=${userReply.boardVO.bno}">
                                                    <c:choose>
                                                        <c:when test="${fn:length(userReply.boardVO.title) > 10}">
                                                            <c:out value="${fn:substring(userReply.boardVO.title, 0, 9)}"/>....
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${userReply.boardVO.title}"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:length(userReply.replytext) > 10}">
                                                        <c:out value="${fn:substring(userReply.replytext, 0, 9)}"/>....
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${userReply.replytext}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${userReply.regdate}"/></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="myBookmarks">
                                <table id="myBookmarksTable" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 10px">번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="bookmark" varStatus="i" items="${bookmarkList}">
                                        <tr>
                                            <td>${i.index + 1}</td>
                                            <td>
                                                <a href="${path}/board/read?bno=${bookmark.boardVO.bno}">
                                                    <c:choose>
                                                        <c:when test="${fn:length(bookmark.boardVO.title) > 30}">
                                                            <c:out value="${fn:substring(bookmark.boardVO.title, 0, 29)}"/>....
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${bookmark.boardVO.title}"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </td>
                                            <td>${bookmark.boardVO.writer}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>
    <%-- /.content-wrapper --%>

</div>
<%-- ./wrapper --%>

</body>
</html>