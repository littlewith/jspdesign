<%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-03
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%--伴随矩阵--%>
<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="adjoint"/>
    <jsp:param name="title" value="欢迎来到矩阵综合运算系统"/>
</jsp:include>

<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">
<div class="grid-item content-item">
    <div class="info">
        伴随矩阵（adjugate matrix），也称为伴随阵、伴随矩阵、伴随行列式、共轭矩阵、伴随矩阵等，是与给定矩阵的行列式和逆矩阵有密切关系的一种矩阵。
        <br>
        伴随矩阵可以用来求解线性方程组、计算矩阵的逆以及计算矩阵的秩等。
        <br>
        注意，伴随矩阵必须是方阵。
        <br>
        -->如果有问题，请看<a href="help.jsp">帮助</a>
    </div>
    <hr>
    <form action="calculateMatrix.jsp" method="post">
        <div class="inputBox">
            <h3>在这里输入矩阵</h3>
<%--            隐式表单--%>
            <input type="hidden" value="1" name="matrixNumber">
            <input type="hidden" name="method" value="adjoint">
            <input type="hidden" name="resultType" value="matrix">

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