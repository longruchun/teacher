package com.yangsha.dao_interface;

import java.util.List;

public interface IBaseDao<T> {

	int add(T t);
	int delete(int id);
	int update(T t);
	T getEntityById(int id);
	List<T> getAll();
}
