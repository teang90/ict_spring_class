package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class DAO {
	@Autowired
	private JDBCUtil jdbcUtil;
	
	Connection conn ;
	PreparedStatement pstm;
	ResultSet rs;
	
	public JDBCUtil getJdbcUtil() {
		return jdbcUtil;
	}

	public void setJdbcUtil(JDBCUtil jdbcUtil) {
		this.jdbcUtil = jdbcUtil;
	}

	public ArrayList<VO> getList(){
		   conn = jdbcUtil.getConnection();
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
















