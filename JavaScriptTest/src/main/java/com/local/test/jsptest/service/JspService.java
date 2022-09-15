package com.local.test.jsptest.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.local.test.jsptest.mapper.JspMapper;

@Service("jspService")
public class JspService {
	
	@Resource(name="jspMapper")
	private JspMapper mapper;
	
	public List<HashMap<String, Object>> replaceFnTest1(HashMap<String, Object> hashmapParam) {
		return mapper.replaceFnTest1(hashmapParam);
	}
	public List<HashMap<String, Object>> replaceFnTest2(HashMap<String, Object> hashmapParam) {
		return mapper.replaceFnTest2(hashmapParam);
	}
	
	
	
}