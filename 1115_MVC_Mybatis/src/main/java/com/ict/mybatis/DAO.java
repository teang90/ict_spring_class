package com.ict.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository("dao")
public class DAO {
	
	@Autowired
	private SqlSession template;
	
	
	public SqlSession getTemplate() {
		return template;
	}


	public void setTemplate(SqlSession template) {
		this.template = template;
	}

	//db관련 메소드
	//전체보기
	public List<VO> getList() {
		return template.selectList("list");
	}  
	
	//회원가입
	public int getInsert(VO vo) {
		return template.insert("insert", vo);
	}
	
	//상세보기
	public VO getOnelist(VO vo) {
		return template.selectOne("onelist", vo.getId());
	}
	
	//삭제
	public int getDelete(VO vo) {
		return template.delete("delete", vo.getId());
	}
	
	//수정
	public int getUpdate(VO vo) {
		return template.update("update", vo);
	}
	
}
