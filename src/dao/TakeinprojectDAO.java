package dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import entity.Takeinproject;

/**
 * A data access object (DAO) providing persistence and search support for
 * Takeinproject entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see entity.Takeinproject
 * @author MyEclipse Persistence Tools
 */

public class TakeinprojectDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TakeinprojectDAO.class);
	// property constants
	public static final String _SORDER = "SOrder";
	public static final String _STUDENT = "student";
	
	protected void initDao() {
		// do nothing
	}

	public void save(Takeinproject transientInstance) {
		log.debug("saving Takeinproject instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Takeinproject persistentInstance) {
		log.debug("deleting Takeinproject instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Takeinproject findById(java.lang.String id) {
		log.debug("getting Takeinproject instance with id: " + id);
		try {
			Takeinproject instance = (Takeinproject) getHibernateTemplate()
					.get("entity.Takeinproject", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Takeinproject instance) {
		log.debug("finding Takeinproject instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Takeinproject instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Takeinproject as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySOrder(Object SOrder) {
		return findByProperty(_SORDER, SOrder);
	}

	public List findByStudent(Object student){
		return findByProperty(_STUDENT,student);
	}
	
	public List findAll() {
		log.debug("finding all Takeinproject instances");
		try {
			String queryString = "from Takeinproject";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Takeinproject merge(Takeinproject detachedInstance) {
		log.debug("merging Takeinproject instance");
		try {
			Takeinproject result = (Takeinproject) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Takeinproject instance) {
		log.debug("attaching dirty Takeinproject instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Takeinproject instance) {
		log.debug("attaching clean Takeinproject instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TakeinprojectDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TakeinprojectDAO) ctx.getBean("TakeinprojectDAO");
	}
}