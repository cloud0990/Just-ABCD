package com.local.test.jsptest.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("jspMapper")
public interface JspMapper {
	
	List<HashMap<String, Object>> replaceFnTest1(HashMap<String, Object> hashmapParam);
	List<HashMap<String, Object>> replaceFnTest2(HashMap<String, Object> hashmapParam);
}