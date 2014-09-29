package com.shareku.mapper.courses;

import java.util.List;

import com.shareku.entity.courses.Courses;

public interface CoursesMapper  {
	List<Courses> listAllCourses();
	
	List<Courses> listPageCourses(Courses Courses);
	
	Courses getCoursesById(Integer coursesId);
	
	void insertCourses(Courses Courses);
	
	void updateCourses(Courses Courses);
	
	void deleteCourses(int coursesId);
}
