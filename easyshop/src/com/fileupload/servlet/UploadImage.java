package com.fileupload.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177216)
public class UploadImage extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String connectionURL = "jdbc:mysql://localhost:3306/easyshop";
		String user = "root";
		String pass = "root";

		int result = 0;
		Connection con = null;
		Part part = req.getPart("image");

		if (part != null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(connectionURL, user, pass);

				PreparedStatement ps = con
						.prepareStatement("insert into productdetails(item_name,item_price,item_image) values(?,?,?)");
				InputStream is = part.getInputStream();
				ps.setString(1, req.getParameter("item_name"));
				ps.setInt(2, Integer.parseInt(req.getParameter("item_price")));
				ps.setBlob(3, is);
				result = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		if (result > 0) {
			System.out.println("item inserted");
		} else {

			System.out.print("error occured");
		}
	}
}