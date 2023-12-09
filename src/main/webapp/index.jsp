<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="index"/>
    <jsp:param name="title" value="矩阵综合运算系统"/>
</jsp:include>
<div class="grid-item content-item">
    <div class="body">
        <div class="container-index">
            <h2 class="h1">欢迎来到矩阵综合运算系统</h2>
            <p class="p">这是一个用于矩阵运算的方便工具。</p>

            <a class="button" href="help.jsp">开始</a>
        </div>
    </div>
</div>
<style>

    .body {
        font-family: Arial, Helvetica, sans-serif;
        background-color: rgba(0,0,0,0);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        /*height: 100vh;*/
    }

    .container-index {
        text-align: center;
        padding: 20px;
    }

    .h1 {
        color: #333;
    }

    .p {
        color: #777;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #468a46;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        margin: 10px;
        transition: background-color 0.3s ease;
    }

    .button:hover {
        background-color: #0056b3;
    }
</style>
<jsp:include page="/WEB-INF/templates/footer.jsp"/>