package com.EMSbackend.in.dao;

import java.util.List;

import com.EMSbackend.in.entities.Employee;

public interface EmplDao {

	boolean addEmployee(Employee employee);

	List<Employee> viewAllEmployees();

	boolean updatEmployee(Employee employee);

	Employee getEmployeeById(int emplId);

	void deleteEmployee(int emplid);
	
	List<Employee> getEmployeesByUser(int uid);
	
	
	
}

