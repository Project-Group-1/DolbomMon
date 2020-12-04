package com.dolbommon.dbmon.login;

import javax.xml.crypto.Data;

import com.dolbommon.dbmon.member.MemberVO;

public interface LoginDaoImp {
	//로그인
	public LoginVO loginOk(LoginVO vo);
	//자동 로그인
	//public void keepLogin(String userid, String sessionId, Data sessionLimit);
	//
	//public LoginVO checkLoginBefore(String value);
	//아이디 찾기
	public LoginVO findUserid(LoginVO vo);
	//비밀번호 변경
	public int pwdChange(LoginVO vo);
	//로그인 유형 (선생님, 학부모)
	public MemberVO getMemberType(String userid);
}
