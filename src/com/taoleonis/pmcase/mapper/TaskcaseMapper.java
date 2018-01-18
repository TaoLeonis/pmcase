package com.taoleonis.pmcase.mapper;


import com.taoleonis.pmcase.domain.Taskcase;
import com.taoleonis.pmcase.domain.Taskcases;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskcaseMapper {

    List<Taskcase> getAllTaskcase();

    //查询某任务用例总数
    int getTaskCount(@Param("taskid") int taskid);
    //查询某任务已评分用例总数
    int getTaskDoneCount(@Param("taskid") int taskid);
    //查询已完成任务中认证执行的用例个数
    int getTaskGoodResultCount(@Param("taskid") int taskid);


    void insertCaseids(List<Integer> caseids);

    void updateTaskid(Taskcases taskcases);


    void updateCasedone(@Param("taskid") int taskid, @Param("caseid") int caseid);

    void updateGoodCasescore(@Param("taskid") int taskid, @Param("caseid") int caseid);
    void updateBadCasescore(@Param("taskid") int taskid, @Param("caseid") int caseid);

    void updateBugurl(@Param("taskid") int taskid, @Param("caseid") int caseid, @Param("bugurl") String bugurl);



}
