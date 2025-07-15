package com.r3sys.db;

public class Employee {
	static String email,password;
	
	static int empId;

	public static int getEmpId() {
		return empId;
	}

	public static void setEmpId(int empId) {
		Employee.empId = empId;
	}

	public static String getEmail() {
		return email;
	}

	public static void setEmail(String email) {
		Employee.email = email;
	}

	public static String getpassword() {
		// TODO Auto-generated method stub
		return password;
	}

	public static void SetPassword() {
		// TODO Auto-generated method stub
		Employee.password=password;
	}

	public static String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
	  
}
