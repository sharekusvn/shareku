package com.shareku.controller.courses;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;
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
import com.shareku.entity.courses.Course;
import com.shareku.service.courses.CourseService;

@Controller
@RequestMapping(value="/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	private final String path = "/home/courses/video"; //课程文件存放父目录  
	private final String imagepath = "/home/courses/image"; //课程图片存放父目录  
	private final String SPLIT = "/"; //
	
	@RequestMapping
	public ModelAndView list(Course c){
		List<Course> coursesList = courseService.listPageCourse(c);
		ModelAndView mv = new ModelAndView();
		mv.addObject("coursesList", coursesList);
		mv.addObject("course", c);
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
	public ModelAndView saveUser(Course c){
		ModelAndView mv = new ModelAndView();
		String image = c.getImagePath();
		Path p = FileSystems.getDefault().getPath(image);
		String localpath = imagepath + SPLIT + c.getCourseId() + p.getFileName();
		if (storageFile(p, localpath)) {
			c.setImagePath(localpath);
		}
		//如果存在id，则证明是修改操作，否则是删除操作
		if (c.getCourseId() != null && c.getCourseId().intValue() != 0) {
			courseService.updateCourse(c);
		} else {
			courseService.insertCourse(c);
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
		Course c = courseService.getCourseById(coursesId);
		mv.addObject("course", c);
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
		courseService.deleteCourse(coursesId);
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
	
	/**
	 * 课程上传视频文件
	 * 
	 */
	@RequestMapping(value="/add_video")
	public ModelAndView addvideo(Course c){
		ModelAndView mv = new ModelAndView();
		//课程
		String filePath = c.getFilePath();
		StringBuffer loaclfilepath = new StringBuffer(); 
		for (String s : filePath.split(",")) {
			Path p = FileSystems.getDefault().getPath(s); //获取文件路径
			String localPath = path + SPLIT + c.getCourseId() + p.getFileName().toString();
			if (storageFile(p, localPath)) {
				loaclfilepath.append(localPath);
			}
		}
		Course course = courseService.getCourseById(c.getCourseId());
		course.setFilePath(loaclfilepath.toString());
		courseService.updateCourse(course);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}

	private boolean storageFile(Path p, String localPath) {
		File file = p.toFile();
		try {
			FileInputStream input = new FileInputStream(file);
			FileOutputStream out = new FileOutputStream(localPath);
			int read = input.read();
			while (read != -1) {
				out.write(read);
			}
			input.close();
			out.close();
		} catch (FileNotFoundException e) {
			System.out.println("文件未找到");
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			System.out.println("文件读取失败");
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public static void main(String[] args) {
		String s = "G:\\123.txt";
		Path p = FileSystems.getDefault().getPath(s);
		System.out.println(p.getFileName());
	}
}
