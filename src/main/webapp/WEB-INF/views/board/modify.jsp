<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>

    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                게시판 예제
                <small>수정페이지</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 게시판</a></li>
                <li class="active">수정</li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">

            <div class="col-lg-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">게시글 수정</h3>
                        </div>
                        <form role="form" method="post" action="${path}/board/modify">
                            <div class="box-body">

                                <%--이전의 목록 페이지 정보, 검색정보 를 가지고 페이지 이동을 위한 값들 세팅--%>
                                <input type="hidden" name="page" value="${criteria.page}">
                                <input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
                                <input type="hidden" name="searchType" value="${criteria.searchType}">
                                <input type="hidden" name="keyword" value="${criteria.keyword}">

                                <div class="form-group">
                                    <label for="bno">게시글 번호</label>
                                    <input type="text" id="bno" name="bno" class="form-control" value="${boardVO.bno}" readonly="readonly">
                                </div>

                                <div class="form-group">
                                    <label for="title">제목</label>
                                    <input type="text" id="title" name="title" class="form-control" value="${boardVO.title}" >
                                </div>

                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea class="form-control" id="content" name="content" rows="10" style="resize: none;">${boardVO.content}</textarea>
                                </div>

                                <div class="form-group">
                                    <label for="writer">작성자</label>
                                    <input type="text" class="form-control" id="writer" name="writer" value="${boardVO.writer}" readonly="readonly">
                                </div>

                            </div>
                        </form>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-warning modifyBtn">수정</button>
                            <button type="submit" class="btn btn-danger cancelBtn">취소</button>
                            <button type="submit" class="btn btn-primary listBtn pull-right">목록</button>
                        </div>
                    </div>

            </div>

        </section>
        <%-- /.content --%>
    </div>
    <%-- /.content-wrapper --%>
</div>

<script>
    $(document).ready(function () {

        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modifyBtn").on("click", function () {
            formObj.submit();
        });
        
        $(".cancelBtn").on("click", function () {
            self.location = "/board/read?bno="+"${boardVO.bno}";
        });
        
        $(".listBtn").on("click", function () {
            self.location = "/board/list?page=${criteria.page}&perPageNum=${criteria.perPageNum}"
                + "&searchType=${criteria.searchType}&keyword=${criteria.keyword}";
        });

    })
</script>
</body>
</html>