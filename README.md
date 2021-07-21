# ssm-crud

- 使用Rest风格的URI，可以实现通过不同的请求方式实现不同的效果。

  - http://localhost:8080/crud/emp 新增 @PostMapping("/emp")
  - http://localhost:8080/crud/emp/1 查询 @GetMapping("/emp/{id}")
  - http://localhost:8080/crud/emp 更新 @PutMapping("/emp")
  - http://localhost:8080/crud/emp/1 删除 @DeleteMapping("/emp/{empId}")

- 对于ajax请求,如果请求方式是PUT或者DELETE，需要进行一些处理，否则后台接受不到对应的参数，全是null

  - ```java
    Tomcat源码中Connector.java中有这行代码
    /**
    * Comma-separated list of HTTP methods that will be parsed according
    * to POST-style rules for application/x-www-form-urlencoded request bodies.
    */
        protected String parseBodyMethods = "POST";
    /*
    Tomcat只会对POST请求,将数据封装到请求体中,并把数据存到一个map里面,
    	request.getParameter("empName")就会从map里面取值
    	故用ajax发put,delete等请求,后台接不到数据
    有三种解决方式:
          一、在参数后面加上一个新参数 _method=put即可
          二、在web.xml配置HttpPutFormContentFilter监听器(5.0后已经过时)
          三、在web.xml配置FormContentFilter,该过滤器同时支持DELETE请求
    */
    ```

  - ```xml
        <!--    使用Rest风格的URI,将页面普通的post请求转为指定的delete或put请求-->
        <filter>
            <filter-name>hiddenHttpMethodFilter</filter-name>
            <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
        </filter>
        <filter-mapping>
            <filter-name>hiddenHttpMethodFilter</filter-name>
            <url-pattern>/*</url-pattern>
        </filter-mapping>
        <filter>
            <filter-name>formContentFilter</filter-name>
            <filter-class>org.springframework.web.filter.FormContentFilter</filter-class>
        </filter>
        <filter-mapping>
            <filter-name>formContentFilter</filter-name>
            <url-pattern>/*</url-pattern>
        </filter-mapping>
    ```

  - 



- 在SpringMVC中可以使用 @PathVariable 注解，让方法参数的值对应绑定到一个URI变量上。

  - ```java
    /**
     * 单一删除:/emp/1
     * 批量删除:/emp/1-2-3-4
     * @param empId
     * @return
     */
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
    ```

