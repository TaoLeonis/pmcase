package com.taoleonis.pmcase.service;

import com.taoleonis.pmcase.domain.Account;
import com.taoleonis.pmcase.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Service
public class AccountService {

    @Autowired
    private AccountMapper accountMapper;
    

    
    public Account getAccount(String username) {
        return accountMapper.getAccountByUsername(username);
    }
    public List<Account> getAllKFAccount() {
        return accountMapper.getAllKFAccount();
    }


    
    public Account getAccount(String username, String password) {
        return accountMapper.getAccountByUsernameAndPassword(username, password);
    }


    @Transactional
    public void insertAccount(Account account) {
        accountMapper.insertAccount(account);
        accountMapper.insertSignon(account);
    }


    @Transactional
    public void updateAccount(Account account) {
        accountMapper.updateAccount(account);

        if (account.getPassword() != null && account.getPassword().length() > 0) {
            accountMapper.updateSignon(account);
        }
    }

}
