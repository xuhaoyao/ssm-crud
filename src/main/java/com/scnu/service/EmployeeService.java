package com.scnu.service;

import com.scnu.domain.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> getAll();

    boolean saveEmp(Employee employee);

    boolean isUniqueName(String empName);

    Employee getEmpById(Integer id);

    boolean updateEmp(Employee employee);

    boolean deleteEmpById(Integer empId);

    boolean deleteEmps(String[] ids);
}
