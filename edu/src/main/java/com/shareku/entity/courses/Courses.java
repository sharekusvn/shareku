package com.shareku.entity.courses;


import java.util.Date;

import com.shareku.entity.Page;

/**
 * 课程类
 * @author cicada
 * @date 2014-09-28 17:12
 *
 */
public class Courses {
	private Integer coursesId;
	private Integer coursesCommonid; //公共课id
	private String coursesName; //课程名称
	private String coursesJingle; //课程广告词
	private Integer storeId; //学校id
	private String storeName; //学校名称
	private Integer gcId; //课程分类id
	private Integer brandId; //品牌id
	private double coursesPrice; //课程价格
	private double coursesMarketprice; //市场价
	private String coursesSerial; //商家编号
	private Integer coursesClick; //课程点击率
	private Integer coursesSalenum; //销售数量
	private Integer coursesCollect; //收藏数量
	private String coursesSpec; //课程章节序列化
	private Integer coursesStorage; //课程库存
	private String coursesImage; //课程主图
	private Integer coursesState; //课程状态 0下架，1正常，10违规（禁售）
	private Integer coursesVerify; //课程审核 1通过，0未通过，10审核中
	private Date coursesAddtime; //课程添加时间
	private Date coursesEdittime; //课程编辑时间
	private Integer coursesCommend; //课程推荐 1是，0否 默认0
	private String coursesStcids; //学校分类id 首尾用,隔开
	private Integer evaluationGoodStar; //好评星级
	private Integer evaluationCount; //评价数
	
	private Page page;

	public Integer getCoursesId() {
		return coursesId;
	}
	public void setCoursesId(Integer coursesId) {
		this.coursesId = coursesId;
	}
	public Integer getCoursesCommonid() {
		return coursesCommonid;
	}
	public void setCoursesCommonid(Integer coursesCommonid) {
		this.coursesCommonid = coursesCommonid;
	}
	public String getCoursesName() {
		return coursesName;
	}
	public void setCoursesName(String coursesName) {
		this.coursesName = coursesName;
	}
	public String getCoursesJingle() {
		return coursesJingle;
	}
	public void setCoursesJingle(String coursesJingle) {
		this.coursesJingle = coursesJingle;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public Integer getGcId() {
		return gcId;
	}
	public void setGcId(Integer gcId) {
		this.gcId = gcId;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	public double getCoursesPrice() {
		return coursesPrice;
	}
	public void setCoursesPrice(double coursesPrice) {
		this.coursesPrice = coursesPrice;
	}
	public double getCoursesMarketprice() {
		return coursesMarketprice;
	}
	public void setCoursesMarketprice(double coursesMarketprice) {
		this.coursesMarketprice = coursesMarketprice;
	}
	public String getCoursesSerial() {
		return coursesSerial;
	}
	public void setCoursesSerial(String coursesSerial) {
		this.coursesSerial = coursesSerial;
	}
	public Integer getCoursesClick() {
		return coursesClick;
	}
	public void setCoursesClick(Integer coursesClick) {
		this.coursesClick = coursesClick;
	}
	public Integer getCoursesSalenum() {
		return coursesSalenum;
	}
	public void setCoursesSalenum(Integer coursesSalenum) {
		this.coursesSalenum = coursesSalenum;
	}
	public Integer getCoursesCollect() {
		return coursesCollect;
	}
	public void setCoursesCollect(Integer coursesCollect) {
		this.coursesCollect = coursesCollect;
	}
	public String getCoursesSpec() {
		return coursesSpec;
	}
	public void setCoursesSpec(String coursesSpec) {
		this.coursesSpec = coursesSpec;
	}
	public Integer getCoursesStorage() {
		return coursesStorage;
	}
	public void setCoursesStorage(Integer coursesStorage) {
		this.coursesStorage = coursesStorage;
	}
	public String getCoursesImage() {
		return coursesImage;
	}
	public void setCoursesImage(String coursesImage) {
		this.coursesImage = coursesImage;
	}
	public Integer getCoursesState() {
		return coursesState;
	}
	public void setCoursesState(Integer coursesState) {
		this.coursesState = coursesState;
	}
	public Integer getCoursesVerify() {
		return coursesVerify;
	}
	public void setCoursesVerify(Integer coursesVerify) {
		this.coursesVerify = coursesVerify;
	}
	public Date getCoursesAddtime() {
		return coursesAddtime;
	}
	public void setCoursesAddtime(Date coursesAddtime) {
		this.coursesAddtime = coursesAddtime;
	}
	public Date getCoursesEdittime() {
		return coursesEdittime;
	}
	public void setCoursesEdittime(Date coursesEdittime) {
		this.coursesEdittime = coursesEdittime;
	}
	public Integer getCoursesCommend() {
		return coursesCommend;
	}
	public void setCoursesCommend(Integer coursesCommend) {
		this.coursesCommend = coursesCommend;
	}
	public String getCoursesStcids() {
		return coursesStcids;
	}
	public void setCoursesStcids(String coursesStcids) {
		this.coursesStcids = coursesStcids;
	}
	public Integer getEvaluationGoodStar() {
		return evaluationGoodStar;
	}
	public void setEvaluationGoodStar(Integer evaluationGoodStar) {
		this.evaluationGoodStar = evaluationGoodStar;
	}
	public Integer getEvaluationCount() {
		return evaluationCount;
	}
	public void setEvaluationCount(Integer evaluationCount) {
		this.evaluationCount = evaluationCount;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
}
