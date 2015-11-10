package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Action entity. @author MyEclipse Persistence Tools
 */

public class Action implements java.io.Serializable {

	// Fields

	private String AId;
	private String className;
	private String methodName;
	private String authorityName;
	private String authorityType;
	private Set roles = new HashSet(0);

	// Constructors

	/** default constructor */
	public Action() {
	}

	/** minimal constructor */
	public Action(String className, String methodName, String authorityName) {
		this.className = className;
		this.methodName = methodName;
		this.authorityName = authorityName;
	}

	/** full constructor */
	public Action(String className, String methodName, String authorityName,
			String authorityType, Set roles) {
		this.className = className;
		this.methodName = methodName;
		this.authorityName = authorityName;
		this.authorityType = authorityType;
		this.roles = roles;
	}

	// Property accessors

	public String getAId() {
		return this.AId;
	}

	public void setAId(String AId) {
		this.AId = AId;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodName() {
		return this.methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getAuthorityName() {
		return this.authorityName;
	}

	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}

	public String getAuthorityType() {
		return this.authorityType;
	}

	public void setAuthorityType(String authorityType) {
		this.authorityType = authorityType;
	}

	public Set getRoles() {
		return this.roles;
	}

	public void setRoles(Set roles) {
		this.roles = roles;
	}

}