package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import util.PageUtil;
import util.StringUtil;
import dao.AllDAO;
import entity.Project;
import entity.Student;
import entity.Takeinproject;

public class ProjectService {
	private AllDAO allDAO;
	private List v = new ArrayList();
	private String hql;

	public AllDAO getAllDAO() {
		return allDAO;
	}

	public void setAllDAO(AllDAO allDAO) {
		this.allDAO = allDAO;
	}

	/**
	 * 根据项目ID，查找参加该项目的所有作者。
	 * 作者按照下标顺序递增，[0]第一作者，[1]第二作者，以此类推。
	 * @param projectId
	 * @return
	 */
	public List getAuthorsByProjectID(String projectId) {
		String hql = "from entity.Takeinproject as t where t.project.PId='"
				+ projectId + "'";
		hql += " order by t.SOrder asc";
		List l = this.getAllDAO().getTakeinprojectDAO().getHibernateTemplate()
				.find(hql);
		List<Student> stus  = new ArrayList();
		for(int i = 0; i < l.size(); i++){
			Takeinproject t = (Takeinproject) l.get(i);
			stus.add(t.getStudent());
		}
		return stus;
	}

	// 保存项目
	public boolean save(Project project) {
		try {
			this.getAllDAO().getProjectDAO().attachDirty(project);
			return true;
		} catch (RuntimeException re) {
			re.printStackTrace();
			return false;
		}
	}

	// 分页查询，获取项目名称，项目类型
	public PageUtil seekHql(HttpServletRequest request) {
		hql = "from entity.Project as p where 1=1";
		v.clear();

		String value = (String) request.getParameter("projectName");
		if (StringUtil.isNullOrEmpty(value) == false) {
			hql += " and p.mc like '%" + value + "%'";
			// v.add(value);
		}

		value = (String) request.getParameter("authorGrade");
		String studentID = (String) request.getParameter("authorID");

		// 如果需要按年级或学生学号查询（即，需要级联查询）
		if (StringUtil.isNullOrEmpty(value) == false
				|| StringUtil.isNullOrEmpty(studentID) == false) {
			String hqlTakeinproject = "select t.project.PId from entity.Takeinproject t, entity.Student s"
					+ " where t.student.SId = s.SId and t.SOrder = 1";

			if (StringUtil.isNullOrEmpty(value) == false) {
				// String hqlStudent =
				// "select s.SId from entity.Student s where s.SNj = ?";
				hqlTakeinproject += " and t.student.SNj = ?";
				v.add(new String(value));
			}
			if (StringUtil.isNullOrEmpty(studentID) == false) {
				hqlTakeinproject += " and t.student.SXh = ?";
				v.add(new String(studentID));
			}

			hql += " and p.PId in (" + hqlTakeinproject + " )";
		}

		hql += " order by p.PId";
		return this.getAllDAO().getQueryBean().seek(request, hql, v);
	}

	public PageUtil seekHqlForList(HttpServletRequest request) {
		hql = "from entity.Project as p where 1=1";
		v.clear();

		hql += " order by p.PId";
		return this.getAllDAO().getQueryBean().seek(request, hql, v);
	}
}
