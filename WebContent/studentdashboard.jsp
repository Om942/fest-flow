<%@ page import="java.sql.*" %>

<%
/* SESSION CHECK */
if(session.getAttribute("student_email") == null){
    response.sendRedirect("student_login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Dashboard</title>

<link rel="stylesheet" href="css/style.css">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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

/* SECTION */
.section{
    padding:30px 20px;
}

/* WELCOME */
.welcome{
    text-align:center;
    margin-top:20px;
    margin-bottom:10px;
    font-size:30px;
    font-weight:700;
}

.highlight{
    color:#00f7ff;
}

/* TITLE */
.section h2{
    text-align:center;
    margin-bottom:25px;
}

/* GRID */
.grid{
    display:flex;
    flex-wrap:wrap;
    gap:20px;
    justify-content:center;
}

/* CARD */
.card{
    width:280px;
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:16px;
    padding:18px;
    backdrop-filter:blur(10px);
    transition:0.3s ease;
    box-shadow:0 8px 20px rgba(0,0,0,0.20);
}

.card:hover{
    transform:translateY(-6px) scale(1.02);
    box-shadow:
        0 0 15px rgba(0,247,255,0.35),
        0 0 30px rgba(0,247,255,0.15);
}

/* ICON */
.icon{
    font-size:32px;
    margin-bottom:12px;
    color:#00f7ff;
}

.card h3{
    color:#00f7ff;
    margin-bottom:10px;
}

.card p{
    margin:8px 0;
    line-height:1.5;
}

.card i{
    margin-right:6px;
    color:#00f7ff;
}

/* BUTTON */
button{
    width:100%;
    padding:12px;
    margin-top:12px;
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
    transform:translateY(-2px);
}
</style>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<!-- STUDENT HEADER -->
<jsp:include page="student_header.jsp" />

<!-- WELCOME -->
<div class="welcome">
    Welcome, <span class="highlight"><%= session.getAttribute("student_name") %></span>
</div>

<!-- EVENTS -->
<div class="section">

<h2>Available Events</h2>

<div class="grid">

<%
try{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost/techfest","root","root"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM events ORDER BY event_date DESC");

    while(rs.next()){
%>

<div class="card">

    <div class="icon">
        <i class="fas fa-calendar-alt"></i>
    </div>

    <h3><%= rs.getString("title") %></h3>

    <p><%= rs.getString("description") %></p>

    <p><i class="fas fa-calendar"></i> <%= rs.getString("event_date") %></p>
    <p><i class="fas fa-clock"></i> <%= rs.getString("event_time") %></p>
    <p><i class="fas fa-map-marker-alt"></i> <%= rs.getString("venue") %></p>

    <button onclick="location.href='register_event.jsp?id=<%= rs.getInt("id") %>'">
        <i class="fas fa-user-plus"></i> Register
    </button>

</div>

<%
    }

    con.close();

}catch(Exception e){
    out.println("<p style='text-align:center;color:red;'>" + e + "</p>");
}
%>

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