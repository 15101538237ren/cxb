package service;

import dao.AllDAO;
import entity.Project;
public class TeacherService {
	private AllDAO allDAO;
	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}
}
