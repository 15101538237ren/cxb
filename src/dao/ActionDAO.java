package dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import entity.Action;

/**
 * A data access object (DAO) providing persistence and search support for
 * Action entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see entity.Action
 * @author MyEclipse Persistence Tools
 */

public class ActionDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ActionDAO.class);
	// property constants
	public static final String CLASS_NAME = "className";
	public static final String METHOD_NAME = "methodName";
	public static final String AUTHORITY_NAME = "authorityName";
	public static final String AUTHORITY_TYPE = "authorityType";

	protected void initDao() {
		// do nothing
	}

	public void save(Action transientInstance) {
		log.debug("saving Action instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Action persistentInstance) {
		log.debug("deleting Action instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Action findById(java.lang.String id) {
		log.debug("getting Action instance with id: " + id);
		try {
			Action instance = (Action) getHibernateTemplate().get(
					"entity.Action", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Action instance) {
		log.debug("finding Action instance by example");
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
		log.debug("finding Action instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Action as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByClassName(Object className) {
		return findByProperty(CLASS_NAME, className);
	}

	public List findByMethodName(Object methodName) {
		return findByProperty(METHOD_NAME, methodName);
	}

	public List findByAuthorityName(Object authorityName) {
		return findByProperty(AUTHORITY_NAME, authorityName);
	}

	public List findByAuthorityType(Object authorityType) {
		return findByProperty(AUTHORITY_TYPE, authorityType);
	}

	public List findAll() {
		log.debug("finding all Action instances");
		try {
			String queryString = "from Action";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Action merge(Action detachedInstance) {
		log.debug("merging Action instance");
		try {
			Action result = (Action) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Action instance) {
		log.debug("attaching dirty Action instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Action instance) {
		log.debug("attaching clean Action instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ActionDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ActionDAO) ctx.getBean("ActionDAO");
	}
}