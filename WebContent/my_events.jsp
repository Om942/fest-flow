<%@ page import="java.sql.*" %>

<%
String email = (String) session.getAttribute("student_email");

if(email == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Events</title>

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

/* PAGE */
.container{
    width:96%;
    max-width:1450px;
    margin:auto;
    padding:25px 15px;
}

h2{
    text-align:center;
    margin:15px 0 25px;
}

/* TABLE BOX */
.table-box{
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:18px;
    backdrop-filter:blur(10px);
    padding:20px;
    overflow-x:auto;
}

/* TABLE */
table{
    width:100%;
    min-width:1100px;
    border-collapse:collapse;
}

th{
    background:rgba(0,247,255,0.15);
    color:#00f7ff;
    padding:14px;
    text-align:left;
    font-size:14px;
}

td{
    padding:14px;
    border-bottom:1px solid rgba(255,255,255,0.08);
    font-size:14px;
}

tr:hover{
    background:rgba(255,255,255,0.04);
}

/* BUTTON */
.btn-cert{
    display:inline-block;
    padding:10px 14px;
    border:none;
    border-radius:8px;
    background:#00f7ff;
    color:#000;
    font-weight:700;
    text-decoration:none;
    cursor:pointer;
    transition:0.3s ease;
}

.btn-cert:hover{
    background:linear-gradient(45deg,#00f7ff,#190D66);
    color:#fff;
    box-shadow:
        0 0 10px rgba(0,247,255,0.6),
        0 0 20px rgba(0,247,255,0.5),
        0 0 40px rgba(0,247,255,0.4);
    transform:translateY(-2px);
}

.empty{
    text-align:center;
    color:#ddd;
}
</style>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<jsp:include page="student_header.jsp" />

<div class="container">

<h2>?? My Registered Events</h2>

<div class="table-box">

<table>
<tr>
<th>Event Name</th>
<th>Participant Name</th>
<th>Contact</th>
<th>College</th>
<th>Branch</th>
<th>Year</th>
<th>Applied Date</th>
<th>Certificate</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","rCygbYnzyHvaFlmUiJBhXisaDtKyIihA"
    );

    String query = "SELECT * FROM event_registrations WHERE student_email=? ORDER BY applied_date DESC";
    ps = con.prepareStatement(query);
    ps.setString(1, email);

    rs = ps.executeQuery();

    boolean hasData = false;

    while(rs.next()){
        hasData = true;
%>

<tr>
<td><%= rs.getString("event_title") %></td>
<td><%= rs.getString("participant_name") %></td>
<td><%= rs.getString("contact") %></td>
<td><%= rs.getString("college") %></td>
<td><%= rs.getString("branch") %></td>
<td><%= rs.getString("year") %></td>
<td><%= rs.getTimestamp("applied_date") %></td>

<td>
<a class="btn-cert"
   href="generatecertificate.jsp?id=<%= rs.getInt("id") %>">
   View Certificate
</a>
</td>
</tr>

<%
    }

    if(!hasData){
%>

<tr>
<td colspan="8" class="empty">No events registered yet</td>
</tr>

<%
    }

}catch(Exception e){
    out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
}
finally{
    try{ if(rs!=null) rs.close(); }catch(Exception e){}
    try{ if(ps!=null) ps.close(); }catch(Exception e){}
    try{ if(con!=null) con.close(); }catch(Exception e){}
}
%>

</table>

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
    move: {
      enable: true,
      speed: 2
    }
  },
  interactivity: {
    events: {
      onhover: {
        enable: true,
        mode: "repulse"
      }
    }
  }
});
</script>

</body>
</html>
