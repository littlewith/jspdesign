<%@ page import="com.jspdesign.exception.MatrixCanNotBeInitException" %>
<%@ page import="com.jspdesign.model.AppMatrix" %><%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-06
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%--控制器--%>

<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="title" value="计算结果"/>
</jsp:include>

<jsp:useBean id="matrix" class="com.jspdesign.model.AppMatrix" scope="page"/>
<jsp:useBean id="matrix1" class="com.jspdesign.model.AppMatrix" scope="page"/>
<jsp:useBean id="matrix2" class="com.jspdesign.model.AppMatrix" scope="page"/>

<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">

<div class="grid-item content-item">
    <div class="info">
        这里是矩阵的计算结果
    </div>
    <hr>
    <div class="inputBox info">
<%--        <h3>矩阵的计算结果为</h3>--%>
<%--&lt;%&ndash;        设置返回结果&ndash;%&gt;--%>
<%--        <div>返回矩阵的维数为：2</div>--%>
    <c:choose>
        <c:when test="${param.matrixNumber == 2}">
            <%--            获取结果--%>

            <%
                int rowNumber1 = Integer.parseInt(request.getParameter("rowNumber"));
                int colNumber1 = Integer.parseInt(request.getParameter("colNumber"));
                int matrixLength1 = rowNumber1 * colNumber1;

                Double[] matrixData = new Double[matrixLength1];
                int index1 = 0;
                for(int r=0;r<rowNumber1;r++){
                    for(int c=0;c<colNumber1;c++){
                        matrixData[index1] = Double.parseDouble(request.getParameter("0-"+index1));
                        index1 ++;
                    }
                }
                try {
                    matrix1.setMatrixData(rowNumber1,colNumber1,matrixData);
                } catch (MatrixCanNotBeInitException e) {
                    throw new RuntimeException(e);
                }

                int rowNumber2 = Integer.parseInt(request.getParameter("rowNumber"));
                int colNumber2 = Integer.parseInt(request.getParameter("colNumber"));

                if(request.getParameter("rowNumber2")!=null){
                    rowNumber2 = Integer.parseInt(request.getParameter("rowNumber2"));
                    colNumber2 = Integer.parseInt(request.getParameter("colNumber2"));
                }

                int matrixLength2 = rowNumber2 * colNumber2;

                Double[] matrixData2 = new Double[matrixLength2];
                int index2 = 0;
                for(int r=0;r<rowNumber2;r++){
                    for(int c=0;c<colNumber2;c++){
                        matrixData2[index2] = Double.parseDouble(request.getParameter("1-"+index2));
                        index2 ++;
                    }
                }
                try {
                    matrix2.setMatrixData(rowNumber2,colNumber2,matrixData2);
                } catch (MatrixCanNotBeInitException e) {
                    throw new RuntimeException(e);
                }
            %>
        </c:when>

        <c:when test="${param.matrixNumber == 1}">
<%--            //数据矩阵数据--%>
            <%
                int rowNumber = Integer.parseInt(request.getParameter("rowNumber"));
                int colNumber = Integer.parseInt(request.getParameter("colNumber"));
                int matrixLength = rowNumber * colNumber;

                Double[] matrixData = new Double[matrixLength];
                int index = 0;
                for(int r=0;r<rowNumber;r++){
                    for(int c=0;c<colNumber;c++){
                        matrixData[index] = Double.parseDouble(request.getParameter("0-"+index));
                        index ++;
                    }
                }
                try {
                    matrix.setMatrixData(rowNumber,colNumber,matrixData);
                } catch (MatrixCanNotBeInitException e) {
                    throw new RuntimeException(e);
                }
            %>
        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${param.method == 'multi'}">
            <h3>矩阵乘法：矩阵的计算结果为</h3>
            <%
                matrix1.multi(matrix2);
            %>
            <div class="inputBox-item">返回矩阵的维数为：
                <%
                    out.println(matrix1.getMatrixInfoString());
                %>
            </div>
            <div class="inputBox-item">
                返回矩阵的结果为：
                <br>
                <%
                    out.println(matrix1.matrixToHtmlTable());
                %>
            </div>
            <a href="matrixMulti.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'plus'}">
            <h3>矩阵加法：矩阵的计算结果为</h3>
            <%
                matrix1.plus(matrix2);
            %>
            <div class="inputBox-item">返回矩阵的维数为：
                <%
                    out.println(matrix1.getMatrixInfoString());
                %>
            </div>
            <div class="inputBox-item">
                返回矩阵的结果为：
                <br>
                <%
                    out.println(matrix1.matrixToHtmlTable());
                %>
            </div>
            <a href="matrixPlusAndSub.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'sub'}">
            <h3>矩阵减法：矩阵的计算结果为</h3>
            <%
                matrix1.sub(matrix2);
            %>
            <div class="inputBox-item">返回矩阵的维数为：
                <%
                    out.println(matrix1.getMatrixInfoString());
                %>
            </div>
            <div class="inputBox-item">
                返回矩阵的结果为：
                <br>
                <%
                    out.println(matrix1.matrixToHtmlTable());
                %>
            </div>
            <a href="matrixPlusAndSub.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'adjoint'}">
            <h3>伴随矩阵：矩阵的计算结果为</h3>
            <%
                matrix.adjoint();
            %>
            <div class="inputBox-item">返回矩阵的维数为：
                <%
                    out.println(matrix.getMatrixInfoString());
                %>
            </div>
            <div class="inputBox-item">
                返回矩阵的结果为：
                <br>
                <%
                    out.println(matrix.matrixToHtmlTable());
                %>
            </div>
            <a href="matrixAdjoint.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'determinant'}">
            <h3>矩阵的行列式：矩阵的计算结果为</h3>
            <div class="inputBox-item">
                矩阵的行列式为：
                <%
                    out.println(matrix.determinant());
                %>
            </div>
            <a href="matrixDeterminant.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'inversion'}">
            <h3>矩阵的逆：矩阵的计算结果为</h3>
            <%
                matrix.inverse();
            %>
            <div class="inputBox-item">返回矩阵的维数为：
                <%
                    out.println(matrix.getMatrixInfoString());
                %>
            </div>
            <div class="inputBox-item">
                返回矩阵的结果为：
                <br>
                <%
                    out.println(matrix.matrixToHtmlTable());
                %>
            </div>
            <a href="matrixInversion.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'rank'}">
            <h3>矩阵的秩：矩阵的计算结果为</h3>
            <div class="inputBox-item">
                矩阵的秩为：
                <%
                out.println(matrix.rank());
            %>
            </div>
            <a href="matrixRank.jsp" class="inputButton">再次计算</a>
        </c:when>

        <c:when test="${param.method == 'transpose'}">
            <%--                    显示结果--%>
            <h3>矩阵转置：矩阵的计算结果为</h3>
            <div class="inputBox-item">返回矩阵的维数为：
                <%
                    matrix.transposeMatrix();
                    out.println(matrix.getMatrixInfoString());
                %>
            </div>
            <div class="inputBox-item">
                返回矩阵的结果为：
                <br>
                <%
                    out.println(matrix.matrixToHtmlTable());
                %>
            </div>
            <a href="matrixTranspose.jsp" class="inputButton">再次计算</a>
        </c:when>
        <c:otherwise>
            <jsp:forward page="index.jsp"/>
        </c:otherwise>
    </c:choose>
    </div>
</div>

<jsp:include page="/WEB-INF/templates/footer.jsp"/>