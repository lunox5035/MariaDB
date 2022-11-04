package com.bitacademy.emaillist.app;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;

import com.bitacademy.emaillist.dao.EmaillistDao;
import com.bitacademy.emaillist.vo.EmaillistVo;

import test.DeptVo;

public class emaillistApp {

	private static Scanner scanner = null;
	
	private static String Sql;
	ResultSet rs = null;
	
//============================================================================
	public static void main(String[] args) {
		scanner=new Scanner(System.in);
		
		while(true) {
			System.out.println("(l)ist,(a)dd,(d)ele(q)uit >");
			String command =scanner.nextLine();
			
			
			if("l".equals(command)) {
				doList();
			
			}else if("a".equals(command)) {
				doAdd();

			}else if("d".equals(command)) {
				doDelete();
			
			} else if("q".equals(command)) {
				break;
			}
		}
		
		scanner.close();
	}
//============================================================================

	private static void doDelete() {
				
		System.out.println("이름:");
		String lastName = scanner.nextLine();
		
		//딜리트
		String sql = 
				"delete" +
				"from emaillist" +
				" where lastName = " + lastName;
		
		doList();
	}

	private static void doAdd() {
		Statement stmt = null;
		System.out.println("성:");
		String firstName = scanner.nextLine();
		
		System.out.println("이름:");
		String lastName = scanner.nextLine();
	
		System.out.println("이메일:");
		String email = scanner.nextLine();
	
		System.out.println(firstName + ":" + lastName + ":" + email);
		
		//인서트
					
		long no=0;
		List<EmaillistVo> list=new EmaillistDao().findAll();
		for (EmaillistVo vo:list) {
			if (vo.getNo()>=no) {
				no=vo.getNo();
			}
		}
		String sql = "insert "+
				"into emaillist "+
				"values ('"+(no+1)+"','"+firstName+"','"+lastName+"','"+email+"')";
		stmt = conn.createStatement();		
		int count = stmt.executeUpdate(sql);
		
		
		doList();
		
	}
	
	private static void doList() {
		List<EmaillistVo> list=new EmaillistDao().findAll();
		for (EmaillistVo vo:list) {
			System.out.println("이름:" + vo.getFitstName() + " " + vo.getLastName() + ", 이메일:" + vo.getEmail());
		}
	}
	
}
