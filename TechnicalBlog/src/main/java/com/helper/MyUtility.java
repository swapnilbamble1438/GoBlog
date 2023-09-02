package com.helper;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.apache.commons.fileupload.FileItem;

public class MyUtility {
	
	public String UploadFile(String name,FileItem Item,String destinationpath, ArrayList<String> ext,String oldfilename)throws Exception
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
			//	newfilename=fname; // set name as it is
				 
			//	 String oldfilepath = destinationpath.substring(0,destinationpath.length()-1) + File.separator + oldfilename;
				 
				 if(!oldfilename.equals("user.png"))
				 {
					 File file = new File(destinationpath + oldfilename);
					 if(file.exists())
					 { 
						 Files.delete(Paths.get(destinationpath + oldfilename));	 					 
					 }
				 }
				 
				 Item.write(new File(destinationpath+newfilename));
				 
				
			
		}
		
		
		
	}
		return newfilename;
	}
}
