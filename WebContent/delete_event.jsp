<%@ page import="java.sql.*" %>

<%
String message = "";

/* DELETE LOGIC */
if(request.getParameter("deleteId") != null){
    try{
        int id = Integer.parseInt(request.getParameter("deleteId"));

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/techfest","root","root"
        );

        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM events WHERE id=?"
        );

        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();

        message = "✅ Event Deleted Successfully";

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

<title>Delete Event</title>

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

/* DELETE BUTTON */
.btn-delete{
    padding:10px 16px;
    border:none;
    border-radius:8px;
    background:#ef4444;
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:0.3s ease;
}

.btn-delete:hover{
    background:linear-gradient(45deg,#ef4444,#7f1d1d);
    box-shadow:
        0 0 10px rgba(239,68,68,0.6),
        0 0 20px rgba(239,68,68,0.4),
        0 0 40px rgba(239,68,68,0.3);
    transform:translateY(-2px);
}

</style>

<script>
function confirmDelete(id){
    if(confirm("Are you sure you want to delete this event?")){
        window.location.href = "delete_event.jsp?deleteId=" + id;
    }
}
</script>

</head>

<body>

<div id="particles-js" class="animated-bg"></div>

<jsp:include page="admin_header.jsp" />

<div class="wrapper">

    <h2>Delete Events</h2>
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
                    <button class="btn-delete"
                            onclick="confirmDelete(<%= rs.getInt("id") %>)">
                        Delete
                    </button>
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