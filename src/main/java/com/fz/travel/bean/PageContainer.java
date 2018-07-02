package com.fz.travel.bean;

import com.fz.travel.utils.JsonUtils;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import java.io.Serializable;
import java.util.List;

/**
 * @author Shixiaodong
 * @date 2018/6/25 20:12
 */
public class PageContainer<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer pageSize;

    private Integer recordCount;

    private Integer pageCount;

    private Integer currentPageNo;

    private List<T> list;

    public Integer getPageSize() {
        if(pageSize == null) {
            pageSize = 5;
        }
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
        pageCount = recordCount / getPageSize();
        if(recordCount % getPageSize() != 0) {
            pageCount += 1;
        }
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(Integer currentPageNo) {
        this.currentPageNo = currentPageNo;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageContainer{" +
                "pageSize=" + pageSize +
                ", recordCount=" + recordCount +
                ", pageCount=" + pageCount +
                ", currentPageNo=" + currentPageNo +
                ", list=" + list +
                '}';
    }

    public class PageContainerJson {
        protected Integer total;
        protected Object rows;
        protected Integer pageSize;
        protected Integer recordCount;
        protected Integer pageCount;
        protected Integer currentPageNo;

        public Integer getTotal() {
            return total;
        }

        public void setTotal(Integer total) {
            this.total = total;
        }

        public Object getRows() {
            return rows;
        }

        public void setRows(Object rows) {
            this.rows = rows;
        }

        public Integer getPageSize() {
            return pageSize;
        }

        public void setPageSize(Integer pageSize) {
            this.pageSize = pageSize;
        }

        public Integer getRecordCount() {
            return recordCount;
        }

        public void setRecordCount(Integer recordCount) {
            this.recordCount = recordCount;
        }

        public Integer getPageCount() {
            return pageCount;
        }

        public void setPageCount(Integer pageCount) {
            this.pageCount = pageCount;
        }

        public Integer getCurrentPageNo() {
            return currentPageNo;
        }

        public void setCurrentPageNo(Integer currentPageNo) {
            this.currentPageNo = currentPageNo;
        }
    }

    public String toJson(String... properties) {
        JsonConfig jsonConfig = JsonUtils.JsonExclude(properties);
        PageContainerJson pageContainerJson = new PageContainerJson();
        pageContainerJson.setTotal(this.recordCount);
        pageContainerJson.setRows(this.list);
        pageContainerJson.setCurrentPageNo(this.currentPageNo);
        pageContainerJson.setPageCount(this.pageCount);
        pageContainerJson.setPageSize(this.pageSize);
        pageContainerJson.setRecordCount(this.recordCount);
        return JSONObject.fromObject(pageContainerJson, jsonConfig).toString();
    }
}
