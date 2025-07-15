package com.r3sys.db;

public class User {
	static String id,name,designation,department,companyName,contact,address;
	
	static int userId;

	public static int getUserId() {
		return userId;
	}

	public static void setUserId(int userId) {
		User.userId = userId;
	}

	public static String getId() {
		return id;
	}

	public static void setId(String id) {
		User.id = id;
	}
	
	/*public static String getEmail() {
		return email;
	}

	public static void setEmail(String email) {
		User.email = email;
	}*/
	public static String getName() {
		return name;
	}

	public static void setName(String name) {
		User.name = name;
	}

	public static String getDesignation() {
		return designation;
	}

	public static void setDesignation(String designation) {
		User.designation = designation;
	}

	public static String getDepartment() {
		return department;
	}

	public static void setDepartment(String department) {
		User.department = department;
	}

	public static String getCompanyName() {
		return companyName;
	}

	public static void setCompanyName(String companyName) {
		User.companyName = companyName;
	}

	public static String getContact() {
		return contact;
	}

	public static void setContact(String contact) {
		User.contact = contact;
	}

	public static String getAddress() {
		return address;
	}

	public static void setAddress(String address) {
		User.address = address;
	}

	
}