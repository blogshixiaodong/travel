package com.fz.travel.dao;

import com.fz.travel.bean.PageContainer;

/*
 * date:   2018年4月10日 下午3:28:47
 * author: Shixiaodong
 */
public interface PageDao<T> {
	
	PageContainer<T> getPageContainer();

	void setPageContainer(PageContainer<T> pageContainer);
	
}
