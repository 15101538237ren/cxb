package entity;

/**
 * Takeinproject entity. @author MyEclipse Persistence Tools
 */

public class Takeinproject implements java.io.Serializable {

	// Fields

	private String id;
	private Student student;
	private Project project;
	private Integer SOrder;

	// Constructors

	/** default constructor */
	public Takeinproject() {
	}

	/** full constructor */
	public Takeinproject(Student student, Project project, Integer SOrder) {
		this.student = student;
		this.project = project;
		this.SOrder = SOrder;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Integer getSOrder() {
		return this.SOrder;
	}

	public void setSOrder(Integer SOrder) {
		this.SOrder = SOrder;
	}

}