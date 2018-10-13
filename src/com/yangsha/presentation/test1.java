package com.yangsha.presentation;

import java.util.List;

import com.yangsha.biz_impl.petBiz_jdbcImpl;
import com.yangsha.biz_interface.IpetBiz;
import com.yangsha.entity.Pet;

public class test1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		IpetBiz biz=new petBiz_jdbcImpl();
        List<Pet> list=biz.getAll();
        
        System.out.println(list.size());
	}

}
