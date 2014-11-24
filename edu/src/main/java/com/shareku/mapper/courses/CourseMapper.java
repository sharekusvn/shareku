package com.shareku.mapper.courses;

import java.util.List;

import com.shareku.entity.courses.Course;

public interface CourseMapper  {
	List<Course> listAllCourse();
	
	List<Course> listPageCourse(Course Course);
	
	Course getCourseById(Integer coursesId);
	
	void insertCourse(Course Course);
	
	void updateCourse(Course Course);
	
	void deleteCourse(int coursesId);
}
