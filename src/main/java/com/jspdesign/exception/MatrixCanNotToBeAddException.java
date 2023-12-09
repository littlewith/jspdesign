package com.jspdesign.exception;

public class MatrixCanNotToBeAddException extends Exception{
    public MatrixCanNotToBeAddException(){
        super("矩阵不能被相加，两个矩阵有不同的行数和列数");
    }
}
