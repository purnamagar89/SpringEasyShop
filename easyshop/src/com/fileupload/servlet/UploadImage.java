package com.fileupload.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.anrup.web.service.ItemService;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177216)
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ItemService service = new ItemService();
	ConnectionProvider conProvider = new ConnectionProvider();
	Connection con = conProvider.getConnection();

	public int getItemId(String itemCategory) {

		List<Integer> rsValues = new ArrayList<Integer>();
		List<Integer> availableIds = new ArrayList<Integer>();
		try {

			if (itemCategory.equalsIgnoreCase("electronics")) {
				PreparedStatement ps = con.prepareStatement("select item_id from electronics_items");
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					rsValues.add(Integer.parseInt(rs.getString("item_id")));
				}

				for (Integer i = 1; i <= 100; i++) {
					if (!rsValues.contains(i)) {
						availableIds.add(i);
					}
				}
			}if(itemCategory.equalsIgnoreCase("clothes")){
				
					PreparedStatement ps = con.prepareStatement("select item_id from cloth_items");
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						rsValues.add(Integer.parseInt(rs.getString("item_id")));
					}

					for (Integer i = 1001; i <= 2000; i++) {
						if (!rsValues.contains(i)) {
							availableIds.add(i);
						}
					}
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		int item_id = availableIds.get(0);
		return item_id;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int result = 0;
		Part part = req.getPart("item_image");
		String itemCategory = req.getParameter("item_category");
		int itemId = getItemId(itemCategory);

		if (part != null) {
			try {
				PreparedStatement ps = null;

				if (itemId > 0 && itemId <= 1000) {

					ps = con.prepareStatement(
							"insert into electronics_items(item_id,item_name,item_price,item_image) values(?,?,?,?)");

				}if (itemId > 1000 && itemId <= 2000) {

					ps = con.prepareStatement(
							"insert into cloth_items(item_id,item_name,item_price,item_image) values(?,?,?,?)");

				}
				InputStream is = part.getInputStream();
				ps.setInt(1,itemId);
				ps.setString(2, req.getParameter("item_name"));
				ps.setInt(3, Integer.parseInt(req.getParameter("item_price")));
				ps.setBlob(4, is);
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