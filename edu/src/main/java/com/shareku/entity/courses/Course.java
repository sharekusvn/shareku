package com.shareku.entity.courses;


import java.util.Date;

import lombok.Data;

import com.shareku.entity.Page;

/**
 * 课程类
 * @author cicada
 * @date 2014-09-28 17:12
 *
 */
@Data
public class Course {
	private Integer courseId; // 课程ID
	private Integer courseOne; //一级分类
	private Integer courseTwo; //二级分类
	private Integer courseThree; //三级分类
	private String courseName; //课程名称
	private String keywords; //关键词
	private double coursePrice; //课程出售价格
	private double valuations; //课程估价
	private double discount; //折扣
	private String imagePath; //图片存放路径
	private Integer sales; //销售量
	private String lecturer; //讲师
	private String description; //课程描述
	private boolean recommend; //是否推荐
	private Integer status = 1; //课程状态1-仓库 2-发布
	private Date date; //发布日期
	private String filePath; //视频存放路径
	private Page page;
}
