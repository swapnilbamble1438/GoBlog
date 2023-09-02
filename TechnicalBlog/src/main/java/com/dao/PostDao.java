package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.entity.Post;
import com.mysql.cj.protocol.Resultset;

public class PostDao {
	
	private Connection con;
	
	public PostDao (Connection con)
	{
		this.con = con;
	}

	// add new post
	public int savePost(Post post)
	{
		int i = 0;
		
		String query = null;
		
		try {
			
			if(post.getImage().equals(""))
			{
				query ="insert into post(title,content,code,cid,id) values(?,?,?,?,?)";
			}
			else
			{
				query ="insert into post(title,content,code,cid,id,image) values(?,?,?,?,?,?)";
			}
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			System.out.println("Image Dao: " +post.getImage());
			
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getCode());
			pstmt.setInt(4, post.getCid());
			pstmt.setInt(5, post.getId());
			
			if(!post.getImage().equals(""))
				pstmt.setString(6, post.getImage());
			
			
			i = pstmt.executeUpdate();
			if(i > 0)
				i = 1;
			
			
		} catch (Exception e) {
			
		}
		
		
		
		
		return i;
	}
	
	
	
	// get all posts
	public List<Post> getAllPosts()
	{
		List<Post> list = new ArrayList<>();
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post order by pid desc");
			
			ResultSet set = p.executeQuery();
			
			while(set.next())
			{
				 int pid = set.getInt("pid");
				 String title = set.getString("title");
				 String content = set.getString("content");
				 String code = set.getString("code");
				 String image = set.getString("image");
				 Timestamp creationdate = set.getTimestamp("creationdate");
				 int cid = set.getInt("cid");
				 int id = set.getInt("id");
				 Post post = new Post(pid,title,content,code,image,creationdate,cid,id);
				 list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// get posts by category
	public List<Post> getPostsByCatId(int catId)
	{
		List<Post> list = new ArrayList<>();
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post where cid=?");
			p.setInt(1, catId);
			
			ResultSet set = p.executeQuery();
			
			while(set.next())
			{
				 int pid = set.getInt("pid");
				 String title = set.getString("title");
				 String content = set.getString("content");
				 String code = set.getString("code");
				 String image = set.getString("image");
				 Timestamp creationdate = set.getTimestamp("creationdate");
				 int cid = set.getInt("cid");
				 int id = set.getInt("id");
				 Post post = new Post(pid,title,content,code,image,creationdate,cid,id);
				 list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	// get post by id
	public Post getPostByPid(int postId)
	{
		Post post = null;
		String q = "select * from post where pid=?";
		
		try {
			
			PreparedStatement p = this.con.prepareStatement(q);
			
			p.setInt(1, postId);
			
			ResultSet set = p.executeQuery();
			
			if(set.next())
			{
				
				 int pid = set.getInt("pid");
				 String title = set.getString("title");
				 String content = set.getString("content");
				 String code = set.getString("code");
				 String image = set.getString("image");
				 Timestamp creationdate = set.getTimestamp("creationdate");
				 int cid = set.getInt("cid");
				 int id = set.getInt("id");
				 post = new Post(pid,title,content,code,image,creationdate,cid,id);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
		
	}
	
	
	
}
