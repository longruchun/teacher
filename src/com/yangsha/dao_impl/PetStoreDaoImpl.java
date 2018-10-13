package com.yangsha.dao_impl;

import java.util.List;

import com.yangsha.dao_interface.IPetStoreDao;
import com.yangsha.entity.PetStore;
import com.yangsha.util.JdbcHelper;

public class PetStoreDaoImpl implements IPetStoreDao {

	@Override
	public int add(PetStore t) {
		String sql = "insert into petStore(name,password,balance) values(?,?,?)";
		int i = JdbcHelper.executeUpdate(sql,t.getName(),t.getPassword(),t.getBalance());
		return i;
	}

	@Override
	public int delete(int id) {
		
		    String sql = "delete from petStore where id=?";
	        int i =JdbcHelper.executeUpdate(sql, id);
			return i;
	}

	@Override
	public int update(PetStore t) {
		
		String sql = "update petStore set name=?,password=?,balance=? where id=?";
        int i =JdbcHelper.executeUpdate(sql,t.getName(),t.getPassword(),t.getBalance(),t.getId());
		return i;
	}

	@Override
	public List<PetStore> getAll() {
		String sql = "select * from petStore";
		List<PetStore> list = JdbcHelper.executeQuery(sql, PetStore.class);
		return list;
	}

	@Override
	public PetStore getEntityById(int id) {
		String sql = "select * from petStore where id=?";
		List<PetStore> list = JdbcHelper.executeQuery(sql, PetStore.class,id);
		return list.get(0)==null?null:list.get(0);
	}

}
