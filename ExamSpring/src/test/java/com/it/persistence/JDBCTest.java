package com.it.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
	
	//@Test
	public void testConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?serverTimezone=Asia/Seoul",
					"root",
					"");
			log.info(conn);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
