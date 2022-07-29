package com.lsc.db.main;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/*
instantclient_21_6에 있는 ojdbc.jar를 넣어서 함
 */
public class DBMain {
    public static void main(String[] args) {

        //메이커마다 작성하는 형식이 다른데 DataBase연결할때 밑에 주소가 생성되서 그거 복붙
        Connection con=null;
        try {
            String addr = "jdbc:oracle:thin:@192.168.25.78:1521:XE";

            con = DriverManager.getConnection(addr,"lsc","1234");
            System.out.println("연결성공");
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
