<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String message = "";

if(request.getMethod().equalsIgnoreCase("POST")){
    try{

        String title = request.getParameter("title");
        String event_date = request.getParameter("event_date");
        String last_date = request.getParameter("last_date");
        String event_time = request.getParameter("event_time");
        String venue = request.getParameter("venue");
        String description = request.getParameter("description");
        String coordinator1 = request.getParameter("coordinator1");
        String coord1_contact = request.getParameter("coord1_contact");
        String coordinator2 = request.getParameter("coordinator2");
        String coord2_contact = request.getParameter("coord2_contact");
        String contact = request.getParameter("contact");
        String video = request.getParameter("video");

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/techfest","root","root"
        );

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO events(title,event_date,last_date,event_time,venue,description,coordinator1,coord1_contact,coordinator2,coord2_contact,contact,video_link) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)"
        );

        ps.setString(1, title);
        ps.setString(2, event_date);
        ps.setString(3, last_date);
        ps.setString(4, event_time);
        ps.setString(5, venue);
        ps.setString(6, description);
        ps.setString(7, coordinator1);
        ps.setString(8, coord1_contact);
        ps.setString(9, coordinator2);
        ps.setString(10, coord2_contact);
        ps.setString(11, contact);
        ps.setString(12, video);

        ps.executeUpdate();
        con.close();

        message = "✅ Event Created Successfully";

    }catch(Exception e){
        message = "❌ Error: " + e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Event</title>

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

/* PARTICLES */
.animated-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:-1;
}

/* CONTAINER */
.container{
    max-width:700px;
    margin:40px auto;
    padding:30px;
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:18px;
    backdrop-filter:blur(10px);
    box-shadow:0 8px 30px rgba(0,0,0,0.25);
}

/* TITLE */
h2{
    text-align:center;
    margin-bottom:20px;
}

.highlight{
    color:#00f7ff;
}

/* MESSAGE */
.message{
    text-align:center;
    margin-bottom:20px;
    font-weight:600;
    color:#90ee90;
}

/* FORM */
.form-group{
    margin-bottom:15px;
}

label{
    display:block;
    margin-bottom:6px;
    font-weight:600;
}

input, textarea{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    outline:none;
    box-sizing:border-box;
}

textarea{
    min-height:100px;
    resize:vertical;
}

/* BUTTON */
button{
    width:100%;
    padding:14px;
    background:#00f7ff;
    color:black;
    border:none;
    border-radius:8px;
    font-size:16px;
    font-weight:700;
    cursor:pointer;
    transition:0.3s ease;
}

button:hover{
    background:linear-gradient(45deg,#00f7ff,#190D66);
    color:white;
    box-shadow:
        0 0 10px rgba(0,247,255,0.6),
        0 0 20px rgba(0,247,255,0.5),
        0 0 40px rgba(0,247,255,0.4);
    transform:translateY(-2px);
}

button:active{
    transform:scale(0.98);
}

</style>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<jsp:include page="admin_header.jsp" />

<div class="container">

    <h2>Create <span class="highlight">Event</span></h2>

    <p class="message"><%= message %></p>

    <form method="post">

        <div class="form-group">
            <label>Event Title</label>
            <input type="text" name="title" required>
        </div>

        <div class="form-group">
            <label>Event Date</label>
            <input type="date" name="event_date" required>
        </div>

        <div class="form-group">
            <label>Last Date of Registration</label>
            <input type="date" name="last_date" required>
        </div>

        <div class="form-group">
            <label>Event Time</label>
            <input type="time" name="event_time" required>
        </div>

        <div class="form-group">
            <label>Event Venue</label>
            <input type="text" name="venue" required>
        </div>

        <div class="form-group">
            <label>Event Description</label>
            <textarea name="description"></textarea>
        </div>

        <div class="form-group">
            <label>Coordinator 1 Name</label>
            <input type="text" name="coordinator1" required>
        </div>

        <div class="form-group">
            <label>Coordinator 1 Contact</label>
            <input type="text" name="coord1_contact" required>
        </div>

        <div class="form-group">
            <label>Coordinator 2 Name</label>
            <input type="text" name="coordinator2" required>
        </div>

        <div class="form-group">
            <label>Coordinator 2 Contact</label>
            <input type="text" name="coord2_contact" required>
        </div>

        <div class="form-group">
            <label>Main Contact Number</label>
            <input type="text" name="contact" required>
        </div>


       <!-- 
        <div class="form-group">
            <label>YouTube Video Link</label>
            <input type="text" name="video">
        </div>
         -->

        <button type="submit">Create Event</button>

    </form>

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