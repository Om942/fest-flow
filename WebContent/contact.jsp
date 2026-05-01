<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Contact - TechFest 2026</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/style.css">

<!-- PARTICLES -->
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>

/* GLOBAL */
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

/* PAGE HEADER */
.page-header{
    text-align:center;
    padding:50px 0 30px;
}

/* TEXT EFFECT */
.text-gradient{
    background:linear-gradient(45deg,#00f7ff,#ffffff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.highlight{
    color:#00f7ff;
}

/* CONTACT GRID */
.contact-container{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:4rem;
}

/* GLASS PANEL */
.glass-panel{
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:15px;
    backdrop-filter:blur(10px);
    padding:30px;
    transition:0.3s ease;
}

.glass-panel:hover{
    border:1px solid #00f7ff;
    box-shadow:
        0 0 10px rgba(0,247,255,0.5),
        0 0 25px rgba(0,247,255,0.4),
        0 0 50px rgba(0,247,255,0.3);
}

/* INFO SECTION */
.contact-info{
    display:flex;
    flex-direction:column;
    gap:2rem;
}

.info-card{
    display:flex;
    align-items:flex-start;
    gap:1.5rem;
}

.info-icon{
    font-size:1.4rem;
    color:#00f7ff;
    background:rgba(0,247,255,0.1);
    width:50px;
    height:50px;
    display:flex;
    align-items:center;
    justify-content:center;
    border-radius:50%;
    flex-shrink:0;
}

.info-card h3{
    margin-bottom:0.5rem;
}

/* FORM */
.form-group{
    margin-bottom:1rem;
}

label{
    display:block;
    margin-bottom:0.4rem;
}

.form-control{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    outline:none;
}

textarea.form-control{
    min-height:120px;
    resize:vertical;
}

/* BUTTON */
.btn-primary{
    display:inline-block;
    padding:12px 20px;
    background:#00f7ff;
    color:black;
    border:none;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
    cursor:pointer;
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

/* FOOTER */
.glass-footer{
    margin-top:40px;
    padding:20px;
    text-align:center;
    background:rgba(255,255,255,0.05);
    border-top:1px solid rgba(255,255,255,0.1);
}

/* MOBILE */
@media(max-width:768px){
    .contact-container{
        grid-template-columns:1fr;
    }
}

</style>
</head>

<body>

<!-- PARTICLE BACKGROUND -->
<div id="particles-js" class="animated-bg"></div>

<!-- HEADER -->
<jsp:include page="header.jsp" />

<!-- PAGE HEADER -->


<!-- CONTACT SECTION -->
<section class="container" style="margin-bottom:6rem;">
<div class="contact-container">

    <!-- INFO -->
    <div class="contact-info glass-panel">

        <div class="info-card">
            <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
            <div>
                <h3>Location</h3>
                <p>University Main Campus<br>Innovation Block, Building C<br>New York, NY 10012</p>
            </div>
        </div>

        <div class="info-card">
            <div class="info-icon"><i class="fas fa-envelope"></i></div>
            <div>
                <h3>Email Us</h3>
                <p>hello@techfest2026.edu<br>support@techfest2026.edu</p>
            </div>
        </div>

        <div class="info-card">
            <div class="info-icon"><i class="fas fa-phone-alt"></i></div>
            <div>
                <h3>Call Us</h3>
                <p>+1 (555) 123-4567<br>Mon-Fri, 9am-6pm EST</p>
            </div>
        </div>

    </div>

    <!-- FORM -->
   

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
