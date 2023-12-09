<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>矩阵综合运算系统</title>
  <link rel="stylesheet" href="assets/css/main.css">
  <link rel="stylesheet" href="assets/css/base.css">
  <link rel="icon" href="assets/images/favicon.png">
</head>
<body>

<div class="container">
  <div class="titled">
    <p>${param.title}</p>
  </div>
  <%--    导航栏--%>
  <div class="content">
    <div class="grid-item-nav navi">
      <ul>
        <li class="${param.action eq 'index' ? "active":null}"><a href="index.jsp">主页</a></li>
        <li class="${param.action eq 'plus-sub'? "active":null}"><a href="matrixPlusAndSub.jsp">矩阵加减法</a></li>
        <li class="${param.action eq 'multi'? "active":null}"><a href="matrixMulti.jsp">矩阵乘法</a></li>
        <li class="${param.action eq 'transpose'? "active":null}"><a href="matrixTranspose.jsp">矩阵转置</a></li>
        <li class="${param.action eq 'rank'? "active":null}"><a href="matrixRank.jsp">矩阵的秩</a></li>
        <li class="${param.action eq 'determinant'? "active":null}"><a href="matrixDeterminant.jsp">矩阵的行列式</a></li>
        <li class="${param.action eq 'adjoint'? "active":null}"><a href="matrixAdjoint.jsp">伴随矩阵</a></li>
        <li class="${param.action eq 'inverse'? "active":null}"><a href="matrixInversion.jsp">逆矩阵</a></li>
        <li class="${param.action eq 'help'? "active":null}"><a href="help.jsp">使用说明</a></li>
      </ul>
    </div>