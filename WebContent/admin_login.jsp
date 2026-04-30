<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <!-- PARTICLES -->
    <script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

    <style>
        body {
            background: #0f172a;
            font-family: Arial;
            color: white;
            text-align: center;
            margin:0;
            overflow:hidden;
        }

        /* BACKGROUND */
        .animated-bg {
            position:fixed;
            width:100%;
            height:100%;
            top:0;
            left:0;
            z-index:-1;
        }

        /* LOGIN BOX */
        .login-box {
            width: 300px;
            margin: 100px auto;
            padding: 30px;

            background: rgba(255,255,255,0.1);
            border-radius: 10px;

            transition: all 0.3s ease;
        }

        /* ✨ HOVER EFFECT */
        .login-box:hover {
            background: rgba(255,255,255,0.15);
            border:1px solid #00f7ff;

            box-shadow:
                0 0 10px rgba(0,247,255,0.5),
                0 0 25px rgba(0,247,255,0.4),
                0 0 50px rgba(0,247,255,0.3);

            transform: translateY(-5px) scale(1.02);
        }

        /* INPUT */
        input {
            width: 90%;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            border:none;
        }

        /* BUTTON */
        button {
            padding: 10px 20px;
            background: #00f7ff;
            border: none;
            border-radius: 5px;
            cursor:pointer;
            transition: all 0.3s ease;
        }

        /* 🔥 BUTTON HOVER */
        button:hover {
            background: linear-gradient(45deg, #00f7ff, #190D66);

            box-shadow:
                0 0 10px rgba(0,247,255,0.6),
                0 0 20px rgba(0,247,255,0.5),
                0 0 40px rgba(0,247,255,0.4);

            transform: translateY(-2px) scale(1.05);
        }

        /* CLICK EFFECT */
        button:active {
            transform: scale(0.95);
        }

    </style>
</head>

<body>

<!-- ANIMATED BACKGROUND -->
<div id="particles-js" class="animated-bg"></div>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if(username != null && password != null){
        if(username.equals("admin") && password.equals("admin")){
            response.sendRedirect("AdminDashboard.jsp");
        } else {
            out.println("<p style='color:red; text-align:center;'>Invalid Credentials</p>");
        }
    }
%>

<div class="login-box">
    <h2>Admin Login</h2>

    <form method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>

        <button type="submit">Login</button>
    </form>
</div>

<!-- PARTICLES CONFIG -->
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
