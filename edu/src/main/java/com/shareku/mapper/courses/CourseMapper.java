package com.shareku.mapper.courses;

import java.util.List;

import com.shareku.entity.courses.Course;
import com.shareku.entity.courses.Video;

public interface CourseMapper  {
	List<Course> listAllCourse();
	
	List<Course> listPageCourse(Course Course);
	
	Course getCourseById(Integer coursesId);
	
	void insertCourse(Course Course);
	
	void updateCourse(Course Course);
	
	void deleteCourse(int coursesId);
	
	void addvideo(Video video);
}
