<%@ page import="java.sql.*" %>

<%
String message = "";

/* UPDATE LOGIC */
if(request.getParameter("updateBtn") != null){
    try{
        int id = Integer.parseInt(request.getParameter("id"));

        String title = request.getParameter("title");
        String event_date = request.getParameter("event_date");
        String last_date = request.getParameter("last_date");
        String event_time = request.getParameter("event_time");
        String venue = request.getParameter("venue");
        String description = request.getParameter("description");
        String coordinator1 = request.getParameter("coordinator1");
        String coordinator2 = request.getParameter("coordinator2");
        String contact = request.getParameter("contact");
        String video = request.getParameter("video");

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","rCygbYnzyHvaFlmUiJBhXisaDtKyIihA"
        );

        PreparedStatement ps = con.prepareStatement(
            "UPDATE events SET title=?,event_date=?,last_date=?,event_time=?,venue=?,description=?,coordinator1=?,coordinator2=?,contact=?,video_link=? WHERE id=?"
        );

        ps.setString(1, title);
        ps.setString(2, event_date);
        ps.setString(3, last_date);
        ps.setString(4, event_time);
        ps.setString(5, venue);
        ps.setString(6, description);
        ps.setString(7, coordinator1);
        ps.setString(8, coordinator2);
        ps.setString(9, contact);
        ps.setString(10, video);
        ps.setInt(11, id);

        ps.executeUpdate();
        con.close();

        message = "? Event Updated Successfully";

    }catch(Exception e){
        message = "? Error: " + e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Events</title>

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
.wrapper{
    width:95%;
    max-width:1300px;
    margin:auto;
    padding:30px 15px;
}

h2{
    text-align:center;
    margin-bottom:10px;
}

.msg{
    text-align:center;
    color:#90ee90;
    margin-bottom:20px;
    font-weight:600;
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
    border-collapse:collapse;
    min-width:800px;
}

th{
    background:rgba(0,247,255,0.15);
    color:#00f7ff;
    padding:14px;
    text-align:left;
}

td{
    padding:14px;
    border-bottom:1px solid rgba(255,255,255,0.08);
}

tr:hover{
    background:rgba(255,255,255,0.04);
}

/* BUTTON */
button{
    padding:10px 16px;
    border:none;
    border-radius:8px;
    background:#00f7ff;
    color:#000;
    font-weight:600;
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
}

/* MODAL */
.modal{
    display:none;
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.75);
    z-index:999;
    overflow:auto;
}

.modal-content{
    width:90%;
    max-width:750px;
    margin:40px auto;
    background:rgba(15,23,42,0.95);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:18px;
    padding:25px;
    color:white;
    backdrop-filter:blur(10px);
}

/* FORM */
.form-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:14px;
}

.form-group{
    display:flex;
    flex-direction:column;
}

.form-group.full{
    grid-column:span 2;
}

label{
    margin-bottom:6px;
    font-weight:600;
}

input, textarea{
    padding:12px;
    border:none;
    border-radius:8px;
    outline:none;
}

textarea{
    min-height:100px;
    resize:vertical;
}

.button-row{
    margin-top:20px;
    display:flex;
    gap:10px;
    justify-content:center;
    flex-wrap:wrap;
}

@media(max-width:768px){
    .form-grid{
        grid-template-columns:1fr;
    }
    .form-group.full{
        grid-column:span 1;
    }
}
</style>

<script>
function openModal(data){
    document.getElementById("modal").style.display="block";

    document.getElementById("id").value = data[0];
    document.getElementById("title").value = data[1];
    document.getElementById("event_date").value = data[2];
    document.getElementById("last_date").value = data[3];
    document.getElementById("event_time").value = data[4];
    document.getElementById("venue").value = data[5];
    document.getElementById("description").value = data[6];
    document.getElementById("coordinator1").value = data[7];
    document.getElementById("coordinator2").value = data[8];
    document.getElementById("contact").value = data[9];
    document.getElementById("video").value = data[10];
}

function closeModal(){
    document.getElementById("modal").style.display="none";
}
</script>
</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<jsp:include page="admin_header.jsp" />

<div class="wrapper">

<h2>Update Events</h2>
<p class="msg"><%= message %></p>

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
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://switchyard.proxy.rlwy.net:19169/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","rCygbYnzyHvaFlmUiJBhXisaDtKyIihA"
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
<button onclick='openModal([
"<%= rs.getInt("id") %>",
"<%= rs.getString("title") %>",
"<%= rs.getString("event_date") %>",
"<%= rs.getString("last_date") %>",
"<%= rs.getString("event_time") %>",
"<%= rs.getString("venue") %>",
"<%= rs.getString("description") %>",
"<%= rs.getString("coordinator1") %>",
"<%= rs.getString("coordinator2") %>",
"<%= rs.getString("contact") %>",
"<%= rs.getString("video_link") %>"
])'>Update</button>
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

<!-- MODAL -->
<div id="modal" class="modal">
<div class="modal-content">

<h2 style="text-align:center;">Update Event</h2>

<form method="post">

<input type="hidden" name="id" id="id">

<div class="form-grid">

<div class="form-group">
<label>Event Title</label>
<input type="text" name="title" id="title">
</div>

<div class="form-group">
<label>Event Date</label>
<input type="date" name="event_date" id="event_date">
</div>

<div class="form-group">
<label>Last Date</label>
<input type="date" name="last_date" id="last_date">
</div>

<div class="form-group">
<label>Event Time</label>
<input type="time" name="event_time" id="event_time">
</div>

<div class="form-group">
<label>Venue</label>
<input type="text" name="venue" id="venue">
</div>

<div class="form-group">
<label>Contact</label>
<input type="text" name="contact" id="contact">
</div>

<div class="form-group">
<label>Coordinator 1</label>
<input type="text" name="coordinator1" id="coordinator1">
</div>

<div class="form-group">
<label>Coordinator 2</label>
<input type="text" name="coordinator2" id="coordinator2">
</div>

<div class="form-group full">
<label>Description</label>
<textarea name="description" id="description"></textarea>
</div>

<div class="form-group full">
<label>YouTube Link</label>
<input type="text" name="video" id="video">
</div>

</div>

<div class="button-row">
<button type="submit" name="updateBtn">Update</button>
<button type="button" onclick="closeModal()">Close</button>
</div>

</form>

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
    move: { enable:true, speed:2 }
  },
  interactivity: {
    events: {
      onhover: { enable:true, mode:"repulse" }
    }
  }
});
</script>

</body>
</html>
