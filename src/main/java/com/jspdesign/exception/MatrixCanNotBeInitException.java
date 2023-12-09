package com.jspdesign.exception;

public class MatrixCanNotBeInitException extends Exception{
    public MatrixCanNotBeInitException(){
        super("矩阵不能被初始化由于给定的行列数和数据数不匹配");
    }
}
