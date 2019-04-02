package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mybatis.DAO;
import com.ict.mybatis.VO;

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
		// DB 처리 후 저장
		int res = dao.getInsert(vo);
		if (res > 0) {
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("add.do");
		}
		return mv;
	}
	
	@RequestMapping("onelist.do")
	public ModelAndView getOneList(VO vo) {
		ModelAndView mv = new ModelAndView();
		
		// DB 처리 후 저장
		VO one_vo = dao.getOnelist(vo);
		if (one_vo != null) {
			mv.setViewName("onelist");
		}else {
			mv.setViewName("list");
		}
		
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
		VO one_vo = dao.getOnelist(vo);
		mv.addObject("one_vo", one_vo);
		return mv;
	}
	
	@RequestMapping("update_ok.do")
	public ModelAndView getUpdate_ok(VO vo) {
		ModelAndView mv = new ModelAndView();
		
		// DB 처리 후 저장
		dao.getUpdate(vo);
		mv.setViewName("redirect:/onelist.do?id="+vo.getId());
		return mv;
	}
	
}

