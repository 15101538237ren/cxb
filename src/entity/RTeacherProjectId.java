package entity;

/**
 * RTeacherProjectId entity. @author MyEclipse Persistence Tools
 */

public class RTeacherProjectId implements java.io.Serializable {

	// Fields

	private Project project;
	private String TId;

	// Constructors

	/** default constructor */
	public RTeacherProjectId() {
	}

	/** full constructor */
	public RTeacherProjectId(Project project, String TId) {
		this.project = project;
		this.TId = TId;
	}

	// Property accessors

	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getTId() {
		return this.TId;
	}

	public void setTId(String TId) {
		this.TId = TId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RTeacherProjectId))
			return false;
		RTeacherProjectId castOther = (RTeacherProjectId) other;

		return ((this.getProject() == castOther.getProject()) || (this
				.getProject() != null && castOther.getProject() != null && this
				.getProject().equals(castOther.getProject())))
				&& ((this.getTId() == castOther.getTId()) || (this.getTId() != null
						&& castOther.getTId() != null && this.getTId().equals(
						castOther.getTId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getProject() == null ? 0 : this.getProject().hashCode());
		result = 37 * result
				+ (getTId() == null ? 0 : this.getTId().hashCode());
		return result;
	}

}