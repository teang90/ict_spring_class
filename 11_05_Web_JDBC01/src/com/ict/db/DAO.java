package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	
	private  DAO dao ;
	
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "nohsam";
			String password = "1111";
			conn = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
		}
		return conn;
	}
	
	public ArrayList<VO> getList(){
		   conn =  getConnection();
		ArrayList<VO> list = new ArrayList<>();
		try {
			String sql = "select * from members2 order by no";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setNo(rs.getString("no"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setRegdate(rs.getString("regdate").substring(0, 10));
				list.add(vo);
			}
		} catch (Exception e) {
		}
		return list;
	}
}
















