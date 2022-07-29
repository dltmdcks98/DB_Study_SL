package com.lsc.db.main;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FinalMain {
    public static void main(String[] args) {
        Connection con=null;
        PreparedStatement pstmt=null;
        String addrDB = "jdbc:oracle:thin:@192.168.25.78:1521:XE";
        String addr = "http://openapi.seoul.go.kr:8088/575a4655496b636839386f58586542/JSON/RealtimeCityAir/1/25/";
        try{
            con = DriverManager.getConnection(addrDB,"lsc","1234");

            URL u = new URL(addr);
            HttpURLConnection huc = (HttpURLConnection) u.openConnection();
            InputStream is = huc.getInputStream();
            InputStreamReader isr = new InputStreamReader(is,"utf-8");

            JSONParser jp = new JSONParser();
            JSONObject jo = (JSONObject) jp.parse(isr);
            JSONObject cssn = (JSONObject) jo.get("RealtimeCityAir");
            JSONArray r = (JSONArray) cssn.get("row");

            String MSRDT=null;
            String MSRRGN_NM=null;
            String MSRSTE_NM=null;
            String PM10=null;
            String PM25=null;
            String IDEX_NM=null;
            String sql ="INSERT INTO dust VALUES (d_num_seq.nextval,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);

            for(int i=0;i<r.size();i++){
                JSONObject dust = (JSONObject) r.get(i);

                MSRDT=String.valueOf(dust.get("MSRDT"));
                MSRRGN_NM = String.valueOf(dust.get("MSRRGN_NM"));
                MSRSTE_NM = String.valueOf(dust.get("MSRSTE_NM"));
                PM10=String.valueOf(dust.get("PM10"));
                PM25=String.valueOf(dust.get("PM25"));
                IDEX_NM = String.valueOf(dust.get("IDEX_NM"));

                pstmt.setString(1, MSRDT);
                pstmt.setString(2, MSRRGN_NM);
                pstmt.setString(3,MSRSTE_NM);
                pstmt.setString(4,PM10);
                pstmt.setString(5,PM25);
                pstmt.setString(6,IDEX_NM);
                int a = pstmt.executeUpdate();//실행하고 결과 까지 출력
                if(a>=1){
                    System.out.println("데이터 입력 완료");
                }
            }


            is.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        try {
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}

