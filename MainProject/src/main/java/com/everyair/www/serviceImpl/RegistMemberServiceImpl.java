package com.everyair.www.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everyair.www.dao.RegistMemberDAO;
import com.everyair.www.dto.ConfirmNumDTO;
import com.everyair.www.dto.MemberDTO;
import com.everyair.www.service.RegistMemberService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class RegistMemberServiceImpl implements RegistMemberService {
	@Autowired
	private RegistMemberDAO dao;
	
	@Override
	public boolean checkIDDuplicate(MemberDTO dto) {
		String registedID = dao.checkID(dto);
		
		if(registedID == null) return true;
		else return false;
	}

	@Override
	public boolean checkNicknameDuplicate(MemberDTO dto) {
		String registedNickname = dao.checkNickname(dto);
		
		if(registedNickname == null) return true;
		else return false;
	}

	@Override
	public boolean checkPhoneNumberDuplicate(MemberDTO dto) {
		String registedPhoneNumber = dao.checkPhoneNumber(dto);
		
		if(registedPhoneNumber == null) return true;
		else return false;
	}

	@Override
	public void sendConfirmNum(MemberDTO dto) {
		String confirmnumber = getConfirmNumber();
		String phoneNumber = dto.getPhonenumber();
		boolean insertConfirmNumResult = false;
		ConfirmNumDTO confirmNumDTO = new ConfirmNumDTO();
		confirmNumDTO.setConfirmnumber(confirmnumber);
		insertConfirmNumResult = dao.insertConfirmNum(confirmNumDTO);
		
		if(insertConfirmNumResult) {
			String api_key = "NCS5JFABWEA12IBM";
		    String api_secret = "DDAS2RMUFBWPTGTIJJN2KMVAPYYOBTKW";
		    Message coolsms = new Message(api_key, api_secret);

		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phoneNumber);
		    params.put("from", "01028159937");
		    params.put("type", "SMS");
		    params.put("text", "EveryAir 가입 인증 번호\n인증번호는 [" + confirmnumber + "] 입니다.");
		    params.put("app_version", "test app 1.2");

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		}
	}

	@Override
	public Map<String, String> checkConfirmNumber(MemberDTO memberDTO, ConfirmNumDTO confirmNumDTO) {
		boolean checkConfirmResult = false;
		boolean checkPhoneNumberResult = false;
		String registedPhoneNumber = "";
		Map<String, String> map = new HashMap<String, String>();
		
		checkConfirmResult = dao.checkConfirmNum(confirmNumDTO);
		registedPhoneNumber = dao.checkPhoneNumber(memberDTO);
		
		if(registedPhoneNumber == null) checkPhoneNumberResult = true;
		
		if(checkConfirmResult && checkPhoneNumberResult)
			map.put("success", "인증 성공");
		else if(checkConfirmResult == false) {
			map.put("fail", "번호 인증 오류");
		} else if(checkPhoneNumberResult == false) {
			map.put("fail", "기등록 번호");
		}
		
		return map;
	}

	@Override
	public String getConfirmNumber() {
		int randomNum = (int)(Math.random() * 8999)+1000;
		return String.valueOf(randomNum);
	}
	
	@Override
	public boolean registMember(MemberDTO dto) {
		return dao.resistMember(dto);
	}
}
