package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Project entity. @author MyEclipse Persistence Tools
 */

public class Project implements java.io.Serializable {

	// Fields

	private String PId;
	private String mc;
	private String kind;
	private String innovation;
	private String keyTech;
	private Boolean paperFlag;
	private Boolean videoFlag;
	private Boolean picFlag;
	private Set RTeacherProjects = new HashSet(0);
	private Set takeinprojects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Project() {
	}

	/** minimal constructor */
	public Project(String mc, String kind) {
		this.mc = mc;
		this.kind = kind;
	}

	/** full constructor */
	public Project(String mc, String kind, String innovation, String keyTech,
			Boolean paperFlag, Boolean videoFlag, Boolean picFlag,
			Set RTeacherProjects, Set takeinprojects) {
		this.mc = mc;
		this.kind = kind;
		this.innovation = innovation;
		this.keyTech = keyTech;
		this.paperFlag = paperFlag;
		this.videoFlag = videoFlag;
		this.picFlag = picFlag;
		this.RTeacherProjects = RTeacherProjects;
		this.takeinprojects = takeinprojects;
	}

	// Property accessors

	public String getPId() {
		return this.PId;
	}

	public void setPId(String PId) {
		this.PId = PId;
	}

	public String getMc() {
		return this.mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}

	public String getKind() {
		return this.kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getInnovation() {
		return this.innovation;
	}

	public void setInnovation(String innovation) {
		this.innovation = innovation;
	}

	public String getKeyTech() {
		return this.keyTech;
	}

	public void setKeyTech(String keyTech) {
		this.keyTech = keyTech;
	}

	public Boolean getPaperFlag() {
		return this.paperFlag;
	}

	public void setPaperFlag(Boolean paperFlag) {
		this.paperFlag = paperFlag;
	}

	public Boolean getVideoFlag() {
		return this.videoFlag;
	}

	public void setVideoFlag(Boolean videoFlag) {
		this.videoFlag = videoFlag;
	}

	public Boolean getPicFlag() {
		return this.picFlag;
	}

	public void setPicFlag(Boolean picFlag) {
		this.picFlag = picFlag;
	}

	public Set getRTeacherProjects() {
		return this.RTeacherProjects;
	}

	public void setRTeacherProjects(Set RTeacherProjects) {
		this.RTeacherProjects = RTeacherProjects;
	}

	public Set getTakeinprojects() {
		return this.takeinprojects;
	}

	public void setTakeinprojects(Set takeinprojects) {
		this.takeinprojects = takeinprojects;
	}

}