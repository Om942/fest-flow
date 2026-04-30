<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- ADMIN HEADER -->
<header class="admin-navbar">
    <div class="logo">Admin Panel</div>

    <nav>
        <ul class="admin-menu">
            <li><a href="AdminDashboard.jsp">Home</a></li>
            <li><a href="create_event.jsp">Create Event</a></li>
            <li><a href="update_event.jsp">Update Event</a></li>
            <li><a href="delete_event.jsp">Delete Event</a></li>
            <li><a href="viewregistration.jsp">View Registration</a></li>
            <li><a href="generaetcertificate1.jsp">Generate Certificate</a></li>
            <li><a href="index.jsp" class="logout">Logout</a></li>
        </ul>
    </nav>
</header>

<style>
    .admin-navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 40px;
        background: #020617;
        color: white;
        position: sticky;
        top: 0;
    }

    .logo {
        font-size: 22px;
        font-weight: bold;
        color: #00f7ff;
    }

    .admin-menu {
        list-style: none;
        display: flex;
        gap: 20px;
    }

    .admin-menu li a {
        text-decoration: none;
        color: white;
        font-size: 15px;
        transition: 0.3s;
    }

    .admin-menu li a:hover {
        color: #00f7ff;
    }

    .logout {
        background: red;
        padding: 6px 12px;
        border-radius: 5px;
    }
</style>