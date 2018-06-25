<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>

    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                게시판 
                <small>입력페이지</small>
            </h1>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">

            <div class="col-lg-12">
                <form role="form" method="post" action="${path}/board/register">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">게시글 입력</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label>제목</label>
                                <input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요 ...">
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력해주세요 ..." style="resize: none;"></textarea>
                            </div>

                            <div class="form-group">
                                <label>작성자</label>
                                <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력해주세요 ...">
                            </div>

                        </div>
                        <div class="box-footer">
                            <button type="reset" class="btn btn-primary">초기화</button>
                            <button type="submit" class="btn btn-primary">저장</button>
                        </div>
                    </div>
                </form>
            </div>

        </section>
        <%-- /.content --%>
    </div>
</div>
</body>
</html>