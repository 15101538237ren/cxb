package util;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

//查询功能
public class QueryUtil extends HibernateDaoSupport {

	private int pageSize = 10;
	
	public PageUtil seek(HttpServletRequest request, String hql, List v){
		PageUtil pageBean = new PageUtil();
		String sort = "desc";
		String actionName;	
		String actionNameC;
		int pageNo;
		if(request.getParameter("pageNo") == null){
			pageNo = 1;//若没有指定就是首页
		}else{
			pageNo = Integer.valueOf(request.getParameter("pageNo"));
		}
		if(request.getParameter("pageSize") != null){
			pageSize = Integer.valueOf(request.getParameter("pageSize"));
		}
		if(request.getParameter("sort") != null){
			sort = request.getParameter("sort");
		}else if(request.getAttribute("sort") != null){
			sort = request.getAttribute("sort").toString();
		}
		
		actionName = request.getAttribute("actionName").toString();
		actionNameC = StringUtil.removeFromUrl(StringUtil.removeFromUrl(actionName, "column"),"sort");
		if(actionNameC.endsWith(".action") && !actionNameC.contains("referer=")){
			actionNameC += "?";
    	}else if(!actionNameC.endsWith("&")){
    		actionNameC += "&";
    	}
		hql += " " + sort;
		
		List list = findByPage(hql, v, pageNo, pageSize);
		int allCount = allCount(hql, v);
		
		int allPage = PageUtil.countTotalPage(pageSize, allCount);
		int firstNo = pageNo>5 ? pageNo-5 : 1;
		int lastNo = pageNo<allPage-5 ? pageNo+5 : allPage;
		List l = new ArrayList();
		for(int i=1;i<=allPage;i++){
			l.add(i);
		}
		
		pageBean.setPageList(l);
		pageBean.setList(list);
		pageBean.setPageNo(pageNo);
		pageBean.setPageSize(pageSize);
		pageBean.setAllCount(allCount);
		pageBean.setAllPage(allPage);
		pageBean.setFirstNo(firstNo);
		pageBean.setLastNo(lastNo);
		pageBean.setSort(sort);
		pageBean.setActionName(actionName);
		pageBean.setActionNameC(actionNameC);
		pageBean.init();
		return pageBean;
	}
	public List findByPage(String hql, List v, int pageNo, int pageSize){
		try {
			Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			Query queryObject = session.createQuery(hql);
			for(int i=0; i<v.size(); i++){
				queryObject.setParameter(i, v.get(i));
			}
			queryObject.setFirstResult((pageNo-1)*pageSize);
			queryObject.setMaxResults(pageSize);
			List list = queryObject.list();
			session.close();
			return list;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int allCount(String hql, List v){
		try {
			Session session=this.getHibernateTemplate().getSessionFactory().openSession();
			
			Query queryObject = session.createQuery(hql);
			for(int i=0; i<v.size(); i++){
				queryObject.setParameter(i, v.get(i));
			}
			int allCount = queryObject.list().size();
			session.close();
			return allCount;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findByHql(String hql, List v){
		try {
			Session session = this.getHibernateTemplate().getSessionFactory().openSession();
			Query queryObject = session.createQuery(hql);
			for(int i=0; i<v.size(); i++){
				queryObject.setParameter(i, v.get(i));
			}
			List list = queryObject.list();
			session.close();
			return list;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findByHql(String hql, List v, int firstResult, int maxResult){
		try {
			Session session = this.getHibernateTemplate().getSessionFactory().openSession();
			Query queryObject = session.createQuery(hql);
			for(int i=0; i<v.size(); i++){
				queryObject.setParameter(i, v.get(i));
			}
			queryObject.setFirstResult(firstResult);
			queryObject.setMaxResults(maxResult);
			List list = queryObject.list();
			session.close();
			return list;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public void updateByHql(String hql, List v){
		try {
			Session session = this.getHibernateTemplate().getSessionFactory().openSession();
			Transaction trans = session.beginTransaction();
			Query queryObject = session.createQuery(hql);
			for(int i=0; i<v.size(); i++){
				queryObject.setParameter(i, v.get(i));
			}
			queryObject.executeUpdate();
			trans.commit(); 
			session.close();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	
}