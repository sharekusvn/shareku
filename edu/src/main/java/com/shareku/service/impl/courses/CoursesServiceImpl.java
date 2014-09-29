package com.shareku.service.impl.courses;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareku.entity.courses.Courses;
import com.shareku.mapper.courses.CoursesMapper;
import com.shareku.service.courses.CoursesService;

public class CoursesServiceImpl implements CoursesService {

	@Autowired
	CoursesMapper coursesMapper;
	
	@Override
	public List<Courses> listAllCourses() {
		// TODO Auto-generated method stub
		return coursesMapper.listAllCourses();
	}

	@Override
	public List<Courses> listPageCourses(Courses courses) {
		// TODO Auto-generated method stub
		return coursesMapper.listPageCourses(courses);
	}

	@Override
	public Courses getCoursesById(Integer coursesId) {
		// TODO Auto-generated method stub
		return coursesMapper.getCoursesById(coursesId);
	}

	@Override
	public void insertCourses(Courses courses) {
		// TODO Auto-generated method stub
		coursesMapper.insertCourses(courses);
	}

	@Override
	public void updateCourses(Courses courses) {
		// TODO Auto-generated method stub
		coursesMapper.updateCourses(courses);
	}

	@Override
	public void deleteCourses(int coursesId) {
		// TODO Auto-generated method stub
		coursesMapper.deleteCourses(coursesId);
	}
	
	
}
