package com.yangsha.biz_interface;

import java.util.List;

public interface IBaseBizable<T> {
	int add(T t);
	int delete(int id);
	int update(T t);
	T getEntityById(int id);
	List<T> getAll();
}
