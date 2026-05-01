<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>TechFest 2026</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #0f172a;
            color: white;
        }

        /* HEADER */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 50px;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            position: sticky;
            top: 0;
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
            color: #00f7ff;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 25px;
        }

        .nav-links li {
            display: inline;
        }

        .nav-links li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            transition: 0.3s;
        }

        .nav-links li a:hover {
            color: #00f7ff;
        }

        .btn {
            background: #00f7ff;
            padding: 8px 15px;
            border-radius: 5px;
            color: black !important;
        }

        /* PAGE CONTENT */
        .container {
            padding: 50px;
            text-align: center;
        }
    </style>
</head>

<body>

<!-- HEADER START -->
<header class="navbar">
    <div class="logo">Fest Flow 2026</div>

    <nav>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="events.jsp">Events</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
           <li><a href="admin_login.jsp" class="btn">Admin Login</a></li>
        </ul>
    </nav>
</header>
<!-- HEADER END -->

<!-- PAGE CONTENT -->
<div class="container">
    <h1>Fest Flow 2026</h1>
    <p>Innovate. Create. Conquer.</p>
</div>

</body>
</html>
