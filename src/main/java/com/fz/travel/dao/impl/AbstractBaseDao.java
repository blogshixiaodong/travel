package com.fz.travel.dao.impl;

import com.fz.travel.bean.PageContainer;
import com.fz.travel.dao.BaseDao;
import com.fz.travel.utils.ReflectUtils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;


/**
 * @author Shixiaodong
 * @date 2018/6/25 20:16
 */
@Repository
public abstract class AbstractBaseDao<T> implements BaseDao<T> {

    @Autowired
    protected SessionFactory sessionFactory;

    protected Session session;

    protected Class<T> entityClass;

    public AbstractBaseDao() {
        entityClass = ReflectUtils.getClass(getClass());
    }

    @Override
    public Object save(T entity) {
        return getSession().save(entity);
    }

    @Override
    public void save(List<T> list) {
        for(T t : list) {
            save(t);
        }
    }

    @Override
    public void delete(T entity) {
        session.delete(entity);
    }

    @Override
    public void delete(List<T> list) {
        for(T t : list) {
            delete(t);
        }
    }

    @Override
    public void update(Object entity) {
        session.update(entity);
    }

    @Override
    public void update(List<T> list) {
        for(T t : list) {
            update(t);
        }
    }

    @Override
    public void saveOrUpdate(Object entity) {
        session.saveOrUpdate(entity);
    }

    @Override
    public void saveOrUpdate(List<T> list) {
        for(T t : list) {
            saveOrUpdate(t);
        }
    }

    @Override
    public Integer executeSQLUpdate(String sql, Object... params) {
        NativeQuery nativeQuery = getSession().createNativeQuery(sql);
        setParameter(nativeQuery, params);
        return nativeQuery.executeUpdate();
    }

    @Override
    public Integer executeHQLUpdate(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        setParameter(query, params);
        return query.executeUpdate();
    }

    @Override
    public T get(Serializable id) {
        return getSession().get(entityClass, id);
    }

    @Override
    public T get(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        setParameter(query, params);
        List<T> list = query.list();
        if(list == null || list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public List<T> list(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        setParameter(query, params);
        List<T> list = query.list();
        return list;
    }

    @Override
    public PageContainer<T> list(String hql, PageContainer<T> pageContainer, Object... params) {
        Query query = getSession().createQuery(hql.toString());
        int pageSize = pageContainer.getPageSize();
        int currentPageNo = pageContainer.getCurrentPageNo();
        if (pageSize > 0 && currentPageNo > 0) {
            query.setFirstResult((currentPageNo < 2) ? 0 : (currentPageNo - 1) * pageSize);
            query.setMaxResults(pageSize);
        }
        setParameter(query, params);

        List<T> list = query.list();
        System.out.println(entityClass.getSimpleName());
        String countString = "SELECT COUNT(*) " + hql.substring(hql.indexOf("FROM"));
        query = getSession().createQuery(countString);
        setParameter(query, params);
        pageContainer.setRecordCount(Integer.parseInt(query.uniqueResult().toString()));
        pageContainer.setList(list);
        return pageContainer;
    }

    @Override
    public Object getUniqueResult(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        setParameter(query, params);
        return query.uniqueResult();
    }

    public Session getSession() {
        if(session == null || !session.isOpen()) {
            if(sessionFactory.isClosed()) {
            }
            session = sessionFactory.openSession();
        }
        return sessionFactory.getCurrentSession();
    }

    private void setParameter(Query query, Object... params) {
        for(int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
    }

}
