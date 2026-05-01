<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>

<%
String message = "";

// 🔹 GET ID (SAFE)
String idStr = request.getParameter("id");
int id = 0;

if(idStr != null){
    try{
        id = Integer.parseInt(idStr);
    }catch(Exception e){
        id = 0;
    }
}

// 🔹 HANDLE FILE UPLOAD ONLY ON POST
if(request.getMethod().equalsIgnoreCase("POST")){
    try{

        // 🔹 GET ID AGAIN FROM POST
        String postId = request.getParameter("id");
        if(postId != null){
            id = Integer.parseInt(postId);
        }

        // 🔹 GET FILE PART SAFELY
        Part filePart = request.getPart("flyer");

        if(filePart != null && filePart.getSize() > 0){

            String fileName = null;
            String contentDisp = filePart.getHeader("content-disposition");

            for(String s : contentDisp.split(";")){
                if(s.trim().startsWith("filename")){
                    fileName = s.substring(s.indexOf("=") + 2, s.length()-1);
                }
            }

            // 🔹 HANDLE EMPTY FILE NAME
            if(fileName != null && !fileName.equals("")){

                // UNIQUE FILE NAME
                fileName = System.currentTimeMillis() + "_" + fileName;

                // CREATE UPLOAD FOLDER
                String uploadPath = application.getRealPath("") + File.separator + "uploads";
                File dir = new File(uploadPath);
                if(!dir.exists()) dir.mkdir();

                // SAVE FILE
                filePart.write(uploadPath + File.separator + fileName);

                // 🔹 DATABASE UPDATE (UNCHANGED)
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","rCygbYnzyHvaFlmUiJBhXisaDtKyIihA"
                );

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE events SET flyer=? WHERE id=?"
                );

                ps.setString(1, fileName);
                ps.setInt(2, id);

                ps.executeUpdate();
                con.close();

                message = "✅ Flyer Uploaded Successfully";

            } else {
                message = "❌ Invalid file name";
            }

        } else {
            message = "❌ Please select a file";
        }

    }catch(Exception e){
        message = "❌ Error: " + e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Upload Flyer</title>

<style>
body { 
    background:#0f172a; 
    color:white; 
    text-align:center; 
    font-family:Arial; 
}
.container { 
    margin-top:100px; 
}
button { 
    padding:10px; 
    background:#00f7ff; 
    border:none; 
    cursor:pointer; 
}
</style>
</head>

<body>

<jsp:include page="admin_header.jsp" />

<div class="container">

<h2>Upload Event Flyer</h2>

<!-- 🔹 FORM (FIXED WITH ID) -->
<form method="post" enctype="multipart/form-data">
    
    <input type="hidden" name="id" value="<%= id %>">
    
    <input type="file" name="flyer" required><br><br>
    
    <button type="submit">Upload</button>

</form>

<br>
<p style="color:lightgreen;"><%= message %></p>

</div>

</body>
</html>

