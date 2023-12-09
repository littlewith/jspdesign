<%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-03
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="plus-sub"/>
    <jsp:param name="title" value="矩阵的加法、减法"/>
</jsp:include>

<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">
<div class="grid-item content-item">
    <div class="info">
        矩阵的加法和减法是常见的线性代数运算。
        <br>
        请注意，执行矩阵加法和减法操作的前提是两个矩阵的维度必须相同，否则不能执行矩阵的加减法运算。
        <br>
        -->如果有问题，请看<a href="help.jsp">帮助</a>
    </div>
    <hr>
    <form action="calculateMatrix.jsp" method="post">

        <input type="hidden" value="2" name="matrixNumber">
        <input type="hidden" name="resultType" value="matrix">

        <div class="inputBox">
            <h3>在这里输入矩阵</h3>
            <div class="inputBox-item">矩阵维度：
                <label>
                    <input id="rowNumber" type="number" name="rowNumber" class="inputColumn" min="2" value="2"/>行
                </label>
                <label>
                    <input id="colNumber" type="number" name="colNumber" class="inputColumn" min="2" value="2"/>列
                </label>
            </div>
            <div class="inputBox-item">计算方法：
                <label>
                    <input style="width: 15px;height: 15px;" type="radio" name="method" checked value="plus">加法
                    <input style="width: 15px;height: 15px;" type="radio" name="method" value="sub">减法
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
        const matrixNumber = 2;

        //获取矩阵维度
        let rowNumber = document.getElementById("rowNumber").value;
        let colNumber = document.getElementById("colNumber").value;

        if(!checkRowAndCol(rowNumber,colNumber)){
            return;
        }

        //创建矩阵
        for(i=0;i<matrixNumber;i++){
            addMatrixInput(matrixNumber,rowNumber, colNumber);
        }
        openMatrixModal();
    }

</script>

<jsp:include page="/WEB-INF/templates/footer.jsp"/>