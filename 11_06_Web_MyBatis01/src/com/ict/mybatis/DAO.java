package com.ict.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class DAO {
	private  SqlSessionTemplate template ;

	public SqlSessionTemplate getTemplate() {
		return template;
	}

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	
	// 각 종 DB 처리 (SqlSession 하는것과 같다)
	// 리스트
	public List<VO> getList(){
		return  template.selectList("list"); 
	}
	
}






