package com.shareku.service.courses;

import java.util.List;

import com.shareku.entity.courses.Course;

public interface CourseService {
	
	List<Course> listAllCourse();
	
	public List<Course> listPageCourse(Course Course);
	
	public Course getCourseById(Integer coursesId);
	
	public void insertCourse(Course Course);
	
	public void updateCourse(Course Course);
	
	public void deleteCourse(int coursesId);
}
