<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>
    
    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                게시판 예제
                <small>조회페이지</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 게시판</a></li>
                <li class="active">조회_${boardVO.viewcnt}</li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">

            <div class="col-lg-12">

                <%--게시글 영역--%>
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">제목 : ${boardVO.title}</h3>
                        <ul class="list-inline pull-right">
                            
                        </ul>
                    </div>

                    <div class="box-body" style="height: 600px">
                        <p>
                            ${boardVO.content}
                        </p>
                    </div>
                    <div class="box-footer">
                        <div class="user-block">
                            <span class="username">작성자:
                                <a href="#">${boardVO.writer}</a>
                            </span>
                            <span class="description"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></span>
                        </div>
                    </div>
                </div>

                <%--버튼 영역--%>
                <div>
                    <%--이전 목록의 페이지 정보, 검색정보를 가지고 페이지 이동을 위한 값들 세팅--%>
                    <form role="form">
                        <input type="text" name="bno" value="${boardVO.bno}">
                        <input type="text" name="page" value="${search.page}">
                        <input type="text" name="perPageNum" value="${search.perPageNum}">
                        <input type="text" name="searchType" value="${search.searchType}">
                        <input type="text" name="keyword" value="${search.keyword}">
                    </form>

                    <button type="submit" class="btn btn-warning modBtn">수정</button>
                    <button type="submit" class="btn btn-danger delBtn">삭제</button>
                    <button type="submit" class="btn btn-primary listBtn pull-right">목록</button>
                </div>
                <br/>


               

            </div>
        </section>
    </div>
</div>
<%-- ./wrapper --%>

<%--plugin_js.jsp--%>
<script>
    $(document).ready(function () {

        var formObj = $("form[role='form']");
        console.log(formObj);

        // 수정버튼 클릭시
        $(".modBtn").on("click", function () {
           formObj.attr("action", "${path}/board/modify");
           formObj.attr("method", "get");
           formObj.submit();
        });

        // 삭제 버튼 클릭시
        $(".delBtn").on("click", function () {
            formObj.attr("action", "${path}/board/remove");
            formObj.attr("method", "post");
            formObj.submit();
        });

        // 목록 버튼 클릭시
        $(".listBtn").on("click", function () {
            $("input[name=bno]").remove();
            formObj.attr("action", "${path}/board/list");
            formObj.attr("method", "get");
            formObj.submit();
        });

        // 수정완료시
        var result = "${msg}";
        if (result == "MODIFY") {
            alert("게시글이 수정되었습니다.");
        }

    })
</script>
</body>
</html>