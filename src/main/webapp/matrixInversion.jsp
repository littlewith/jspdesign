<%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-03
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%--逆矩阵--%>
<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="inverse"/>
    <jsp:param name="title" value="欢迎来到矩阵综合运算系统"/>
</jsp:include>

<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">
<div class="grid-item content-item">
    <div class="info">
        逆矩阵是在线性代数中与方阵相关的一个重要概念。
        <br>
        对于一个n阶方阵A，如果存在一个n阶方阵B，使得A乘以B的结果为单位矩阵I，同时B乘以A的结果也为单位矩阵I，则称B为A的逆矩阵，记作A^(-1)。
        <br>
        注意，只有方阵才有逆矩阵。
        <br>
        -->如果有问题，请看<a href="help.jsp">帮助</a>
    </div>
    <hr>
    <form action="calculateMatrix.jsp" method="post">

        <input type="hidden" value="1" name="matrixNumber">
        <input type="hidden" name="method" value="inversion">
        <input type="hidden" name="resultType" value="matrix">

        <div class="inputBox">
            <h3>在这里输入矩阵</h3>
            <div class="inputBox-item">矩阵维度：
                <label>
                    <input id="rowNumber" type="number" name="rowNumber" class="inputColumn" min="2" value="2"
                           onchange="followChangeRow()"/>行
                </label>
                <label>
                    <input id="colNumber" type="number" name="colNumber" class="inputColumn" min="2" value="2"
                           onchange="followChangeCol()"/>列
                </label>
            </div>

            <div id="notice" style="color:#980b0b;font-weight: bolder;">
            </div>
            <div class="inputBox-item">
                <button class="inputButton" onclick="constructMatrix()" id="inputDataButton">输入矩阵数据</button>
            </div>
        </div>
        <jsp:include page="/WEB-INF/composites/inputMatrix.jsp"/>
    </form>
</div>
<script>
    constructMatrix = () => {
        //定义矩阵数量
        const matrixNumber = 1;

        //获取矩阵维度
        let rowNumber = document.getElementById("rowNumber").value;
        let colNumber = document.getElementById("colNumber").value;

        if (!checkRowAndCol(rowNumber, colNumber)) {
            return;
        }

        //创建矩阵
        for (i = 0; i < matrixNumber; i++) {
            addMatrixInput(matrixNumber, rowNumber, colNumber);
        }
        openMatrixModal();
    }

    const followChangeRow = () => {
        document.getElementById("colNumber").value = document.getElementById("rowNumber").value;
    }

    const followChangeCol = () => {
        document.getElementById("rowNumber").value = document.getElementById("colNumber").value;
    }
</script>
<jsp:include page="/WEB-INF/templates/footer.jsp"/>