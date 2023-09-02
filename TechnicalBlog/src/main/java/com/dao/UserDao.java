package com.dao;
import java.sql.*;
import java.util.Map;

import com.entity.User;

public class UserDao {
	
	private Connection con;
	
	public UserDao (Connection con)
	{
		this.con = con;
	}
	
	// insert user to database
	
	public int saveUser(User user)
	{
		int i = 0;
		
		String query = null;
		
		try {
			
			// user --> database
			
			if(user.getAbout().equals(""))
			{	
				query = "insert into user(name,email,password,gender) values(?,?,?,?)";
			}	
			else {
				query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

			}
			
			 PreparedStatement pstmt = this.con.prepareStatement(query);
			 
			 pstmt.setString(1, user.getName());
			 pstmt.setString(2, user.getEmail());
			 pstmt.setString(3, user.getPassword());
			 pstmt.setString(4, user.getGender());
			 if(!user.getAbout().equals(""))
			 {
				 pstmt.setString(5, user.getAbout());
			 }
			 
			i = pstmt.executeUpdate();
				if(i > 0)
					i = 1;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	//get user by email and password
	public User getUserByEmailAndPassword(String email,String password)
	{
		
		User user =null;
		
		try {
			
			String query="select * from user where email=? and password=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next())
			{
				
				user = new User();
				String name = set.getString("name");
				user.setName(name);
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setRegdate(set.getTimestamp("regdate"));
				user.setProfile(set.getString("profile"));
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	// update user
	public int updateUser(User user,int id)
	{
		int i = 0;
		String query = null;
		try {
			
			if(user.getProfile().equals(""))
			{
				query ="update user set name = ?, email=?,password=?,gender=?,about=? where id='"+id+"'";
			}
			else
			{
				query ="update user set name = ?, email=?,password=?,gender=?,about=?,profile=? where id='"+id+"'";
			}
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			System.out.println("Profile Dao: " +user.getProfile());
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			if(!user.getProfile().equals(""))
				pstmt.setString(6, user.getProfile());
			
			
			i = pstmt.executeUpdate();
			if(i > 0)
				i = 1;
			
			
		} catch (Exception e) {
			
		}
		return i;
	}
	
	
	// get user by id
	public User getUserById(int userId)
	{
		User user = null;
		
		String q= "select * from user where id=?";
		
		try {
			
			PreparedStatement ps = this.con.prepareStatement(q);

			ps.setInt(1,userId);
			ResultSet set = ps.executeQuery();
			if(set.next())
			{
				user = new User();
				String name = set.getString("name");
				user.setName(name);
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setRegdate(set.getTimestamp("regdate"));
				user.setProfile(set.getString("profile"));
			
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return user;
	}
	
	
	

}
