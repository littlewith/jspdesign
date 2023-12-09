<%--
  Created by IntelliJ IDEA.
  User: 20645
  Date: 2023-12-03
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/templates/header.jsp">
    <jsp:param name="action" value="help"/>
    <jsp:param name="title" value="帮助信息"/>
</jsp:include>
<%--    内容--%>
<link rel="stylesheet" href="/assets/css/content.css">
<div class="grid-item content-item">
    <div class="info">
        <p>
            欢迎使用在线矩阵计算工具！本工具提供了一个简单易用的界面，用于执行各种矩阵运算，适用于教育、工程、科学研究等领域。</p>
        <hr>
        <br>
        <h3>矩阵基础知识：</h3>
        <ul>
            <li><strong>矩阵（Matrix）：</strong>由行（rows）和列（columns）组成的矩形数组。</li>
            <li><strong>元素（Element）：</strong>矩阵中的每个数值称为元素。</li>
            <li><strong>行列式（Determinant）：</strong>只适用于方阵，是一个将矩阵映射到一个标量的函数。</li>
            <li><strong>转置（Transpose）：</strong>将矩阵的行变为列，列变为行得到的新矩阵。</li>
        </ul>
        <hr>
        <br>
        <h3>矩阵运算：</h3>
        <ul>
            <li><strong>加法与减法：</strong>只有当两个矩阵的维度相同时，才能进行加法或减法运算。</li>
            <li><strong>数乘：</strong>将矩阵的每个元素乘以一个标量值。</li>
            <li><strong>乘法：</strong>当第一个矩阵的列数与第二个矩阵的行数相同时，可以进行乘法运算。</li>
            <li><strong>求逆：</strong>只有对于方阵且行列式不为零时，才能找到逆矩阵。</li>
            <li><strong>求伴随：</strong>方阵的伴随矩阵是由原矩阵每个元素的代数余子式组成的矩阵的转置。</li>
        </ul>
        <hr>
        <br>
        <h3>使用指南：</h3>
        <ol>
            <li><strong>选择运算类型：</strong>从左侧菜单选择您需要进行的矩阵运算类型。</li>
            <li><strong>输入矩阵数据：</strong>在提供的文本区域中输入您的矩阵数据，或者使用上传功能上传数据文件。</li>
            <li><strong>执行运算：</strong>填写完矩阵数据后，点击相应的运算按钮以执行运算。</li>
            <li><strong>查看结果：</strong>运算结果将在页面上显示，您可以选择将结果下载到本地。</li>
        </ol>
        <hr>
        <br>
        <h3>注意事项：</h3>
        <p>
            确保输入的矩阵格式正确，例如矩阵的行与列应由逗号和分号分隔。对于大型矩阵运算，计算可能需要较长时间，请耐心等待。</p>
        <hr>
        <br>
        <p>本软件仅供学习和研究使用，未经许可不得用于商业目的。</p>
    </div>
    <a href="index.jsp" class="inputButton">返回主页</a>
</div>
<jsp:include page="/WEB-INF/templates/footer.jsp"/>