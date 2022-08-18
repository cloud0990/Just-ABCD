package com.local.test.common.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("sessionVo")
@Data
public class SessionVo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int    uIdx;
	private String uId;
	private String uPwd;
	private String uNm;
	private String ip;
	private String logDate;
	
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getuNm() {
		return uNm;
	}
	public void setuNm(String uNm) {
		this.uNm = uNm;
	}
}