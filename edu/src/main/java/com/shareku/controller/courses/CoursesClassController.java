package com.shareku.controller.courses;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shareku.entity.courses.CoursesClass;
import com.shareku.service.courses.CoursesClassService;

@Controller
@RequestMapping(value="/courses_class")
public class CoursesClassController {
	
	@Autowired
	private CoursesClassService coursesClassService;
	
	@RequestMapping
	public ModelAndView list(CoursesClass cc){
//		List<CoursesClass> ccList = coursesClassService.listAllCoursesClass();
		List<CoursesClass> ccList = coursesClassService.listPageCoursesClass(cc);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ccList", ccList);
		mv.addObject("courses_class", cc);
		mv.setViewName("courses/courses_class_list");
		return mv;
	}
	
	/**
	 * 请求新增课程分类页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public String toAdd(Model model){
		return "courses/courses_class_info";
	}
	
	/**
	 * 保存课程分类信息
	 * @param CoursesClass
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public ModelAndView saveUser(CoursesClass cc){
		ModelAndView mv = new ModelAndView();
		//如果存在id，则证明是修改操作，否则是删除操作
		if (cc.getCcId() != null && cc.getCcId().intValue() != 0) {
			coursesClassService.updateCoursesClass(cc);
		} else {
			coursesClassService.insertCoursesClass(cc);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 请求编辑课程分类页面
	 * @param ccId
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView toEdit(@RequestParam int ccId){
		ModelAndView mv = new ModelAndView();
		CoursesClass cc = coursesClassService.getCoursesClassById(ccId);
		mv.addObject("courses_class", cc);
		mv.setViewName("courses/courses_class_info");
		return mv;
	}
	
	/**
	 * 删除某个课程分类
	 * @param ccId
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteUser(@RequestParam int ccId,PrintWriter out){
		coursesClassService.deleteCoursesClass(ccId);
		out.write("success");
		out.close();
	}
}
