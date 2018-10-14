package com.yangsha.biz_interface;

import java.util.List;

import com.yangsha.entity.PetStore;

public interface PetStoreBiz_interface extends Sellable, Buyable, Breedable,IBaseBizable<PetStore> {

	PetStore login();
	
	List<PetStore> getAll();
}
