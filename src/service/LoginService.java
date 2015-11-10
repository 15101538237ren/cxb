package service;

import dao.AllDAO;
import entity.Student;

public class LoginService {
	AllDAO allDAO;

	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}

	public Boolean checkUser(String xh, String password){
		Student student = null;// = (Student)this.getAllDAO().getStudentDAO().findBySXh(xh).get(0);
		
		try{
			student = (Student)this.getAllDAO().getStudentDAO().findBySXh(xh).get(0);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return student.getSPwd().equals(password);
	}
	
}
