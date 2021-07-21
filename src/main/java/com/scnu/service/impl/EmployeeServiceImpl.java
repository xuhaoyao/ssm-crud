package com.scnu.service.impl;

import com.scnu.dao.EmployeeMapper;
import com.scnu.domain.Employee;
import com.scnu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectAllWithCondition(new Employee());
    }

    @Override
    public boolean saveEmp(Employee employee) {
        return (1 == employeeMapper.insert(employee));
    }

    @Override
    public boolean isUniqueName(String empName) {
        return (0 == employeeMapper.isUniqueName(empName));
    }

    @Override
    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean updateEmp(Employee employee) {
        return 1 == employeeMapper.updateEmp(employee);
    }

    @Override
    public boolean deleteEmpById(Integer empId) {
        return 1 == employeeMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public boolean deleteEmps(String[] ids) {
        return ids.length == employeeMapper.deleteEmps(ids);
    }


}
