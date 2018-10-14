package com.yangsha.dao_impl;

import java.util.List;


import com.yangsha.dao_interface.IaccountDao;
import com.yangsha.entity.Account;
import com.yangsha.entity.PetStore;
import com.yangsha.util.JdbcHelper;

public class AccountDaoImpl implements IaccountDao {

	@Override
	public int add(Account t) {
		String sql = "insert into account(deal_type,pet_id,seller_Id,buy_Id,price,deal_Time) values(?,?,?,?,?,?)";
		int i = JdbcHelper.executeUpdate(sql,t.getDeal_type(),t.getPet_Id(),t.getSell_Id(),t.getBuy_Id(),t.getPrice(),t.getPrice());
		return i;
	}

	@Override
	public int delete(int id) {
		
		    String sql = "delete from account where id=?";
	        int i =JdbcHelper.executeUpdate(sql, id);
			return i;
	}

	@Override
	public int update(Account t) {
		
		String sql = "update account set deal_type=?,pet_Id=? ,seller_Id=?,buy_Id=?,price=?,deal_Time=? where id=?";
        int i =JdbcHelper.executeUpdate(sql,t.getDeal_type(),t.getPet_Id(),t.getSell_Id(),t.getBuy_Id(),t.getBuy_Id(),t.getPrice(),t.getDeal_Time());
		return i;
	}

	@Override
	public List<Account> getAll() {
		String sql = "select * from account";
		List<Account> list = JdbcHelper.executeQuery(sql, Account.class);
		return list;
	}

	@Override
	public Account getEntityById(int id) {
		String sql = "select * from account where id=?";
		List<Account> list = JdbcHelper.executeQuery(sql,Account.class, id);
		return list.get(0)==null?null:list.get(0);
	}

}
