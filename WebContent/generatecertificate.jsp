<%@ page import="java.sql.*" %>

<%
String name = "";
String event = "";
String date = "";
String certId = "";

try {
    String id = request.getParameter("id");

    if(id == null || id.trim().equals("")){
        out.println("Invalid Certificate Request");
        return;
    }

    certId = "CERT-" + id;

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost/techfest", "root", "root"
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM event_registrations WHERE id=?"
    );

    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("participant_name");
        event = rs.getString("event_title");
        date = rs.getString("applied_date");
    }

    rs.close();
    ps.close();
    con.close();

} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Certificate</title>

<style>
body {
    margin:0;
    padding:0;
    background:#f0f0f0;
    font-family: 'Times New Roman', serif;
}

/* CERTIFICATE */
.certificate {
    width:900px;
    height:600px;
    margin:40px auto;
    padding:40px;
    border:12px solid #000;
    background:white;
    text-align:center;
    position:relative;
}

/* HEADER */
.logo {
    position:absolute;
    top:20px;
    left:30px;
}

.cert-id {
    position:absolute;
    top:20px;
    right:30px;
    font-size:14px;
}

/* TEXT */
.title {
    font-size:40px;
    font-weight:bold;
    margin-top:20px;
}

.subtitle {
    font-size:20px;
    margin-top:15px;
}

.name {
    font-size:32px;
    font-weight:bold;
    margin:20px 0;
    color:#1e3c72;
}

/* FOOTER */
.footer {
    margin-top:50px;
    display:flex;
    justify-content:space-between;
    padding:0 50px;
}

.sign {
    text-align:center;
}

/* PRINT BUTTON */
.print-btn {
    text-align:center;
    margin-top:20px;
}

button {
    padding:10px 20px;
    background:#007bff;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

button:hover {
    background:#0056b3;
}

/* PRINT STYLE */
@media print {
    button {
        display:none;
    }
}
</style>

</head>

<body>

<div class="certificate">

    <!-- LOGO (Optional) -->
    <div class="logo">
        <img src="logo.jpeg" width="80">
    </div>

    <!-- CERTIFICATE ID -->
    <div class="cert-id">
        ID: <%= certId %>
    </div>

    <!-- CONTENT -->
    <div class="title">Certificate of Participation</div>

    <div class="subtitle">This is to certify that</div>

    <div class="name"><%= name %></div>

    <div class="subtitle">
        has successfully participated in
    </div>

    <div class="name"><%= event %></div>

    <div class="subtitle">
        organized under Tech Fest
    </div>

    <div class="subtitle">
        Date: <%= date %>
    </div>

    <!-- SIGNATURES -->
    <div class="footer">
        <div class="sign">
            ___________________<br>
            Coordinator
        </div>

        <div class="sign">
            ___________________<br>
            Organizer
        </div>
    </div>

</div>

<!-- PRINT BUTTON -->
<div class="print-btn">
    <button onclick="window.print()">Print / Download Certificate</button>
</div>

</body>
</html>

