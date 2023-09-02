package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikesDao {
	
	Connection con;
	
	public LikesDao(Connection con)
	{
		this.con = con;
	}
	
	
	// add like
	public boolean inserLike(int pid, int uid)
	{
		boolean f = false;
		
		try {
			
			String q = "insert into likes(pid,uid) values(?,?)";
			
			PreparedStatement p = this.con.prepareStatement(q);
			
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f= true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	// count like
	public int countLike(int pid)
	{
		int count = 0;
		
		try {
			
			String q = "select count(*) from likes where pid=?";
			
			PreparedStatement p = this.con.prepareStatement(q);
			
			p.setInt(1, pid);
			
		ResultSet set =	p.executeQuery();
		if(set.next())
		{
			count= set.getInt("count(*)");
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	// check like
	public int checkLike(int pid, int uid)
	{
		int f = 0;
		
		try {
			
			String q = "select * from likes where pid=? and uid=?";
			
			PreparedStatement p = this.con.prepareStatement(q);
			
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			ResultSet set =p.executeQuery();
			
			if(set.next())
			{
				f = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	// delete like
	// add like
		public boolean deleteLike(int pid, int uid)
		{
			boolean f = false;
			
			try {
				
				String q = "delete from likes where pid=? and uid=?";
				
				PreparedStatement p = this.con.prepareStatement(q);
				
				p.setInt(1, pid);
				p.setInt(2, uid);
				
				p.executeUpdate();
				f= true;
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return f;
		}
	
	

}
