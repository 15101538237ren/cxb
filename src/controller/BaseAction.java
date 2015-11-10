package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;

import dao.AdministratorDAO;

import service.AllService;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport{
	protected static final Logger log = LoggerFactory
	.getLogger(AdministratorDAO.class);
	
	//引用所有服务
	private AllService allService;

	public AllService getAllService() {
		return allService;
	}

	public void setAllService(AllService allService) {
		this.allService = allService;
	}
}
