package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class Role implements java.io.Serializable {

	// Fields

	private String RId;
	private String roleName;
	private String description;
	private Short status;
	private Set administrators = new HashSet(0);
	private Set actions = new HashSet(0);

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String roleName, String description, Short status) {
		this.roleName = roleName;
		this.description = description;
		this.status = status;
	}

	/** full constructor */
	public Role(String roleName, String description, Short status,
			Set administrators, Set actions) {
		this.roleName = roleName;
		this.description = description;
		this.status = status;
		this.administrators = administrators;
		this.actions = actions;
	}

	// Property accessors

	public String getRId() {
		return this.RId;
	}

	public void setRId(String RId) {
		this.RId = RId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Set getAdministrators() {
		return this.administrators;
	}

	public void setAdministrators(Set administrators) {
		this.administrators = administrators;
	}

	public Set getActions() {
		return this.actions;
	}

	public void setActions(Set actions) {
		this.actions = actions;
	}

}