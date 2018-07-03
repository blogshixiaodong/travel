package com.fz.travel.service.impl;

import com.fz.travel.bean.LineScenery;
import com.fz.travel.dao.LineSceneryDao;
import com.fz.travel.service.LineSceneryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.Oneway;

/**
 * @author Shixiaodong
 * @date 2018/7/3 15:02
 */
@Service
public class LineSceneryServiceImpl implements LineSceneryService {

    @Autowired
    private LineSceneryDao lineSceneryDao;

    @Override
    public void addLineScenery(LineScenery lineScenery) {
        lineSceneryDao.insertLineScenery(lineScenery);
    }

    @Override
    public void updateLineScenery(LineScenery lineScenery) {
        lineSceneryDao.updateLineScenery(lineScenery);
    }

    @Override
    public void deleteLineScenery(LineScenery lineScenery) {
        lineSceneryDao.deleteLineScenery(lineScenery);
    }
}
