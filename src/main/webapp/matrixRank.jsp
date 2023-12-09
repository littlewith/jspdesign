<%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-03
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>

<%--矩阵的秩--%>
<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="rank"/>
    <jsp:param name="title" value="欢迎来到矩阵综合运算系统"/>
</jsp:include>

<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">
<div class="grid-item content-item">
    <div class="info">
        矩阵的秩是指矩阵中线性独立的行或列的最大数量。它是矩阵的重要性质之一，可以用来描述矩阵的维数和线性相关性。
        <br>
        秩的概念不仅适用于方阵，也适用于非方阵。
        <br>
        -->如果有问题，请看<a href="help.jsp">帮助</a>
    </div>
    <hr>
    <form>

        <input type="hidden" value="1" name="matrixNumber">
        <input type="hidden" name="method" value="rank">
        <input type="hidden" name="resultType" value="value">

        <div class="inputBox">
            <h3>在这里输入矩阵</h3>
            <div class="inputBox-item">矩阵维度：
                <label>
                    <input id="rowNumber" type="number" name="rowNumber" class="inputColumn" min="2" value="2"/>行
                </label>
                <label>
                    <input id="colNumber" type="number" name="rowNumber" class="inputColumn" min="2" value="2"/>列
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

</script>
<jsp:include page="/WEB-INF/templates/footer.jsp"/>