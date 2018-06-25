package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;

import java.io.Serializable;
import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/25 20:12
 */
public interface BaseDao<T> {

    /**
     * 保存实体
     * @param entity 实体对象
     * @return 实体主键
     */
    Object save(T entity);

    void save(List<T> list);

    /**
     * 删除实体
     * @param entity 实体对象
     */
    void delete(T entity);

    void delete(List<T> list);

    /**
     * 更新实体
     * @param entity 实体对象
     */
    void update(Object entity);

    void update(List<T> list);

    /**
     * 保存或更新实体, 实体没有主键时保存，否则更新
     * @param entity 实体对象
     */
    void saveOrUpdate(Object entity);

    void saveOrUpdate(List<T> list);

    /**
     * 执行数据库更新操作
     * @param sql
     * @return 更新的记录条数
     */
    Integer executeSQLUpdate(String sql, Object... params);

    /**
     * 执行数据库更新操作
     * @param hql
     * @return 更新的记录条数
     */
    Integer executeHQLUpdate(String hql, Object... params);

    /**
     * 根据主键获取实体
     * @param id 主键
     * @return
     */
    T get(Serializable id);

    /**
     * 获取单个实体，根据查询语句及参数获取。
     * @param hql 查询语句
     * @param params 可选的查询参数
     * @return 单个实体，如果查询结果有多个，则返回第一个实体
     */
    T get(String hql, Object... params);

    /**
     * 查询实体列表
     * @param hql 查询语句
     * @param params 可选的查询参数
     * @return 实体列表
     */
    List<T> list(String hql, Object... params);

    /**
     * 分页查询实体
     * @param hql 查询语句
     * @param pageContainer 分页信息
     * @return 实体分页对象
     */
    PageContainer<T> list(String hql, PageContainer<T> pageContainer, Object... params);

    /**
     * 查询单值
     * @param hql
     * @param params
     * @return
     */
    Object getUniqueResult(String hql, Object... params);

}

