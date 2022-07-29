package com.lsc.db.main;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/*
instantclient_21_6에 있는 ojdbc.jar를 넣어서 함
 */
public class DBMain {
    public static void main(String[] args) {

        //메이커마다 작성하는 형식이 다른데 DataBase연결할때 밑에 주소가 생성되서 그거 복붙
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            String addr = "jdbc:oracle:thin:@192.168.25.78:1521:XE";

            con = DriverManager.getConnection(addr,"lsc","1234");
            //실행할 SQL문 작성
            //세미콜론 없어야함
            String sql = "INSERT INTO item VALUES (i_seq.nextval,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"dddd");
            pstmt.setString(2,"dddd");
            pstmt.setInt(3,1234);//NUMBER가 들어가는 자리
            pstmt.setString(4,"dddd");
            int a = pstmt.executeUpdate();//실행하고 결과 까지 출력

            if(a>=1){
                System.out.println("데이터 입력 완료");
            }

            System.out.println("연결성공");
        } catch (Exception e) {
            e.printStackTrace();
        }

        //닫을 때 나중에 열린것 부터 먼저 닫도록 함
        try{pstmt.close();}catch (Exception e){e.printStackTrace();}
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
