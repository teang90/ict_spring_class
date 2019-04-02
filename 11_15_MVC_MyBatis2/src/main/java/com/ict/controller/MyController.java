package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.VO;

@Controller
public class MyController {
	@Autowired
	private DAO dao;

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/")
	public ModelAndView getList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("list");
		
		// DB 처리 후 저장
		List<VO> list = dao.getList();
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("add.do")
	public ModelAndView getAdd(VO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		
		// DB 처리 후 저장
		dao.getInsert(vo);
		return mv;
	}
	
	@RequestMapping("onelist.do")
	public ModelAndView getOneList(VO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("onelist");
		
		// DB 처리 후 저장
		VO one_vo = dao.getOneList(vo);
		mv.addObject("vo", one_vo);
		return mv;
	}
	
	@RequestMapping("delete.do")
	public ModelAndView getDelete(VO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		
		// DB 처리 후 저장
		mv.addObject("ok",dao.getDelete(vo));
		return mv;
	}
	
	@RequestMapping("update.do")
	public ModelAndView getUpdate(VO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("update");
		
		// DB 처리 후 저장
		VO one_vo = dao.getOneList(vo);
		mv.addObject("onevo", one_vo);
		return mv;
	}
	
	@RequestMapping("update_ok.do")
	public ModelAndView getUpdate_ok(VO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/onelist.do?id="+vo.getId());
		
		// DB 처리 후 저장
		dao.getUpdate(vo);
		return mv;
	}
}









