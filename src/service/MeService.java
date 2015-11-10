package service;

import dao.AllDAO;

/*
 *@author		:betterSoft
 *@writetime	:2011-10-31, 下午03:12:00
 *@Description	:TODO
 */
public class MeService extends AllService {
	AllDAO allDAO;

	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}
}
