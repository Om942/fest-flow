<%@ page session="true" %>

<!-- ✅ FONT AWESOME (IMPORTANT) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

.student-navbar {
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 40px;

    background: rgba(0,0,0,0.6);
    backdrop-filter: blur(10px);
}

/* LOGO */
.logo {
    font-size:22px;
    font-weight:bold;
    color:#00f7ff;
}

/* MENU */
.menu a {
    color:white;
    text-decoration:none;
    margin:0 12px;
    transition:0.3s;
    font-size:15px;
}

.menu a:hover {
    color:#00f7ff;
}

/* ICON STYLE */
.menu i {
    margin-right:6px;
    color:#00f7ff;
}

/* USER NAME */
.user {
    color:#00f7ff;
    font-weight:bold;
}

.user i {
    margin-right:5px;
}

</style>

<div class="student-navbar">

    <div class="logo">
        <i class="fas fa-microchip"></i> Fest Flow 2026
    </div>

    <div class="menu">
        <a href="studentdashboard.jsp">
            <i class="fas fa-home"></i> Home
        </a>

        <a href="my_events.jsp">
            <i class="fas fa-calendar-check"></i> My Events
        </a>

        <a href="update_profile.jsp">
            <i class="fas fa-user-edit"></i> Update Profile
        </a>

        <a href="logout.jsp">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <div class="user">
        <i class="fas fa-user-circle"></i> 
        <%= session.getAttribute("student_name") %>
    </div>

</div>