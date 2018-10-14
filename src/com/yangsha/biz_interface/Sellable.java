package com.yangsha.biz_interface;

import java.util.List;

import com.yangsha.entity.Account;
import com.yangsha.entity.Pet;

public interface Sellable {

	public void sell(Pet pet);

	List<Account> getAccountint(int store_Id);
}
