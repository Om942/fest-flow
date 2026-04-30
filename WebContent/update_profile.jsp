<%@ page import="java.sql.*" %>

<%
String email = (String) session.getAttribute("student_email");

if(email == null){
    response.sendRedirect("login.jsp");
    return;
}

String name="", contact="", college="", branch="", year="";
String message = "";

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

/* UPDATE LOGIC */
if(request.getParameter("updateBtn") != null){
    try{
        name = request.getParameter("name");
        contact = request.getParameter("contact");
        college = request.getParameter("college");
        branch = request.getParameter("branch");
        year = request.getParameter("year");

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost/techfest","root","root"
        );

        String updateQuery =
        "UPDATE users SET name=?, contact=?, college=?, branch=?, year=? WHERE email=?";

        ps = con.prepareStatement(updateQuery);

        ps.setString(1, name);
        ps.setString(2, contact);
        ps.setString(3, college);
        ps.setString(4, branch);
        ps.setString(5, year);
        ps.setString(6, email);

        int rows = ps.executeUpdate();

        if(rows > 0){
            message = "✅ Profile Updated Successfully";
        }else{
            message = "❌ Update Failed";
        }

        ps.close();
        con.close();

    }catch(Exception e){
        message = "❌ Error: " + e.getMessage();
    }
}

/* FETCH USER DATA */
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/techfest","root","root"
    );

    String fetchQuery = "SELECT * FROM users WHERE email=?";
    ps = con.prepareStatement(fetchQuery);
    ps.setString(1, email);

    rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        contact = rs.getString("contact");
        college = rs.getString("college");
        branch = rs.getString("branch");
        year = rs.getString("year");
    }

}catch(Exception e){
    message = "❌ Error loading profile";
}
finally{
    try{ if(rs!=null) rs.close(); }catch(Exception e){}
    try{ if(ps!=null) ps.close(); }catch(Exception e){}
    try{ if(con!=null) con.close(); }catch(Exception e){}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Update Profile</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>
body{
    margin:0;
    padding:0;
    background:#0f172a;
    color:white;
    font-family:'Inter',sans-serif;
    overflow-x:hidden;
}

/* BACKGROUND */
.animated-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:-1;
}

/* BOX */
.container{
    width:420px;
    max-width:92%;
    margin:45px auto;
    padding:25px;
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:18px;
    backdrop-filter:blur(10px);
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
}

.container:hover{
    box-shadow:
        0 0 12px rgba(0,247,255,0.4),
        0 0 25px rgba(0,247,255,0.2);
}

/* TITLE */
h2{
    text-align:center;
    margin-bottom:15px;
    color:#00f7ff;
}

/* MESSAGE */
.msg{
    text-align:center;
    margin-bottom:12px;
    font-weight:600;
}

.success{ color:#7CFC98; }
.error{ color:#ff7b7b; }

/* INPUT */
input, select{
    width:100%;
    padding:12px;
    margin:8px 0;
    border:none;
    border-radius:8px;
    outline:none;
    box-sizing:border-box;
}

/* BUTTON */
button{
    width:100%;
    padding:12px;
    margin-top:10px;
    border:none;
    border-radius:8px;
    background:#00f7ff;
    color:#000;
    font-weight:700;
    cursor:pointer;
    transition:0.3s ease;
}

button:hover{
    background:linear-gradient(45deg,#00f7ff,#190D66);
    color:#fff;
    box-shadow:
        0 0 10px rgba(0,247,255,0.6),
        0 0 20px rgba(0,247,255,0.5),
        0 0 40px rgba(0,247,255,0.4);
}

/* LINK */
.back-btn{
    text-align:center;
    margin-top:14px;
}

.back-btn a{
    color:#00f7ff;
    text-decoration:none;
}
</style>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<jsp:include page="student_header.jsp" />

<div class="container">

<h2>👤 Update Profile</h2>

<p class="msg <%= message.contains("✅") ? "success" : "error" %>">
<%= message %>
</p>

<form method="post">

<input type="text" name="name" value="<%= name %>" placeholder="Full Name" required>

<input type="email" name="email" value="<%= email %>" readonly>

<input type="text" name="contact"
       value="<%= contact %>"
       placeholder="Contact Number"
       pattern="[0-9]{10}"
       title="Enter 10 digit number"
       required>

<input type="text" name="college" value="<%= college %>" placeholder="College Name" required>

<input type="text" name="branch" value="<%= branch %>" placeholder="Branch" required>

<select name="year" required>
    <option value="">Select Year</option>
    <option value="First Year" <%= year.equals("First Year")?"selected":"" %>>First Year</option>
    <option value="Second Year" <%= year.equals("Second Year")?"selected":"" %>>Second Year</option>
    <option value="Third Year" <%= year.equals("Third Year")?"selected":"" %>>Third Year</option>
    <option value="Final Year" <%= year.equals("Final Year")?"selected":"" %>>Final Year</option>
</select>

<button type="submit" name="updateBtn">Update Profile</button>

</form>

<div class="back-btn">
<a href="studentdashboard.jsp">⬅ Back to Dashboard</a>
</div>

</div>

<script>
particlesJS("particles-js", {
  particles: {
    number: { value: 80 },
    color: { value: "#00f7ff" },
    shape: { type: "circle" },
    opacity: { value: 0.5 },
    size: { value: 3 },
    line_linked: {
      enable: true,
      distance: 150,
      color: "#00f7ff",
      opacity: 0.4,
      width: 1
    },
    move: { enable: true, speed: 2 }
  },
  interactivity: {
    events: {
      onhover: { enable: true, mode: "repulse" }
    }
  }
});
</script>

</body>
</html>