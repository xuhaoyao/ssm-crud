package com.scnu.service.impl;

import com.scnu.dao.DepartmentMapper;
import com.scnu.domain.Department;
import com.scnu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepartments() {
        return departmentMapper.selectAll();
    }
}
