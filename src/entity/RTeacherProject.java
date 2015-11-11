package entity;

/**
 * RTeacherProject entity. @author MyEclipse Persistence Tools
 */

public class RTeacherProject implements java.io.Serializable {

	// Fields

	private RTeacherProjectId id;

	// Constructors

	/** default constructor */
	public RTeacherProject() {
	}

	/** full constructor */
	public RTeacherProject(RTeacherProjectId id) {
		this.id = id;
	}

	// Property accessors

	public RTeacherProjectId getId() {
		return this.id;
	}

	public void setId(RTeacherProjectId id) {
		this.id = id;
	}

}