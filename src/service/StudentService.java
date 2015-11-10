package service;

import java.util.List;

import com.mysql.jdbc.StringUtils;

import dao.AllDAO;
import entity.Student;


public class StudentService {
	AllDAO allDAO;

	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}
	
	//根据学号获取学生，学生的学号是唯一确定的
	public Student getByXH(String SXh){
		List list = this.getAllDAO().getStudentDAO().findBySXh(SXh);
		if(list == null || list.isEmpty()){
			return null;
		}
		return (Student)list.get(0);
	}
	
	//保存学生信息
	public boolean save(Student student){
		try{
			this.getAllDAO().getStudentDAO().merge(student);
			return true;
		}catch(RuntimeException re){
			re.printStackTrace();
			return false;
		}
	}
	
	//验证多个学生的学号，不存在某一个学号返回false，所有学号都存在返回true
	public boolean haveStudentIDs(List<String> studentIDs){
		if(studentIDs == null){
			return false;
		}
		
		//如果没有相应的学生信息则保留在原页面
		for(int index = 0; index < studentIDs.size(); index++){
			String id = studentIDs.get(index);
			if(StringUtils.isNullOrEmpty(id)){
				continue;
			}
			//查找作者信息
			Student student = this.getByXH(id.toString());
			if(student == null){
				return false;
			}
			else{
				continue;
			}
		}
		return true;
	}
	
	//检查某一个学号是否存在
	public boolean havaStudentID(String id){
		Student student = this.getByXH(id);
		if(student == null){
			return false;
		}
		return true;		
	}
}
