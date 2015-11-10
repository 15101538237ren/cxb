package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private String SId;
	private String SXm;
	private String SXh;
	private String SPwd;
	private String SNj;
	private String SSjh;
	private String SYx;
	private Set takeinprojects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String SXm, String SXh, String SNj, String SSjh, String SYx) {
		this.SXm = SXm;
		this.SXh = SXh;
		this.SNj = SNj;
		this.SSjh = SSjh;
		this.SYx = SYx;
	}

	/** full constructor */
	public Student(String SXm, String SXh, String SPwd, String SNj,
			String SSjh, String SYx, Set takeinprojects) {
		this.SXm = SXm;
		this.SXh = SXh;
		this.SPwd = SPwd;
		this.SNj = SNj;
		this.SSjh = SSjh;
		this.SYx = SYx;
		this.takeinprojects = takeinprojects;
	}

	// Property accessors

	public String getSId() {
		return this.SId;
	}

	public void setSId(String SId) {
		this.SId = SId;
	}

	public String getSXm() {
		return this.SXm;
	}

	public void setSXm(String SXm) {
		this.SXm = SXm;
	}

	public String getSXh() {
		return this.SXh;
	}

	public void setSXh(String SXh) {
		this.SXh = SXh;
	}

	public String getSPwd() {
		return this.SPwd;
	}

	public void setSPwd(String SPwd) {
		this.SPwd = SPwd;
	}

	public String getSNj() {
		return this.SNj;
	}

	public void setSNj(String SNj) {
		this.SNj = SNj;
	}

	public String getSSjh() {
		return this.SSjh;
	}

	public void setSSjh(String SSjh) {
		this.SSjh = SSjh;
	}

	public String getSYx() {
		return this.SYx;
	}

	public void setSYx(String SYx) {
		this.SYx = SYx;
	}

	public Set getTakeinprojects() {
		return this.takeinprojects;
	}

	public void setTakeinprojects(Set takeinprojects) {
		this.takeinprojects = takeinprojects;
	}

}