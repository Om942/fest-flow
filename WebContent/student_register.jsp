<%@ page import="java.sql.*" %>

<%
String msg = "";

// REGISTER LOGIC
if(request.getMethod().equalsIgnoreCase("POST")){
    try{
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String college = request.getParameter("college");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","rCygbYnzyHvaFlmUiJBhXisaDtKyIihA"
        );
        
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO students(name,contact,email,password,college) VALUES(?,?,?,?,?)"
        );

        ps.setString(1, name);
        ps.setString(2, contact);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, college);

        ps.executeUpdate();
        con.close();

        msg = "Registration Successful";

    }catch(Exception e){
        msg = "❌ Error: " + e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register - TechFest 2026</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

<!-- PARTICLES -->
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>

/* BACKGROUND */
body {
    margin:0;
    overflow:hidden;
    background:#0f172a;
}

.animated-bg {
    position:fixed;
    width:100%;
    height:100%;
    top:0;
    left:0;
    z-index:-1;
}

/* HEADER SPACING */
.page-header {
    padding-top: 20px;
    padding-bottom: 20px;
}

/* REGISTER BOX */
.register-box {
    max-width:400px;
    margin: 10px auto;
    padding:25px;

    background: rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:15px;

    backdrop-filter: blur(10px);
    text-align:center;

    transition: all 0.3s ease;
}

/* ✨ BOX HOVER EFFECT */
.register-box:hover {
    background: rgba(255,255,255,0.08);
    border:1px solid #00f7ff;

    box-shadow:
        0 0 10px rgba(0,247,255,0.5),
        0 0 25px rgba(0,247,255,0.4),
        0 0 50px rgba(0,247,255,0.3);

    transform: translateY(-5px) scale(1.02);
}

/* INPUT */
.register-box input {
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:5px;
    border:none;
}

/* BUTTON */
.register-box button {
    width:100%;
    padding:10px;
    background:#00f7ff;
    border:none;
    border-radius:5px;
    cursor:pointer;
    font-weight:600;
    transition: all 0.3s ease;
}

/* 🔥 BUTTON HOVER */
.register-box button:hover {
    background: linear-gradient(45deg, #00f7ff, #190D66);

    box-shadow:
        0 0 10px rgba(0,247,255,0.6),
        0 0 20px rgba(0,247,255,0.5),
        0 0 40px rgba(0,247,255,0.4);

    transform: translateY(-2px) scale(1.03);
}

/* 👇 CLICK EFFECT */
.register-box button:active {
    transform: scale(0.98);
    box-shadow: 0 0 10px rgba(0,247,255,0.3);
}

</style>

</head>

<body>

<!-- ANIMATED BACKGROUND -->
<div id="particles-js" class="animated-bg"></div>

<!-- HEADER -->
<jsp:include page="header.jsp" />

<!-- REGISTER -->
<header class="page-header">
    <div class="container" style="margin-top:-140px;">

        <h1>Student <span class="text-gradient">Register</span></h1>
        <p>Create your TechFest account</p>

        <div class="register-box">

            <h2>Register</h2>

            <p style="color:lightgreen;"><%= msg %></p>

            <form method="post">

                <input type="text" name="name" placeholder="Full Name" required>
                <input type="text" name="contact" placeholder="Contact Number" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="text" name="college" placeholder="College Name" required>

                <button type="submit">Register</button>

            </form>

            <p style="margin-top:10px;">
                Already have an account? 
                <a href="index.jsp">Login</a>
            </p>

        </div>

    </div>
</header>

<!-- FOOTER -->
<footer class="glass-footer">
    <div class="footer-bottom">
        <p>&copy; 2026 TechFest. All rights reserved.</p>
    </div>
</footer>

<!-- PARTICLE CONFIG -->
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
