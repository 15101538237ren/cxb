package util;

import java.util.List;

//分页功能
public class PageUtil {
	private List list;		//显示的内容
	private List pageList;
	
	private int allCount;	//记录数
	private int allPage;	//总页数
	private int pageNo;		//当前页
	private int pageSize;	//每页记录数
	private int firstNo;    //显示出的首页号
	private int lastNo;     //显示出的尾页号
	private String sort;    //排序方式
	private String actionName; //应用分页模板页的方法名
	private String actionNameC; //按列排序
	
	private boolean isFirstPage;    	//是否为第一页
	private boolean isLastPage;        	//是否为最后一页
    
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public int getAllPage() {
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
    
	public int getFirstNo() {
		return firstNo;
	}
	public void setFirstNo(int firstNo) {
		this.firstNo = firstNo;
	}
	public int getLastNo() {
		return lastNo;
	}
	public void setLastNo(int lastNo) {
		this.lastNo = lastNo;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getActionName() {
		return actionName;
	}
	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
	public String getActionNameC() {
		return actionNameC;
	}
	public void setActionNameC(String actionNameC) {
		this.actionNameC = actionNameC;
	}
	public List getPageList() {
		return pageList;
	}
	public void setPageList(List pageList) {
		this.pageList = pageList;
	}
	//初始化分页信息
	public void init(){
		this.isFirstPage = isFirstPage();
        this.isLastPage = isLastPage();
	}
	
	private boolean isFirstPage() {
		return pageNo == 1;
	}
    private boolean isLastPage() {
		return pageNo == allPage;
	}
    
    public static int countTotalPage(int pageSize, int allCount){
    	return allCount%pageSize == 0 ? allCount/pageSize : allCount/pageSize +1 ;
    }
    
    public static int countCurrentPage(int page){
    	return (page==0 ? 1 : page);
    }
}
