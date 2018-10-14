package com.yangsha.biz_impl;

import java.util.List;

import com.yangsha.biz_interface.AccountBiz_interface;
import com.yangsha.dao_impl.AccountDaoImpl;
import com.yangsha.dao_interface.IaccountDao;
import com.yangsha.entity.Account;
import com.yangsha.entity.Pet;



public class AccountBiz_impl implements AccountBiz_interface {
 
	IaccountDao dao=new AccountDaoImpl();
	
	

	
	
	@Override
	public List<Account> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	@Override
	public int add(Account t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Account t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Account getEntityById(int id) {
		// TODO Auto-generated method stub
		return dao.getEntityById(id);
	}

	@Override
	public void sell(Pet pet) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Account> getAccountint(int store_Id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void buy(Pet pet) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean login() {
		// TODO Auto-generated method stub
		return false;
	}


}
