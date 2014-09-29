package com.shareku.service.courses;

import java.util.List;

import com.shareku.entity.courses.Courses;

public interface CoursesService {
	
	List<Courses> listAllCourses();
	
	public List<Courses> listPageCourses(Courses Courses);
	
	public Courses getCoursesById(Integer coursesId);
	
	public void insertCourses(Courses Courses);
	
	public void updateCourses(Courses Courses);
	
	public void deleteCourses(int coursesId);
}
