<%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-03
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="multi"/>
    <jsp:param name="title" value="欢迎来到矩阵综合运算系统"/>
</jsp:include>

<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">
<div class="grid-item content-item">
    <div class="info">
        矩阵乘法是在线性代数中对两个矩阵进行运算的一种操作。
        <br>
        请注意，对于两个矩阵A和B，要使它们可以相乘，必须满足以下条件：A的列数等于B的行数。
        <br>
        -->如果有问题，请看<a href="help.jsp">帮助</a>
    </div>
    <hr>
    <form action="calculateMatrix.jsp" method="post">

        <input type="hidden" value="2" name="matrixNumber">
        <input type="hidden" name="method" value="multi">
        <input type="hidden" name="resultType" value="matrix">

        <div class="inputBox">
            <h3>在这里输入矩阵</h3>
            <div class="inputBox-item">矩阵1维度：
                <label>
                    <input id="matrix1row" type="number" name="rowNumber" class="inputColumn" min="2" value="2"/>行
                </label>
                <label>
                    <input id="matrix1col" type="number" name="colNumber" class="inputColumn" min="2" value="2"
                           onchange="followChangeRow()"/>列
                </label>
            </div>

            <div class="inputBox-item">矩阵2维度：
                <label>
                    <input id="matrix2row" type="number" name="rowNumber2" class="inputColumn" min="2" value="2"
                           onchange="followChangeCol()"/>行
                </label>
                <label>
                    <input id="matrix2col" type="number" name="colNumber2" class="inputColumn" min="2" value="2"/>列
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

        let rowNumber = [document.getElementById("matrix1row").value, document.getElementById("matrix2row").value];
        let colNumber = [document.getElementById("matrix1col").value, document.getElementById("matrix2col").value];

        //由于特殊，这里直接重写检测方法
        clearMatrixInputArea();

        //创建矩阵
        for (i = 0; i < matrixNumber; i++) {

            var matricesContainer = document.getElementById("matricesContainer");
            matricesContainer.className = "matrix-container"

            var matrixContainer = document.createElement("div");
            matrixContainer.className = "matrix-item";
            matrixContainer.id = "matrix-item-" + i;

            var html = '<div class="matrix-header">矩阵' + (i + 1) + ':</div>';
            html += '<div id="matrixInputs-' + i + '"></div>';

            matrixContainer.innerHTML = html;
            matricesContainer.appendChild(matrixContainer)
            generateMatrixInputs(i, rowNumber[i], colNumber[i]);
        }
        openMatrixModal();
    }

    const followChangeRow = () => {
        document.getElementById("matrix2row").value = document.getElementById("matrix1col").value;
    }

    const followChangeCol = () => {
        document.getElementById("matrix1col").value = document.getElementById("matrix2row").value;
    }

</script>
<jsp:include page="/WEB-INF/templates/footer.jsp"/>