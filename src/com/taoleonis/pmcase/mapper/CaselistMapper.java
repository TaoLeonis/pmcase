package com.taoleonis.pmcase.mapper;

import com.taoleonis.pmcase.domain.Caselist;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;


@Repository
public interface CaselistMapper {
    List<Caselist> getAllCaselist();

    Caselist getCaselist(int caseid);

    List<String> getBelongmoduleas();
    List<String> getBelongmodulebs();
    List<String> getBelongmodulecs();


    void insertCaselist(Caselist caselist);

    void updateCaselist(Caselist caselist);

    void delCaselist(@Param("caseid") int caseid, @Param("modifier") String modifier, @Param("updatetime") Timestamp updatetime);



}
