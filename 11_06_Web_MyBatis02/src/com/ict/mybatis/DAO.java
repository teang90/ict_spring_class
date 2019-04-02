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
	
	// one리스트
	public VO getOneList(String idx) {
		return template.selectOne("onelist",idx);
	}
	
	// insert
	public void getInsert(VO vo) {
		template.insert("insert", vo);
	}
	
	// update
	public void getUpdate(VO vo) {
		template.update("update", vo);
	}
	
	public void getDelete(String idx) {
		template.delete("delete", idx);
	}
}






