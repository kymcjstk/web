<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
    
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
                
                <%--댓글 등록 영역--%>
                <div class="box box-warning">
                    <div class="box-header with-border">
                        <a href="#" class="link-black text-lg"><i class="fa fa-pencil"></i> 댓글작성</a>
                    </div>
                    <div class="box-body">
                        <form class="form-horizontal">
                            <div class="form-group margin-bottom-none">
                                <div class="col-sm-8">
                                    <input class="form-control input-sm" id="newReplyText" type="text" placeholder="댓글 입력...">
                                </div>
                                <div class="col-sm-2">
                                    <input class="form-control input-sm" id="newReplyWriter" type="text" placeholder="작성자">
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <%--댓글 목록 영역--%>
                <div class="box box-success collapsed-box">
                    <div class="box-header with-border">
                        <a href="" class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i> </a>
                        <div class="box-tools">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <%--댓글 목록--%>
                    <div class="box-body repliesDiv">

                    </div>
                    <%--댓글 페이징--%>
                    <div class="box-footer">
                        <div class="text-center">
                            <ul class="pagination pagination-sm no-margin">

                            </ul>
                        </div>
                    </div>
                </div>

                <%--댓글 수정을 위한 modal 영역--%>
                <div class="modal fade" id="modModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title"></h4>
                            </div>
                            <div class="modal-body" data-rno>
                                <p><input type="text" id="replytext" class="form-control"></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-primary modalModBtn">수정</button>
                            </div>
                        </div>
                    </div>
                </div>

                <%--댓글 삭제를 위한 modal 영역--%>
                <div class="modal fade" id="delModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title"></h4>
                            </div>
                            <div class="modal-body" data-rno>
                                <p>댓글을 삭제하시겠습니까?</p>
                                <p><input type="password" id="password" class="form-control" placeholder="회원비밀번호를 입력해주세요"></p>
                                <button type="button" class="btn btn-warning">비밀번호 확인</button>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-primary modalDelBtn">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
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

     // 댓글 등록일자 출력을 위한 날짜/시간 문자열 처리
        Handlebars.registerHelper("prettifyDate", function (timeValue) {

            var dateObj = new Date(timeValue);
            var year = dateObj.getFullYear();
            var month = dateObj.getMonth() + 1;
            var date = dateObj.getDate();
            var hour = dateObj.getHours();
            var minutes = dateObj.getMinutes();
            return year+"-"+month+"-"+date + " " + hour + ":" + minutes;
        });

        // 댓글 리스트 출력 처리
        var printData = function (replyArr, target, templateObject) {

            var template = Handlebars.compile(templateObject.html());
            var html = template(replyArr);
            $(".replyDiv").remove();
            target.html(html);

        };

        // 게시글 번호
        var bno = ${boardVO.bno};
        // 댓글 페이지 초기화
        var replyPage = 1;

        getPage("${path}/replies/" + bno + "/1");

        $(".pagination").on("click", "li a", function (event) {
            event.preventDefault();
            replyPage = $(this).attr("href");
            getPage("${path}/replies/"+bno+"/"+replyPage);
        });

        // 댓글 페이징 처리
        function getPage(pageInfo) {
            
            $.getJSON(pageInfo, function (data) {
                printReplyCount(data.replyCount);
                printData(data.list, $(".repliesDiv"), $("#template"));
                printPaging(data.pageMaker, $(".pagination"))
            });
        }

        // 댓글 갯수 출력, 댓글 보기 버튼 활성/비활성
        var printReplyCount = function (replyCount) {

            if (replyCount > 0) {
                $(".replyCount").html(" 댓글목록 ("+replyCount+")");
                $(".collapsed-box").find(".box-tools").html(
                    "<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
                    + "<i class='fa fa-plus'></i>"
                    + "</button>");
            } else if (replyCount == 0) {
                $(".replyCount").html(" 댓글이 없습니다. 의견을 남겨주세요.");
                $(".collapsed-box").find(".btn-box-tool").remove();
            }

        };

        // 하단페이징
        var printPaging = function (pageMaker, target) {

            var str = "";
            if (pageMaker.prev) {
                str += "<li><a href='"+(pageMaker.startPage - 1)+"'>&laquo;</a></li>"
            }
            for (var i =  pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
                var strClass = pageMaker.criteria.page == i ? "class=active": "";
                str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>"
            }
            if (pageMaker.next) {
                str += "<li><a href='"+(pageMaker.endPage + 1)+"'>&raquo;</a></li>"
            }
            target.html(str);
        };

        // 댓글 등록
        $(".replyAddBtn").on("click", function () {

            var replyerObj = $("#newReplyWriter");
            var replytextObj = $("#newReplyText");
            var replyer = replyerObj.val();
            var replytext = replytextObj.val();

            $.ajax({
                type: "post",
                url: "${path}/replies/",
                dataType: "text",
              	//headers: {
                //    "Content-Type" : "application/json",
                //    "X-HTTP-Method-Override" : "POST"
                //},
                //data: JSON.stringify({
                //   bno:bno,
                //   replyer:replyer,
                //   replytext:replytext
                //}),
                // 위와 같이 json형식으로 전송처리 후, 해당값으로 처리가능
                data: {bno:bno,
                	replyer:replyer,
                	replytext:replytext} 
                 ,
                //post에 form처리로 처리가능
                success: function (result) {
                    console.log("result : " + result);
                    if (result == "INSERTED") {
                        alert("댓글이 등록되었습니다.");
                        replyPage = 1;
                        getPage("${path}/replies/" + bno + "/" + replyPage);
                        replyerObj.val("");
                        replytextObj.val("");
                    }
                }
            });
        });

        // 댓글 수정을 위해 modal 창에 값 출력
        $(".repliesDiv").on("click", ".replyDiv", function (event) {

            var reply = $(this);
            console.log(reply);
            $("#replytext").val(reply.find(".oldReplytext").text());
            $(".modal-title").html(reply.attr("data-rno"))

        });

        // modal 창의 댓글 수정버튼 클릭시
        $(".modalModBtn").on("click", function () {

            var rno = $(".modal-title").html();
            var replytext = $("#replytext").val();

            $.ajax({
                type: "POST",
                url: "${path}/replies/update/" + rno,
                headers: {
                    "Content-Type" : "application/json",
                    "X-HTTP-Method-Override" : "POST"
                },
                dataType: "text",
                data: JSON.stringify({
                    replytext:replytext
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result == "MODIFIED") {
                        alert("댓글이 수정되었습니다.");
                        getPage("${path}/replies/" + bno + "/" + replyPage);
                        $('#modModal').modal("hide");
                    }
                }
            })
        });

        $(".modalDelBtn").on("click", function () {

            var rno = $(".modal-title").html();
            var replytext = $("#replytext").val();

            if(confirm("댓글을 삭제하시겠습니까?")) {
            	alert(rno);

                $.ajax({
                    type: "GET",
                    url: "${path}/replies/delete/" + rno,
                    headers: {
                        "Content-Type" : "application/json",
                        "X-HTTP-Method-Override" : "GET"
                    },
                    dataType: "text",
                    success: function (result) {
                        console.log("result : " + result);
                        if (result == "DELETED") {
                            alert("댓글이 삭제되었습니다.");
                            getPage("${path}/replies/" + bno + "/" + replyPage);
                            $('#delModal').modal("hide");
                        }
                    }
                });

            }
        });
    });

</script>
<script id="template" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-rno={{rno}}>
        <div class="user-block">
            <img class="img-circle img-bordered-sm" src="/dist/img/default-user-image.jpg" alt="user image">
            <span class="username">
                <a href="#">{{replyer}}</a>
                <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    <i class="fa fa-times"> 삭제</i>
                </a>
                <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    <i class="fa fa-edit"> 수정</i>
                </a>
            </span>
            <span class="description">{{prettifyDate regdate}}</span>
        </div>
        <div class="oldReplytext">{{replytext}}</div>
        <br/>
        <ul class="list-inline">
            <li>
                <a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> 댓글 추천(0)</a>
            </li>
        </ul>
    </div>
    {{/each}}
</script>
</body>
</html>