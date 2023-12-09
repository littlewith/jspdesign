package com.jspdesign.exception;

public class MatrixOutOfIndexException extends Exception{
    public MatrixOutOfIndexException(){
        super("对矩阵的索引超过了原有矩阵的行列数");
    }
}
