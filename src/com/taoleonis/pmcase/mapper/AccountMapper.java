package com.taoleonis.pmcase.mapper;

import com.taoleonis.pmcase.domain.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper {

    Account getAccountByUsername(String username);

    
    List<Account> getAllKFAccount();

    Account getAccountByUsernameAndPassword(String username, String password);

    void insertAccount(Account account);

    void updateAccount(Account account);

    void insertSignon(Account account);

    void updateSignon(Account account);
}
