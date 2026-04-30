<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("student_email") == null){
    response.sendRedirect("student_login.jsp");
}

String msg = "";
int eventId = Integer.parseInt(request.getParameter("id"));
String eventTitle = "";

/* GET EVENT TITLE */
try{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost/techfest","root","root"
    );

    PreparedStatement ps =
        con.prepareStatement("SELECT title FROM events WHERE id=?");

    ps.setInt(1, eventId);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        eventTitle = rs.getString("title");
    }

    con.close();

}catch(Exception e){
    out.println(e);
}

/* FORM SUBMIT */
if(request.getMethod().equalsIgnoreCase("POST")){
    try{
        String pname   = request.getParameter("pname");
        String email   = request.getParameter("email");
        String contact = request.getParameter("contact");
        String college = request.getParameter("college");
        String branch  = request.getParameter("branch");
        String year    = request.getParameter("year");

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/techfest","root","root"
        );

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO event_registrations(student_email,student_name,event_id,event_title,participant_name,email,contact,college,branch,year) VALUES(?,?,?,?,?,?,?,?,?,?)"
        );

        ps.setString(1,(String)session.getAttribute("student_email"));
        ps.setString(2,(String)session.getAttribute("student_name"));
        ps.setInt(3,eventId);
        ps.setString(4,eventTitle);
        ps.setString(5,pname);
        ps.setString(6,email);
        ps.setString(7,contact);
        ps.setString(8,college);
        ps.setString(9,branch);
        ps.setString(10,year);

        ps.executeUpdate();
        con.close();

        msg = "✅ Successfully Registered for " + eventTitle;

    }catch(Exception e){
        msg = "❌ Error: " + e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Register Event</title>

<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>
body{
    margin:0;
    background:#0f172a;
    color:white;
    font-family:'Inter',sans-serif;
    overflow-x:hidden;
}

.animated-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:-1;
}

.container{
    width:430px;
    max-width:92%;
    margin:35px auto;
    padding:25px;
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:18px;
    backdrop-filter:blur(10px);
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
}

h2{
    text-align:center;
    color:#00f7ff;
}

.msg{
    text-align:center;
    margin-bottom:12px;
    font-weight:600;
}

input,select{
    width:100%;
    padding:12px;
    margin:8px 0;
    border:none;
    border-radius:8px;
    box-sizing:border-box;
}

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
    transition:0.3s;
}

button:hover{
    background:linear-gradient(45deg,#00f7ff,#190D66);
    color:#fff;
    box-shadow:0 0 15px rgba(0,247,255,0.5);
}
</style>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<jsp:include page="student_header.jsp" />

<div class="container">

<h2>Register for: <%= eventTitle %></h2>

<p class="msg"><%= msg %></p>

<form method="post">

<input type="text" name="pname" placeholder="Participant Name" required>
<input type="email" name="email" placeholder="Email" required>
<input type="text" name="contact" placeholder="Contact Number" required>
<input type="text" name="college" placeholder="College Name" required>
<input type="text" name="branch" placeholder="Branch" required>

<select name="year" required>
    <option value="">Select Year</option>
    <option value="First Year">First Year</option>
    <option value="Second Year">Second Year</option>
    <option value="Third Year">Third Year</option>
    <option value="Final Year">Final Year</option>
</select>

<button type="submit">Submit Registration</button>

</form>
</div>

<script>
particlesJS("particles-js",{
  particles:{
    number:{value:80},
    color:{value:"#00f7ff"},
    shape:{type:"circle"},
    opacity:{value:0.5},
    size:{value:3},
    line_linked:{
      enable:true,
      distance:150,
      color:"#00f7ff",
      opacity:0.4,
      width:1
    },
    move:{enable:true,speed:2}
  },
  interactivity:{
    events:{
      onhover:{enable:true,mode:"repulse"}
    }
  }
});
</script>

</body>
</html>