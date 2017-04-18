<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="conProvider"
		class="com.fileupload.servlet.ConnectionProvider"></jsp:useBean>


	<%
		Connection con = null;
		int item_id = Integer.parseInt(request.getParameter("item_id"));
		byte byteArray[] = null;
		con = conProvider.getConnection();
		PreparedStatement ps = null;
		try {
			if (item_id > 0 && item_id <= 1000) {

				ps = con.prepareStatement("select item_image from electronics_items where item_id=?");

			}
			if (item_id > 1000 && item_id <= 2000) {
				ps = con.prepareStatement("select item_image from cloth_items where item_id=?");

			}
			ps.setInt(1, item_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Blob blob = rs.getBlob("item_image");
				byteArray = blob.getBytes(1, (int) blob.length());
			}
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			os.write(byteArray);
			os.flush();
			os.close();
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
	%>

</body>
</html>