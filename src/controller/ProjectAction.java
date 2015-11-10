package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.mysql.jdbc.StringUtils;
import com.opensymphony.xwork2.ActionContext;

import entity.Project;
import entity.Student;
import entity.Takeinproject;

/**
 * @author betterSoft
 * 
 */
public class ProjectAction extends BaseAction {

	public static final String SELECTED_PROJECT_ID = "selectedProjectId";
	private Project projectToSingleShow = null;
	private List<Student> selectedProjectAuthors = null; // 与projectToSingleShow对应的作者序列，[0]为第一作者，[1]为第二作者。以此类推。

	public Project getProjectToSingleShow() {
		return projectToSingleShow;
	}

	public void setProjectToSingleShow(Project projectToSingleShow) {
		this.projectToSingleShow = projectToSingleShow;
	}

	public List<Student> getSelectedProjectAuthors() {
		return selectedProjectAuthors;
	}

	public void setSelectedProjectAuthors(List<Student> selectedProjectAuthors) {
		this.selectedProjectAuthors = selectedProjectAuthors;
	}

	private String message;
	private String error;

	private Project project;
	private static List<Project> projectList;// 记录当前登录用户参加的所有项目。
	private static Map<Project, String> projectAndAuthorsList;

	private String pid; // 记录已经存在的项目项目id
	private String projectType; // 项目类型
	private String name; // 项目名称
	private String teacherName; // 指导教师
	private String newIdea; // 技术创新点
	private String difficult; // 技术难点

	private String telephone; // 第一作者手机号码
	private String email; // 第一作者邮箱

	private String secondNumber; // 第二作者学号
	private String secondName; // 第二个作者的姓名
	private String thirdNumber; // 第三作者学号
	private String thirdName; // 第三个作者的姓名

	private String fourthNumber; // 项目第四作者学号
	private String fifthNumber; // 项目第五作者学号

	private String authors;// 项目的所有作者
	private String teachres; // 项目的所有指导老师

