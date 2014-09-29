package com.shareku.controller.courses;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shareku.entity.Code;
import com.shareku.entity.courses.Courses;
import com.shareku.service.courses.CoursesService;

@Controller
@RequestMapping(value="/courses")
public class CoursesController {
	
	@Autowired
	private CoursesService coursesService;
	
	@RequestMapping
	public ModelAndView list(Courses c){
//		List<Courses> ccList = coursesService.listAllCourses();
		List<Courses> coursesList = coursesService.listPageCourses(c);
		ModelAndView mv = new ModelAndView();
		mv.addObject("coursesList", coursesList);
		mv.addObject("courses", c);
		//获取代码列表
		Map<String, List<Code>> map = getCodeList();
		for (String key : map.keySet()) {
			mv.addObject(key, map.get(key));
		}
		mv.setViewName("courses/courses_list");
		return mv;
	}
	
	/**
	 * 请求新增商品页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView toAdd(Model model){
		ModelAndView mv = new ModelAndView();
		//获取代码列表
		Map<String, List<Code>> map = getCodeList();
		for (String key : map.keySet()) {
			mv.addObject(key, map.get(key));
		}
		mv.setViewName("courses/courses_info");
		return mv;
	}
	
	/**
	 * 保存商品信息
	 * @param courses
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public ModelAndView saveUser(Courses c){
		ModelAndView mv = new ModelAndView();
		//如果存在id，则证明是修改操作，否则是删除操作
		if (c.getCoursesId() != null && c.getCoursesId().intValue() != 0) {
			coursesService.updateCourses(c);
		} else {
			coursesService.insertCourses(c);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 请求编辑商品页面
	 * @param coursesId
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView toEdit(@RequestParam int coursesId){
		ModelAndView mv = new ModelAndView();
		//课程
		Courses c = coursesService.getCoursesById(coursesId);
		mv.addObject("courses", c);
		//获取代码列表
		Map<String, List<Code>> map = getCodeList();
		for (String key : map.keySet()) {
			mv.addObject(key, map.get(key));
		}
		mv.setViewName("courses/courses_info");
		return mv;
	}
	
	/**
	 * 删除某个商品
	 * @param coursesId
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteUser(@RequestParam int coursesId,PrintWriter out){
		coursesService.deleteCourses(coursesId);
		out.write("success");
		out.close();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

	/**
	 * 获取code列表
	 * @return
	 */
	private Map<String, List<Code>> getCodeList() {
		Map<String, List<Code>> map = new HashMap<String, List<Code>>();
		//课程状态
		List<Code> coursesStateList = new ArrayList<Code>();
		coursesStateList.add(new Code("0", "下架"));
		coursesStateList.add(new Code("1", "正常"));
		coursesStateList.add(new Code("10", "违规"));
		map.put("coursesStateList", coursesStateList);
		//课程审核状态
		List<Code> coursesVerifyList = new ArrayList<Code>();
		coursesVerifyList.add(new Code("0", "未通过"));
		coursesVerifyList.add(new Code("1", "通过"));
		coursesVerifyList.add(new Code("10", "审核中"));
		map.put("coursesVerifyList", coursesVerifyList);
		//课程推荐
		List<Code> coursesCommendList = new ArrayList<Code>();
		coursesCommendList.add(new Code("0", "否"));
		coursesCommendList.add(new Code("1", "是"));
		map.put("coursesCommendList", coursesCommendList);
		return map;
	}
}
