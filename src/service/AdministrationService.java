package service;

import dao.AllDAO;

/*
 *@author		:betterSoft
 *@writetime	:2011-10-31, 下午04:49:25
 *@Description	:TODO
 */
public class AdministrationService extends AllService{
	AllDAO allDAO;

	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}
}
