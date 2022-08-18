package com.local.test.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.local.test.domain.CompanyVo;

@Repository("companyMapper")
//@Repository("companyDao")
public interface CompanyMapper {

	public List<CompanyVo> getCompanyList();
	
}