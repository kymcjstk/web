<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="/WEB-INF/views/include/header.jsp" %>
<body>
<div class="wrapper">
            <h1>
                오류 발생 페이지
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> error</a></li>
                <li class="active">exception</li>
            </ol>
        </section>

        <%-- Main content --%>
        <section class="content container-fluid">

            <h3><i class="fa fa-warning text-red"></i><c:out value="${msg}"></c:out></h3>
            
        </section>
        <%-- /.content --%>
    </div>
</div>
</body>
</html>