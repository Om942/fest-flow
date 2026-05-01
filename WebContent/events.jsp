<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Events - TechFest 2026</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<!-- PARTICLES -->
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>

/* GLOBAL BACKGROUND */
body{
    margin:0;
    padding:0;
    background:#0f172a;
    color:white;
    overflow-x:hidden;
    font-family:'Inter',sans-serif;
}

/* PARTICLE BACKGROUND */
.animated-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:-1;
}

/* EVENT CARD */
.event-card{
    display:flex;
    flex-direction:column;
    justify-content:space-between;
    height:100%;
}

/* ICON */
.event-icon{
    font-size:3rem;
    margin-bottom:1.5rem;
    color:#00f7ff;
    background:rgba(0,247,255,0.1);
    width:80px;
    height:80px;
    display:flex;
    align-items:center;
    justify-content:center;
    border-radius:50%;
}

/* DETAILS */
.event-details{
    margin:1.5rem 0;
    display:flex;
    flex-wrap:wrap;
    gap:1rem;
    font-size:0.875rem;
}

.event-details span{
    background:rgba(255,255,255,0.05);
    padding:0.4rem 0.8rem;
    border-radius:50px;
    border:1px solid rgba(255,255,255,0.1);
}

.event-details i{
    margin-right:0.5rem;
    color:#00f7ff;
}

/* GLASS CARD EFFECT */
.glass-panel{
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:15px;
    backdrop-filter:blur(10px);
    padding:25px;
    transition:0.3s ease;
}

/* HOVER EFFECT */
.hover-card:hover{
    border:1px solid #00f7ff;
    box-shadow:
        0 0 10px rgba(0,247,255,0.5),
        0 0 25px rgba(0,247,255,0.4),
        0 0 50px rgba(0,247,255,0.3);
    transform:translateY(-5px);
}

/* BUTTON */
.btn-primary{
    display:inline-block;
    text-align:center;
    text-decoration:none;
    padding:12px;
    border-radius:8px;
    background:#00f7ff;
    color:black;
    font-weight:600;
    transition:0.3s ease;
}

.btn-primary:hover{
    background:linear-gradient(45deg,#00f7ff,#190D66);
    color:white;
    box-shadow:
        0 0 10px rgba(0,247,255,0.6),
        0 0 20px rgba(0,247,255,0.5),
        0 0 40px rgba(0,247,255,0.4);
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
    gap:25px;
}

/* PAGE HEADER */
.page-header{
    padding:50px 0 30px;
    text-align:center;
}

.text-gradient{
    background:linear-gradient(45deg,#00f7ff,#ffffff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* FOOTER */
.glass-footer{
    margin-top:50px;
    padding:20px;
    text-align:center;
    background:rgba(255,255,255,0.05);
    border-top:1px solid rgba(255,255,255,0.1);
}

</style>
</head>

<body>

<!-- PARTICLE BACKGROUND -->
<div id="particles-js" class="animated-bg"></div>

<!-- HEADER -->
<jsp:include page="header.jsp" />

<!-- PAGE HEADER -->


<!-- EVENTS -->
<section class="container">
<div class="grid">

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","rCygbYnzyHvaFlmUiJBhXisaDtKyIihA"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM events ORDER BY event_date DESC");

    while(rs.next()){
%>

<div class="glass-panel hover-card event-card">

    <div>
        <div class="event-icon">
            <i class="fas fa-calendar-alt"></i>
        </div>

        <h2><%= rs.getString("title") %></h2>

        <p><%= rs.getString("description") %></p>

        <div class="event-details">
            <span><i class="fas fa-calendar"></i> <%= rs.getString("event_date") %></span>
            <span><i class="fas fa-clock"></i> <%= rs.getString("event_time") %></span>
            <span><i class="fas fa-map-marker-alt"></i> <%= rs.getString("venue") %></span>
        </div>
    </div>

    <a href="register.jsp?id=<%= rs.getInt("id") %>"
       class="btn-primary"
       style="margin-top:15px;">
       Register
    </a>

</div>

<%
    }
    con.close();

}catch(Exception e){
    out.println(e);
}
%>

</div>
</section>

<!-- FOOTER -->
<footer class="glass-footer">
    <div class="footer-bottom">
        <p>&copy; 2026 TechFest. All rights reserved.</p>
    </div>
</footer>

<!-- PARTICLES SCRIPT -->
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
