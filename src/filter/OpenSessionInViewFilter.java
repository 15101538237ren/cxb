package filter;

import org.hibernate.FlushMode;  
import org.hibernate.HibernateException;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.springframework.dao.DataAccessResourceFailureException;  
import org.springframework.orm.hibernate3.SessionFactoryUtils;  

public class OpenSessionInViewFilter extends org.springframework.orm.hibernate3.support.OpenSessionInViewFilter {  
    protected Session getSession(SessionFactory sessionFactory) throws DataAccessResourceFailureException {  
            Session session = SessionFactoryUtils.getSession(sessionFactory, true);  
            session.setFlushMode(FlushMode.COMMIT);  
            return session;  
    }  

    protected void closeSession(Session session, SessionFactory factory) {  
            session.flush();  
            try {
            	session.getTransaction().commit();
            } catch (HibernateException e) {
            	super.closeSession(session, factory); 
            } 
    }  
}