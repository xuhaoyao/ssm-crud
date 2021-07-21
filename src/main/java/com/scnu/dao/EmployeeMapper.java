package com.scnu.dao;

import com.scnu.domain.Employee;
import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    Employee selectByPrimaryKey(Integer empId);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);

    List<Employee> selectAllWithCondition(Employee employee);

    int isUniqueName(String empName);

    int updateEmp(Employee employee);

    int deleteEmps(String[] ids);
}