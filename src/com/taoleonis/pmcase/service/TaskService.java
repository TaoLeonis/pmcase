package com.taoleonis.pmcase.service;

import com.taoleonis.pmcase.domain.Task;
import com.taoleonis.pmcase.mapper.TaskMapper;
import com.taoleonis.pmcase.domain.Rank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;


@Service
public class TaskService {

    @Autowired
    private TaskMapper taskMapper;

    public List<Task> getAllTask() { return taskMapper.getAllTask(); }
    public List<Task> getAllTaskByUsername(String username) { return taskMapper.getAllTaskByUsername(username); }
    public List<Task> getUnpreparedTasks() { return taskMapper.getUnpreparedTasks(); }
    public Task getTaskByTaskid(int taskid) { return taskMapper.getTaskByTaskid(taskid);
    }

    public int getTaskscore(int taskid) { return taskMapper.getTaskscore(taskid);
    }

    public List<Task> getAllDoneTask() { return taskMapper.getAllDoneTask(); }
    public List<Task> getAllDoneTaskByUsername(String username) { return taskMapper.getAllDoneTaskByUsername(username); }

    @Transactional
    public void insertTask(Task task) {
        taskMapper.insertTask(task);
    }

    @Transactional
    public void updateTask(Task task) {
        taskMapper.updateTask(task);
    }

    @Transactional
    public void updateTaskPrepared(int taskid) {
        taskMapper.updateTaskPrepared(taskid);
    }

    public void updateTaskscore(int taskid, int taskscore) {
        taskMapper.updateTaskscore(taskid, taskscore);
    }


    public void delTask(int taskid, String modifier, Timestamp updatetime) {
        taskMapper.delTask(taskid, modifier, updatetime);
    }

    //
    @Transactional
    public void insertRank(Rank rankForm) {
        taskMapper.insertRank(rankForm);
    }

    public List<Map<String, String>> getTotalScores() { return taskMapper.getTotalScores(); }
//    public List<Map<String, String>> getExeTimes() { return taskMapper.getExeTimes(); }

}
