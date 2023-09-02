package com.helper;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.apache.commons.fileupload.FileItem;

public class UploadPostPic {
	
	
	public String UploadFile(String name,FileItem Item,String destinationpath, ArrayList<String> ext)throws Exception
	{
		String newfilename = "";
		
		if(!Item.isFormField()) {
			
			System.out.println("MyUtilities function called");
			
			// retrieve extension from file name
			String fname = Item.getName();
			String fileextension=fname.substring(fname.lastIndexOf('.'));
			if(ext.contains(fileextension) && (Item.getSize()/(1024*1024))<=10)
			{
				//create new file name
				 newfilename=name+fileextension;
				 
				 System.out.println("newfilename: " + newfilename);
				 
				 Item.write(new File(destinationpath+newfilename));
				 
				
			
		}
		
		
		
	}
		return newfilename;
	}

}
