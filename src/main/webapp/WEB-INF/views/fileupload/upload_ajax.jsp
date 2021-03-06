<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html><script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<style>
    .fileDrop {
        width: 100%;
        height: 200px;
        border: 2px dotted #0b58a2;
    }

    small {
        margin-left: 3px;
        font-weight: bold;
        color: grey;
    }
</style>
<body class="hold-transition skin-blue sidebar-mini layout-boxed">
<div class="wrapper">

    <%--main_header.jsp--%>
    <%-- Main Header --%>
    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                파일 업로드 (Ajax)
                <small>스프링연습예제</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> fileupload</a></li>
                <li class="active">ajax form</li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">파일 업로드 (Ajax) 입력폼</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <div class="fileDrop">
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <p class="text-center">파일을 드래그해주세요.</p>
                        </div>
                        <hr/>
                        <div class="uploadedList"></div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <div class="form-group pull-right">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 저장</button>
                        </div>
                    </div>
                    <!-- /.box-footer -->
                </div>
            </div>
        </section>
        <%-- /.content --%>
    </div>
    <%-- /.content-wrapper --%>

</div>
<%-- ./wrapper --%>
<script>
    
    $(".fileDrop").on("dragenter dragover", function (event) {
        event.preventDefault();
    });

    $(".fileDrop").on("drop", function (event) {
        event.preventDefault();

        var files = event.originalEvent.dataTransfer.files;

        var file = files[0];

        //console.log(file);

        var formData = new FormData();

        formData.append("file", file);

        $.ajax({
            url: "${path}/fileupload/uploadAjax",
            data: formData,
            dataType: "text",
            processData: false,
            contentType: false,
            type: "POST",
            success: function (data) {
                alert(data);
                var str = "";
                if (checkImageType(data)) {
                    str = "<div>"
                            + "<a href='displayFile?fileName="+getImageLink(data)+"'>"
                                + "<img src='displayFile?fileName=" + data + "'/>"
                            + "</a> <small data-src="+data+">X</small>"
                        + "</div>";
                } else {
                    str = "<div>"
                            + "<a href='displayFile?fileName="+data+"'>"
                                + getOriginalName(data)
                            + "</a><small data-src="+data+">X</small>"
                        + "</div>";
                }
                $(".uploadedList").append(str);
            }
        });
    });
    
    function checkImageType(fileName) {

        var pattern = /jpg$|gif$|png$|jpge$/i;

        return fileName.match(pattern);
    }

    function getOriginalName(fileName) {
        if (checkImageType(fileName)) {
            return;
        }
        var idx = fileName.indexOf("_") + 1;
        return fileName.substr(idx);
    }

    function getImageLink(fileName) {
        if (!checkImageType(fileName)) {
            return;
        }
        var front = fileName.substr(0, 12); // /년/월/일 경로 추출
        var end = fileName.substr(14);      // _s 썸네일 표시 제거
        return front + end;
    }

    // 파일 삭제 처리
    $(".uploadedList").on("click", "small", function (event) {
        var that = $(this);
        $.ajax({
            url: "${path}/fileupload/deleteFile",
            type: "post",
            data: {fileName:$(this).attr("data-src")},
            dataType: "text",
            success: function (result) {
                if (result == "DELETED") {
                    alert("삭제되었습니다.");
                    that.parent("div").remove();
                }
                
            }
        });
    })
    
</script>
</body>
</html>