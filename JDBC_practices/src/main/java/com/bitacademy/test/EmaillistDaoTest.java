package com.bitacademy.test;

import java.util.List;

import com.bitacademy.emaillist.vo.EmaillistVo;

import emaillist01.EmaillistDao;

public class EmaillistDaoTest {
	private static void main(String[] args) {
		testFindAll();
	}

	private static void testFindAll() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for(EmaillistVo vo : list) {
			System.out.println(vo);
		}
	}
	

}
