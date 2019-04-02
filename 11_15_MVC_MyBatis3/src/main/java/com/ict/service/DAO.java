package com.ict.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DAO {
	@Autowired 
	private SqlSessionTemplate template;

	public SqlSessionTemplate getTemplate() {
		return template;
	}

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	// DB 관련 메소드들 (JSP에서 SqlSession과 사용법은 같음)
	// 전체보기
	public List<VO> getList(){
		return template.selectList("list");
	}
	
	// 회원가입
	public void getInsert(VO vo) {
		template.insert("insert", vo);
	}
	
	// 상세보기
	public VO getOneList(VO vo) {
		return template.selectOne("onelist", vo.getId());
	}
	
	//삭제
	public int getDelete(VO vo) {
		return template.delete("delete", vo.getId());
	}
	
	//갱신
	public void getUpdate(VO vo) {
		template.update("update", vo);
	}
}






