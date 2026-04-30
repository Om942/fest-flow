<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>

/* BODY */
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
    width:95%;
    max-width:1300px;
    margin:auto;
    padding:40px 20px;
}

.page-title{
    text-align:center;
    font-size:2rem;
    margin-bottom:25px;
}

.highlight{
    color:#00f7ff;
}

/* TABLE BOX */
.table-box{
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:18px;
    backdrop-filter:blur(10px);
    padding:20px;
    overflow-x:auto;
    box-shadow:0 8px 30px rgba(0,0,0,0.25);
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
    min-width:800px;
}

th{
    background:rgba(0,247,255,0.15);
    color:#00f7ff;
    padding:15px;
    text-align:left;
    font-size:15px;
}

td{
    padding:14px;
    border-bottom:1px solid rgba(255,255,255,0.08);
    color:#e5e7eb;
}

tr:hover{
    background:rgba(255,255,255,0.04);
}

/* BUTTON */
.btn-view{
    display:inline-block;
    padding:10px 16px;
    background:#00f7ff;
    color:#000;
    text-decoration:none;
    border-radius:8px;
    font-weight:600;
    transition:0.3s ease;
}

.btn-view:hover{
    background:linear-gradient(45deg,#00f7ff,#190D66);
    color:#fff;
    box-shadow:
        0 0 10px rgba(0,247,255,0.6),
        0 0 20px rgba(0,247,255,0.5),
        0 0 40px rgba(0,247,255,0.4);
}

/* CARD HEADER */
.top-card{
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.08);
    padding:20px;
    border-radius:16px;
    margin-bottom:25px;
    text-align:center;
}

</style>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<!-- ADMIN HEADER -->
<jsp:include page="admin_header.jsp" />

<div class="container">

    <div class="top-card">
        <h1 class="page-title">Recent <span class="highlight">Events</span></h1>
        <p>Select an event to view registered students.</p>
    </div>

    <div class="table-box">

        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Date</th>
                <th>Venue</th>
                <th>Action</th>
            </tr>

<%
try{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost/techfest","root","root"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM events");

    while(rs.next()){
%>

            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("event_date") %></td>
                <td><%= rs.getString("venue") %></td>

                <td>
                    <a class="btn-view"
                       href="viewregistration2.jsp?eid=<%= rs.getInt("id") %>">
                       View Registrations
                    </a>
                </td>
            </tr>

<%
    }

    con.close();

}catch(Exception e){
    out.println("<tr><td colspan='5'>" + e + "</td></tr>");
}
%>

        </table>

    </div>

</div>

<!-- PARTICLES -->
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