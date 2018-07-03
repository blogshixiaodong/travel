package com.fz.travel.dao.impl;

import com.fz.travel.bean.LineScenery;
import com.fz.travel.dao.LineSceneryDao;
import org.springframework.stereotype.Repository;

/**
 * @author Shixiaodong
 * @date 2018/7/3 14:43
 */
@Repository
public class LineSceneryDaoImpl extends AbstractBaseDao implements LineSceneryDao {

    @Override
    public void insertLineScenery(LineScenery lineScenery) {
//        String sql = "INSERT INTO lineScenery(sceneryId, touristLineId, sequence) VALUES(?, ?, ?)";
//        this.executeSQLUpdate(sql, lineScenery.getScenery().getSceneryId(), lineScenery.getTouristLine().getTouristLineId(), lineScenery.getSequence());
        this.save(lineScenery);
    }

    @Override
    public void updateLineScenery(LineScenery lineScenery) {
        this.update(lineScenery);
    }

    @Override
    public void deleteLineScenery(LineScenery lineScenery) {
        this.delete(lineScenery);
    }
}
