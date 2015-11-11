package dao;

import util.QueryUtil;


public class AllDAO {
	private QueryUtil queryBean;
	private StudentDAO studentDAO;
	private ProjectDAO projectDAO;
	private TakeinprojectDAO takeinprojectDAO;
	private TeacherDAO teacherDAO;
	private RTeacherProjectDAO rTeacherProjectDAO;
	public RTeacherProjectDAO getrTeacherProjectDAO() {
		return rTeacherProjectDAO;
	}

	public void setrTeacherProjectDAO(RTeacherProjectDAO rTeacherProjectDAO) {
		this.rTeacherProjectDAO = rTeacherProjectDAO;
	}

	public TeacherDAO getTeacherDAO() {
		return teacherDAO;
	}

	public void setTeacherDAO(TeacherDAO teacherDAO) {
		this.teacherDAO = teacherDAO;
	}

	public QueryUtil getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(QueryUtil queryBean) {
		this.queryBean = queryBean;
	}

	public StudentDAO getStudentDAO() {
		return studentDAO;
	}

	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	public ProjectDAO getProjectDAO() {
		return projectDAO;
	}

	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}

	public TakeinprojectDAO getTakeinprojectDAO() {
		return takeinprojectDAO;
	}

	public void setTakeinprojectDAO(TakeinprojectDAO takeinprojectDAO) {
		this.takeinprojectDAO = takeinprojectDAO;
	}

	
}
