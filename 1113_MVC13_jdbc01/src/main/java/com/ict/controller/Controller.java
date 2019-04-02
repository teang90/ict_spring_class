package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.model.DAO;
import com.ict.model.VO;

@org.springframework.stereotype.Controller
public class Controller {
	
	
	@Autowired
	private DAO dao;
	
	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	//처음 실행해서 DAO에 있는 getList메소드 실행하는 메소드
	@RequestMapping(value="/") // '/'역할은 시작페이지 설정
	public ModelAndView getModelList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("list");

		List<VO> list = dao.getList();
		mv.addObject("list", list);
		return mv;
	}
	
	//회원 추가
	@RequestMapping("add.do")
	public ModelAndView getAdd(VO vo){
		dao.getInsert(vo);
		
		// 삽입 후에는 새롭게 추가된 자료를 /를 갖고있는 리스트를 통해서 리스트로 보낸다.
		return new ModelAndView("redirect:/");
	}
	
	//아이디로 회원 검색
	@RequestMapping("onelist.do")
	public ModelAndView getOnelist(VO vo){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("onelist");
		
		List<VO> onelist = dao.getOnelist(vo);
		mv.addObject("onelist", onelist);
		// 삽입 후에는 새롭게 추가된 자료를 /를 갖고있는 리스트를 통해서 리스트로 보낸다.
		return mv;
	}
	
	//삭제 
	@RequestMapping("del.do")
	public ModelAndView getDel(VO vo){
		dao.getDelete(vo);
		return new ModelAndView("redirect:/");
	}
	
	//수정 화면 보이기
	@RequestMapping("update.do")
	public ModelAndView getUpdate(VO vo){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("update");
		List<VO> uplist = dao.getOnelist(vo);
		mv.addObject("uplist", uplist);
		return mv;
	}
	
	//넘어온 수정을 위한 변경값 받아서 처리하기
	@RequestMapping("update_ok.do")
	public ModelAndView getUpdate_GO(VO vo) {
		dao.getUpdate_go(vo);
		return new ModelAndView("redirect:/onelist.do?id="+vo.getId()); //수정한 id를 갖고있는 onelist
		// return new ModelAndView("redirect:/"); 이거는 바로 전체 리스트로 이동
	}
	
	
	
	
}
