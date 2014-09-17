package com.shareku.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shareku.service.MobileService;
import com.shareku.util.Tools;

@Controller

public class MobileController {
	@Autowired
	private MobileService mobileService;
	@RequestMapping(value="/mobile")
	public void receive(HttpServletRequest request,ServletOutputStream out) throws IOException{
		
		InputStream is;
		byte[] returnByte = {};
		try {
		
			is = request.getInputStream();
			int l = request.getContentLength();
			byte[] b = Tools.convertStreamToString(is,l);
			ByteArrayOutputStream imgStream = new ByteArrayOutputStream();
			imgStream.write(b, 0, b.length);
			byte[] imgByte = imgStream.toByteArray();
			imgStream.flush();
			imgStream.close();
			System.out.println("==========="+imgByte.toString());
			mobileService.save(imgByte.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			returnByte = "服务器端错误".getBytes("utf8");
			out.write(returnByte);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			returnByte = "服务器端错误".getBytes("utf8");
			out.write(returnByte);
			out.flush();
			out.close();
			
		}
	}
	
}
