package com.ict.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class DAO {
	
	private JdbcTemplate jdbcTemplate;
	
	//DI하려면 get,set만들어야함
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//db처리 메소드
	public List<VO> getList(){
		String sql = "select * from member";
		return jdbcTemplate.query(sql, new RowMapper() {
			@Override
			public VO mapRow(ResultSet rs, int rownum) throws SQLException {
				VO vo = new VO();
				vo.setNo(rs.getString("no"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setAddr(rs.getString("addr"));
				vo.setAge(rs.getString("age"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setName(rs.getString("name"));
				return vo;
			}
		});
	}
	
	// 회원 추가
	public void getInsert(VO vo) {
		String sql ="insert into member values(memebers_seq.nextval,?,?,?,?,?,sysdate)";
		
		//insert, delete, update => 모두 template.update()를 사용한다.
		jdbcTemplate.update(sql, vo.getAge(), vo.getName(), vo.getId(), vo.getPw(), vo.getAddr());
	}
	
	
	//아이디로 회원 검색
	public List<VO> getOnelist(VO vo) {
		String sql = "select * from member where id=?";
		return jdbcTemplate.query(sql, new RowMapper() {
			@Override
			public VO mapRow(ResultSet rs, int rownum) throws SQLException {
				VO vo = new VO();
				//DB에서 쿼리문 처리 후에 넘어온 결과 값을 받아서 vo에 set으로 넣은 뒤 최종적으로 list에 넣어서 컨트롤러로 보냄
				vo.setNo(rs.getString("no"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setAddr(rs.getString("addr"));
				vo.setAge(rs.getString("age"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setName(rs.getString("name"));
				return vo;
			}
		}, vo.getId());
	}

	public void getDelete(VO vo) {
		String sql = "delete from member where id=?";
		jdbcTemplate.update(sql, vo.getId());
	}

	public void getUpdate_go(VO vo) {
		String sql = "update member set age=?, name=?, pw=?, addr=? where id=? ";
		jdbcTemplate.update(sql, vo.getAge(), vo.getName(), vo.getPw(), vo.getAddr(), vo.getId());
	}

	/*
	public List<VO> getUpdate_go(VO vo) {
		String sql = "update member set age=?, name=?, pw=?, addr=? where id=? ";
		return jdbcTemplate.query(sql, new RowMapper() {
			@Override
			public VO mapRow(ResultSet rs, int rownum) throws SQLException {
				VO vo = new VO();
				//DB에서 쿼리문 처리 후에 넘어온 결과 값을 받아서 vo에 set으로 넣은 뒤 최종적으로 list에 넣어서 컨트롤러로 보냄
				vo.setNo(rs.getString("no"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setAddr(rs.getString("addr"));
				vo.setAge(rs.getString("age"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setName(rs.getString("name"));
				return vo;
			}
		},  vo.getAge(), vo.getName(), vo.getPw(), vo.getAddr(), vo.getId());
	}
	*/
}
