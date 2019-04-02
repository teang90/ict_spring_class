package com.ict.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class DAO {
	// spring 에서 jdbc 환경을 처리해 주는 클래스 ( root-context.xml에서 기본 값을 넣어준다.)
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	// 리스트
	// jdbcTemplate는 select 문법만 틀리고, 
	// insert, update, delete는 모두 PreparedStatement와 같은 방법으로 처리 하면 된다.
	// select의 결과는 무조건 List<VO>
	public List<VO> getList(){
		 String sql = "select * from members2 order by no";
		 return jdbcTemplate.query(sql, new RowMapper() {
			 	@Override
			 	public VO mapRow(ResultSet rs, int rownum) throws SQLException {
			 		VO vo  = new VO();
			 		vo.setNo(rs.getString("no"));
					vo.setId(rs.getString("id"));
					vo.setPw(rs.getString("pw"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getString("age"));
					vo.setAddr(rs.getString("addr"));
					vo.setRegdate(rs.getString("regdate").substring(0, 10));
			 		return vo;
			 	}
		 });
	}
	
   // no 받아서 검색하기
	public List<VO> getOneList(String no){
		String sql = "select * from members2 where no = ?" ;
		return jdbcTemplate.query(sql, new RowMapper() {
			@Override
			public VO mapRow(ResultSet rs, int rownum) throws SQLException {
				VO vo = new VO();
				vo.setNo(rs.getString("no"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setRegdate(rs.getString("regdate").substring(0, 10));
				return vo;
			}
		},no);
	}
	
	

	// 삽입
	public void getInsert(VO vo) {
		String sql = "insert into members2 values(members2_seq.nextval,?,?,?,?,?,sysdate)";
		// insert, delete, update = > jdbcTemplate.update(sql,?처리)
		jdbcTemplate.update(sql,vo.getId(),vo.getPw(), vo.getName(),vo.getAge(), vo.getAddr());
	}
	
}







