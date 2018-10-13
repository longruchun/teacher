package com.yangsha.entity;

import java.util.Date;

public class Pet {

	int id;
	String name;
	String typeName;
	int health;//0Îª²»½¡¿µ£¬1Îª½¡¿µ
	int love;
	Date birthday;
	int owner_Id;
	int store_Id;
	public Pet(int id, String name, String typeName, int health, int love, Date birthday, int owner_Id, int store_Id) {
		super();
		this.id = id;
		this.name = name;
		this.typeName = typeName;
		this.health = health;
		this.love = love;
		this.birthday = birthday;
		this.owner_Id = owner_Id;
		this.store_Id = store_Id;
	}
	
	public Pet(String name, String typeName, int health, int love, Date birthday, int owner_Id, int store_Id) {
		super();
		
		this.name = name;
		this.typeName = typeName;
		this.health = health;
		this.love = love;
		this.birthday = birthday;
		this.owner_Id = owner_Id;
		this.store_Id = store_Id;
	}
	
	public Pet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getHealth() {
		return health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	public int getLove() {
		return love;
	}
	public void setLove(int love) {
		this.love = love;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getOwner_Id() {
		return owner_Id;
	}
	public void setOwner_Id(int owner_Id) {
		this.owner_Id = owner_Id;
	}
	public int getStore_Id() {
		return store_Id;
	}
	public void setStore_Id(int store_Id) {
		this.store_Id = store_Id;
	}
	
	
}
