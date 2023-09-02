package com.dao;

import java.sql.*;
import java.util.ArrayList;

import com.entity.Category;

public class CategoryDao {
	
	Connection con;
	
	public CategoryDao(Connection con)
	{
		this.con = con;
	}
	
	// get all Categories
	public ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> list = new ArrayList<Category>();
		
		try {
			String q = "select * from category";
			Statement stmt = this.con.createStatement();
			ResultSet set = stmt.executeQuery(q);
			
			while(set.next())
			{
				int cid = set.getInt("cid");
				String name=set.getString("name");
				String description = set.getString("description");
				Category category = new Category(cid,name,description);
				list.add(category);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
			
	}
	

}
