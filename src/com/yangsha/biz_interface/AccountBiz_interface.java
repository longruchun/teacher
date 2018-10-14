package com.yangsha.biz_interface;

import java.util.List;

import com.yangsha.entity.Account;


public interface AccountBiz_interface extends Sellable, Buyable,IBaseBizable<Account> {

	boolean login();
	
	List<Account> getAll();
}
