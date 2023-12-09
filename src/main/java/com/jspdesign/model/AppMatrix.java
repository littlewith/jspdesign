package com.jspdesign.model;

import com.jspdesign.exception.MatrixCanNotBeInitException;
import org.ujmp.core.DenseMatrix;
import org.ujmp.core.Matrix;
import org.ujmp.core.doublematrix.DenseDoubleMatrix2D;

public class AppMatrix {
    private Matrix matrixData;

    public AppMatrix(Matrix matrix){
        this.matrixData = matrix;
    }

    public AppMatrix(Integer rowNumber, Integer colNumber){
        this.matrixData = DenseMatrix.Factory.zeros(rowNumber,colNumber);
    }

    public AppMatrix(Integer Number){
        this.matrixData = DenseMatrix.Factory.zeros(Number,Number);
    }

    /**
     * 无参构造，空矩阵
     * */
    public AppMatrix(){
        this.matrixData = DenseMatrix.Factory.emptyMatrix();
    }

    public AppMatrix(Integer rowNumber, Integer colNumber, Double... data){

    }

    public Long getMatrixRowNumber(){
        return this.matrixData.getRowCount();
    }

    public Long getMatrixColNumber(){
        return this.matrixData.getColumnCount();
    }

    public Matrix getMatrixData(){
        return this.matrixData;
    }

    public void setMatrixData(Matrix matrixData) {

    }

    public void setMatrixData(Integer rowNumber, Integer colNumber, Double... data) throws MatrixCanNotBeInitException {
        if(rowNumber*colNumber < data.length){
            throw new MatrixCanNotBeInitException();
        }

        this.matrixData = DenseMatrix.Factory.zeros(rowNumber,colNumber);
        int index = 0;
            for(int i=0;i<rowNumber;i++){
                for(int j=0;j<colNumber;j++){
                    this.matrixData.setAsDouble(data[index],i,j);
                    index ++;
                }
            }
    }

    //转置矩阵
    public void transposeMatrix(){
        this.matrixData = this.matrixData.transpose();
    }

    //加法
    public void plus(AppMatrix appMatrix){
        this.matrixData = this.matrixData.plus(appMatrix.getMatrixData());
    }

    //减法
    public void sub(AppMatrix appMatrix){
        this.matrixData = this.matrixData.minus(appMatrix.getMatrixData());
    }

    //乘法
    public void multi(AppMatrix appMatrix){
        this.matrixData = this.matrixData.mtimes(appMatrix.getMatrixData());
    }

    //逆矩阵
    public void inverse(){
        this.matrixData = this.matrixData.inv();
    }

    //打印矩阵
    public void printMatrix(){
        System.out.println(this.matrixData);
    }

    public String matrixToHtmlTable() {
        Matrix matrix = this.matrixData;
        StringBuilder htmlTable = new StringBuilder();

        // 添加 CSS 样式
        htmlTable.append("<style>");
        htmlTable.append("table {");
        htmlTable.append("    border-collapse: collapse;");
        htmlTable.append("    margin-left: auto;");   // 自动左边距，实现居中
        htmlTable.append("    margin-right: auto;");  // 自动右边距，实现居中
        htmlTable.append("    border-radius: 10px;"); // 圆角边框
        htmlTable.append("    overflow: hidden;");    // 处理圆角边框和边框折叠的问题
        htmlTable.append("  padding:10px;");
        htmlTable.append("}");
        htmlTable.append("th, td {");
        htmlTable.append("    border: 1px solid #ddd;");
        htmlTable.append("    padding: 8px;");
        htmlTable.append("    text-align: center;");
        htmlTable.append("}");
        htmlTable.append("th {");
        htmlTable.append("    background-color: #4CAF50;");
        htmlTable.append("    color: white;");
        htmlTable.append("}");
        htmlTable.append("tr:nth-child(even) {background-color: #f2f2f2;}");
        htmlTable.append("tr:hover {background-color: #ddd;}");
        htmlTable.append("</style>");

        // 开始构建表格
        htmlTable.append("<table>");

        // 添加列标题
        htmlTable.append("<tr><th></th>"); // 空白的左上角单元格
        for (long c = 1; c <= matrix.getColumnCount(); c++) {
            htmlTable.append("<th>C").append(c).append("</th>");
        }
        htmlTable.append("</tr>");

        // 遍历矩阵行
        for (long r = 0; r < matrix.getRowCount(); r++) {
            htmlTable.append("<tr>");
            htmlTable.append("<th>R").append(r+1).append("</th>"); // 添加行标题
            for (long c = 0; c < matrix.getColumnCount(); c++) {
                htmlTable.append("<td>").append(matrix.getAsDouble(r, c)).append("</td>");
            }
            htmlTable.append("</tr>");
        }

        htmlTable.append("</table>");
        return htmlTable.toString();
    }


    public String getMatrixInfoString(){
        StringBuilder matrixInfo = new StringBuilder();
        matrixInfo.append("矩阵的维数为 ");
        matrixInfo.append("<br>");
        matrixInfo.append("行：");
        matrixInfo.append(this.getMatrixRowNumber());
        matrixInfo.append(" --- ");
        matrixInfo.append("列：");
        matrixInfo.append(this.getMatrixColNumber());
        matrixInfo.append("<hr>");
        return matrixInfo.toString();
    }

    //求行列式
    public Double determinant(){
        return this.matrixData.det();
    }

    //秩
    public Integer rank(){
        return this.matrixData.rank();
    }


    // 计算伴随矩阵
    public void adjoint() {
        Matrix matrix = this.matrixData;
        int n = (int) matrix.getRowCount();
        Matrix adjoint = DenseDoubleMatrix2D.Factory.zeros(n, n);

        if (n == 1) {
            adjoint.setAsDouble(1.0, 0, 0);
            this.matrixData = adjoint;
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                Matrix cofactorMatrix = getCofactorMatrix(matrix, i, j);
                double cofactor = ((i + j) % 2 == 0 ? 1 : -1) * determinant(cofactorMatrix);
                adjoint.setAsDouble(cofactor, j, i);
            }
        }

        this.matrixData = adjoint;
    }

    // 计算行列式
    private double determinant(Matrix matrix) {
        int n = (int) matrix.getRowCount();
        if (n == 1) {
            return matrix.getAsDouble(0, 0);
        }
        if (n == 2) {
            return matrix.getAsDouble(0, 0) * matrix.getAsDouble(1, 1)
                    - matrix.getAsDouble(0, 1) * matrix.getAsDouble(1, 0);
        }

        double det = 0.0;
        for (int i = 0; i < n; i++) {
            Matrix cofactorMatrix = getCofactorMatrix(matrix, 0, i);
            det += (i % 2 == 0 ? 1 : -1) * matrix.getAsDouble(0, i) * determinant(cofactorMatrix);
        }
        return det;
    }

    // 获取余子矩阵
    private Matrix getCofactorMatrix(Matrix matrix, int rowToRemove, int colToRemove) {
        int n = (int) matrix.getRowCount();
        Matrix cofactorMatrix = DenseDoubleMatrix2D.Factory.zeros(n - 1, n - 1);

        int r = -1;
        for (int i = 0; i < n; i++) {
            if (i == rowToRemove) {
                continue;
            }
            r++;
            int c = -1;
            for (int j = 0; j < n; j++) {
                if (j == colToRemove) {
                    continue;
                }
                c++;
                cofactorMatrix.setAsDouble(matrix.getAsDouble(i, j), r, c);
            }
        }

        return cofactorMatrix;
    }

}
