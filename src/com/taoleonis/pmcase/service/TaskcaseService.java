package com.taoleonis.pmcase.service;

import com.taoleonis.pmcase.domain.Taskcase;
import com.taoleonis.pmcase.domain.Taskcases;
import com.taoleonis.pmcase.mapper.TaskMapper;
import com.taoleonis.pmcase.mapper.TaskcaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TaskcaseService {

    @Autowired
    private TaskcaseMapper taskcaseMapper;

    @Autowired
    private TaskMapper taskMapper;

    public List<Taskcase> getAllTaskcase() { return taskcaseMapper.getAllTaskcase(); }


    public int getTaskCount(int taskid) { return taskcaseMapper.getTaskCount(taskid);
    }
    public int getTaskDoneCount(int taskid) { return taskcaseMapper.getTaskDoneCount(taskid);
    }
    public int getTaskGoodResultCount(int taskid) { return taskcaseMapper.getTaskGoodResultCount(taskid);
    }



    @Transactional
    public void insertTaskcases(Taskcases taskcases) {
        taskcaseMapper.insertCaseids(taskcases.getCaseids());
        taskcaseMapper.updateTaskid(taskcases);
        taskMapper.updateTaskPrepared(taskcases.getTaskid());
    }

    public void updateCasedone(int taskid, int caseid) {
        taskcaseMapper.updateCasedone(taskid, caseid);
    }

    @Transactional
    public void updateGoodCasescore(int taskid, int caseid) {
        taskcaseMapper.updateGoodCasescore(taskid, caseid);
    }

    public void updateBadCasescore(int taskid, int caseid) {
        taskcaseMapper.updateBadCasescore(taskid, caseid);
    }

    public void updateBadCasescore(int taskid, int caseid, String bugurl) {
        taskcaseMapper.updateBugurl(taskid, caseid, bugurl);
    }

}



