package com.scnu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.scnu.domain.Employee;
import com.scnu.domain.Msg;
import com.scnu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                               Model model){
        //引入PageHelper分页插件
        //在查询之前只需要调用,传入页码,以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后紧跟着的查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //使用pageInfo包装查询后的结果,交给页面
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return Msg.success().add("pageInfo",page);  //链式编程
    }

    //@GetMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                          Model model){
        //引入PageHelper分页插件
        //在查询之前只需要调用,传入页码,以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后紧跟着的查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        System.out.println(emps);
        //使用pageInfo包装查询后的结果,交给页面
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }

    @PostMapping("/emp")
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors){
                //              错误字段名                   错误信息
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errors",map);
        }

        employeeService.saveEmp(employee);
        return Msg.success();
    }

    @GetMapping("/emp/{id}")
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * Tomcat只会对POST请求,将数据封装到请求体中,并把数据存到一个map里面,
     *      request.getParameter("empName")就会从map里面取值
     *
     *  故用ajax发put请求,后台接不到数据
     *
     * 对于PUT请求的两种解决方式:
     * 一、在参数后面加上一个新参数 _method=put即可
     * 二、在web.xml配置HttpPutFormContentFilter监听器(5.0后已经过时)
     * 三、在web.xml配置FormContentFilter,该过滤器同时支持DELETE请求
     *
     * @param employee
     * @return
     */
    @PutMapping("/emp/{empId}")
    @ResponseBody
    public Msg updateEmp(Employee employee){
        if(employeeService.updateEmp(employee)) {
            return Msg.success();
        }
        else{
            return Msg.fail();
        }
    }

    @DeleteMapping("/emp/{empId}")
    @ResponseBody
    public Msg deleteEmp(@PathVariable("empId") String empId){
        boolean flag;
        if(empId.contains("-")){
            String[] ids = empId.split("-");
            flag = employeeService.deleteEmps(ids);
        }else{
            Integer id = Integer.valueOf(empId);
            flag = employeeService.deleteEmpById(id);
        }
        if(flag){
            return Msg.success();
        }
        else{
            return Msg.fail();
        }
    }

    @PostMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(String empName){
        if(!employeeService.isUniqueName(empName)){
            return Msg.fail().add("msg","用户名已存在");
        }
        return Msg.success();
    }

}