	public List<Project> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<Project> projectList) {
		this.projectList = projectList;
	}

	public Map<Project, String> getProjectAndAuthorsList() {
		return projectAndAuthorsList;
	}

	public void setProjectAndAuthorsList(
			Map<Project, String> projectAndAuthorsList) {
		this.projectAndAuthorsList = projectAndAuthorsList;
	}

	public String getSecondName() {
		return secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public String getThirdName() {
		return thirdName;
	}

	public void setThirdName(String thirdName) {
		this.thirdName = thirdName;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getTeachres() {
		return teachres;
	}

	public void setTeachres(String teachres) {
		this.teachres = teachres;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getNewIdea() {
		return newIdea;
	}

	public void setNewIdea(String newIdea) {
		this.newIdea = newIdea;
	}

	public String getDifficult() {
		return difficult;
	}

	public void setDifficult(String difficult) {
		this.difficult = difficult;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecondNumber() {
		return secondNumber;
	}

	public void setSecondNumber(String secondNumber) {
		this.secondNumber = secondNumber;
	}

	public String getThirdNumber() {
		return thirdNumber;
	}

	public void setThirdNumber(String thirdNumber) {
		this.thirdNumber = thirdNumber;
	}

	public String getFourthNumber() {
		return fourthNumber;
	}

	public void setFourthNumber(String fourthNumber) {
		this.fourthNumber = fourthNumber;
	}

	public String getFifthNumber() {
		return fifthNumber;
	}

	public void setFifthNumber(String fifthNumber) {
		this.fifthNumber = fifthNumber;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	/**
	 * 页面中所显示的显示某一个project的信息，是根据从session中取出的project进行设置的。
	 * 从url中获取参数，得到当前选择的项目的ID。
	 * 
	 * @return
	 */
	public String singleProjectShow() {
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();

		HttpServletRequest request = ServletActionContext.getRequest();

		String id = request.getParameter(SELECTED_PROJECT_ID); // 得到项目名称
		if (projectList == null) {
			return ERROR;
		}
		for (int i = 0; i < projectList.size(); i++) {
			Project p = projectList.get(i);
			if (p == null) {
				continue;
			}
			if (p.getPId().equals(id)) {
				// 取出文本左右两侧的空格。
				p.setKeyTech(p.getKeyTech().trim());
				p.setInnovation(p.getInnovation().trim());

				projectToSingleShow = p;
				session.put("project", p);// 将查找的project类放入session中，如果已经存在则更新旧的。
			}
		}

		if (projectToSingleShow == null) {
			return ERROR;
		}

		selectedProjectAuthors = this.getAllService().getProjectService()
				.getAuthorsByProjectID(id);

		return SUCCESS;
	}

	public String newProject() {
		Map session = ActionContext.getContext().getSession();
		Student firstStudent = (Student) session.get("student");// 得到session中的学生信息

		authors = firstStudent.getSXm(); // 记录第一作者，用于页面显示

		List<String> studentIDs = new ArrayList<String>();
		studentIDs.add(firstStudent.getSXh());
		if (false == StringUtils.isNullOrEmpty(secondNumber)) {
			studentIDs.add(secondNumber);
		}
		if(false == StringUtils.isNullOrEmpty(thirdNumber)) {
			studentIDs.add(thirdNumber);
		}		

		if (fourthNumber != null) {
			studentIDs.add(fourthNumber);
			if (fifthNumber != null) {
				studentIDs.add(fifthNumber);
			}
		}

		// 如果没有相应的学生信息则保留在原页面
		if (false == this.getAllService().getStudentService()
				.haveStudentIDs(studentIDs)) {
			return NONE;
		}

		// 持久化
		try {
			if (projectType == null || name == null || newIdea == null
					|| difficult == null) {
				return NONE;
			}

			project = new Project();

			project.setKind(projectType);// 项目类型
			project.setMc(name); // 项目名称
			// project.getTeachers().add(teacherName); //指导教师
			project.setInnovation(newIdea);// 技术创新点
			project.setKeyTech(difficult);// 技术难点
		} catch (Exception e) {
			return NONE;
		}

		if (this.getAllService().getProjectService().save(project)) {
			message = "保存项目成功。";
			// return SUCCESS;
		} else {
			error = "保存项目到数据库时出错了！";
			// return INPUT;
		}

		session.put("project", project);// 将申请的项目保存在session中

		// 保存第一作者的修改信息
		firstStudent.setSSjh(telephone);
		firstStudent.setSYx(email);

		this.getAllService().getStudentService().save(firstStudent);

		// //设置第2、3、4、5作者
		// 记录关系表Takeinproject，有几个作者就有几条记录
		for (int index = 0; index < studentIDs.size(); index++) {
			// 查找作者信息
			Student student = this.getAllService().getStudentService()
					.getByXH(studentIDs.get(index));
			if (student == null) {
				return NONE;
			}
			if (index >= 1) {
				authors += ", " + student.getSXm();
			}
			// 测试学生信息
			Takeinproject takeinproject = new Takeinproject();

			takeinproject.setProject(project); // 设置该项目
			takeinproject.setSOrder(index + 1); // 记录该作者的序号，从第1作者开始
			takeinproject.setStudent(student);

			this.getAllService().getTakeinprojectService().save(takeinproject);
		}

		session.put("authors", authors);
		return SUCCESS;
	}

	public String save() {
		System.out.println("正在保存项目：" + name);
		Map session = ActionContext.getContext().getSession();
		Student firstStudent = (Student) session.get("student");// 得到session中的学生信息

		authors = firstStudent.getSXm(); // 记录第一作者用于页面显示

		List<String> studentIDs = new ArrayList<String>();
		studentIDs.add(firstStudent.getSXh());
		if (StringUtils.isNullOrEmpty(secondNumber)
				|| StringUtils.isNullOrEmpty(thirdNumber)) {

		} else {
			studentIDs.add(secondNumber);
			studentIDs.add(thirdNumber);
		}

		if (fourthNumber != null) {
			studentIDs.add(fourthNumber);
			if (fifthNumber != null) {
				studentIDs.add(fifthNumber);
			}
		}

		// 如果没有相应的学生信息则保留在原页面
		if (false == this.getAllService().getStudentService()
				.haveStudentIDs(studentIDs)) {
			return NONE;
		}

		// 持久化
		try {
			if (projectType == null || name == null || newIdea == null
					|| difficult == null) {
				return NONE;
			}
			project = (Project) session.get("project");
			if (project == null) {
				project = new Project();
			}
			project.setKind(projectType);// 项目类型
			project.setMc(name); // 项目名称
			// project.getTeachers().add(teacherName); //指导教师
			project.setInnovation(newIdea);// 技术创新点
			project.setKeyTech(difficult);// 技术难点
		} catch (Exception e) {
			return NONE;
		}

		if (this.getAllService().getProjectService().save(project)) {
			message = "保存项目成功。";
			// return SUCCESS;
		} else {
			error = "保存项目到数据库时出错了！";
			// return INPUT;
		}

		session.put("project", project);// 将申请的项目保存在session中

		// 保存第一作者的修改信息
		firstStudent.setSSjh(telephone);
		firstStudent.setSYx(email);

		this.getAllService().getStudentService().save(firstStudent);

		// //设置第2、3、4、5作者
		// 记录关系表Takeinproject，有几个作者就有几条记录
		for (int index = 0; index < studentIDs.size(); index++) {
			// 查找作者信息
			Student student = this.getAllService().getStudentService()
					.getByXH(studentIDs.get(index));
			if (student == null) {
				return NONE;
			}
			if (index >= 1) {
				authors += ", " + student.getSXm();
			}
			// 测试学生信息
			Takeinproject takeinproject = new Takeinproject();

			takeinproject.setProject(project); // 设置该项目
			takeinproject.setSOrder(index + 1); // 记录该作者的序号，从第1作者开始
			takeinproject.setStudent(student);

			this.getAllService().getTakeinprojectService().save(takeinproject);
		}

		session.put("authors", authors);

		return SUCCESS;
	}

	/**用于显示某一个项目的信息页面。
	 * @return
	 */
	public String show() {
		try {
			Map session = ActionContext.getContext().getSession();
			Student student = (Student) session.get("student");// 得到session中的学生信息
			String hql = "from entity.Project as obj where obj.PId in "
					+ "(select t.project.PId from entity.Takeinproject as t where t.SOrder=1 and t.student.SId = ?) ";
			// String hql =
			// "from entity.Takeinproject as t where t.student.SId = ?";
			List v = new ArrayList();
			v.add(student.getSId());

			List<Project> projects = this.getAllService().getProjectService()
					.getAllDAO().getQueryBean().findByHql(hql, v);
			this.projectAndAuthorsList = new HashMap();

			if (!projects.isEmpty()) {
				this.projectList = projects;
				// 对所有方案进行处理，以便显示到页面上。
				for (int i = 0; i < projects.size(); i++) {
					project = projects.get(i);
					// System.out.println(project.getTakeinprojects().size());
					Object[] list = project.getTakeinprojects().toArray();

					authors = student.getSXm();// 获取第一个作者

					for (int j = 0; j < list.length; j++) {
						Takeinproject t = (Takeinproject) list[j];
						Student s = t.getStudent();
						switch (t.getSOrder()) {
						case 2:
							secondNumber = s.getSXh();
							secondName = s.getSXm();
							authors += StringUtils.isNullOrEmpty(secondName) ? ""
									: ", " + secondName;
							break;
						case 3:
							thirdNumber = s.getSXh();
							thirdName = s.getSXm();
							authors += StringUtils.isNullOrEmpty(secondName) ? ""
									: ", " + thirdName;
							break;
						}
					}
					//System.out.println(authors);
					this.projectAndAuthorsList.put(project, authors);

				}
				// authors = student.getSXm() + ", " + secondName + ", "
				// + thirdName;
				session.put("project", project);
				session.put("projectList", this.projectList);
				session.put("projectAndAuthorsList", projectAndAuthorsList);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return LOGIN;
		}
		return SUCCESS;
	}

	// 当用户点击已经存在的项目连接时，根据已经存在的项目ID，编辑已经有的项目信息
	public String editProject() {
		Map session = ActionContext.getContext().getSession();
		project = (Project) session.get("project");

		return SUCCESS;
	}

	// 列出所有申报的项目
	public String list() {
		return SUCCESS;
	}

	// 导出项目列表
	public String export() {
		return SUCCESS;
	}
}
