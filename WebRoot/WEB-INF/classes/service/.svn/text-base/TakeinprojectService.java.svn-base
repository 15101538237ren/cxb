package service;

import dao.AllDAO;
import entity.Takeinproject;;

public class TakeinprojectService {
	AllDAO allDAO;

	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}
	
	//保存项目
	public boolean save(Takeinproject takeinproject){
		try{
			this.getAllDAO().getTakeinprojectDAO().attachDirty(takeinproject);
			return true;
		}catch(RuntimeException re){
			re.printStackTrace();
			return false;
		}
	}
}
