<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>About - TechFest 2026</title>

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

/* ABOUT GRID */
.about-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:4rem;
    align-items:center;
}

/* ABOUT TEXT */
.about-content h2{
    font-size:2.5rem;
    margin-bottom:1.5rem;
}

/* IMAGE BOX */
.about-image{
    background:linear-gradient(135deg, rgba(0,247,255,0.2), rgba(25,13,102,0.5));
    border-radius:20px;
    height:400px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:4rem;
    color:rgba(255,255,255,0.7);
    border:1px solid rgba(255,255,255,0.1);
    backdrop-filter:blur(10px);
    transition:0.3s ease;
}

.about-image:hover{
    box-shadow:
        0 0 10px rgba(0,247,255,0.5),
        0 0 25px rgba(0,247,255,0.4),
        0 0 50px rgba(0,247,255,0.3);
    transform:translateY(-5px);
}

/* GLASS PANEL */
.glass-panel{
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:15px;
    backdrop-filter:blur(10px);
    padding:30px;
}

/* TIMELINE */
.timeline{
    margin-top:2rem;
    border-left:2px solid #00f7ff;
    padding-left:2rem;
}

.timeline-item{
    position:relative;
    margin-bottom:2rem;
}

.timeline-item::before{
    content:'';
    position:absolute;
    left:-2.55rem;
    top:0.3rem;
    width:1rem;
    height:1rem;
    background:#00f7ff;
    border-radius:50%;
    border:3px solid #0f172a;
}

.timeline-item h3{
    color:#00f7ff;
    margin-bottom:0.5rem;
}

/* HEADER */
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

/* BUTTON */
.btn-primary{
    display:inline-block;
    padding:12px 20px;
    background:#00f7ff;
    color:black;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
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
    .about-grid{
        grid-template-columns:1fr;
    }

    .about-image{
        height:250px;
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

<!-- ABOUT SECTION -->
<section class="container" style="margin-bottom:4rem;">
    <div class="about-grid">

        <div class="about-content">
            <h2>A Decade of <span class="highlight">Innovation</span></h2>

            <p>
                TechFest began as a humble initiative in 2016 by a group of passionate students.
                Over the past decade, it has evolved into one of the largest and most prestigious
                technical festivals in the country.
            </p>

            <br>

            <p>
                Our mission is to provide a platform for brilliant minds to converge, collaborate,
                and create solutions that shape the future.
            </p>

            <br>

            <a href="events.jsp" class="btn-primary">View Our Journey</a>
        </div>

        <div class="about-image">
            <i class="fas fa-rocket"></i>
        </div>

    </div>
</section>

<!-- TIMELINE -->
<section class="container" style="margin-bottom:6rem;">
    <div class="glass-panel">

        <h2 style="text-align:center;">Fest <span class="text-gradient">Schedule</span></h2>

        <div class="timeline">

            <div class="timeline-item">
                <h3>Day 1: Inauguration & Hackathon Commences</h3>
                <p>April 10, 2026 - 09:00 AM</p>
                <p>Opening ceremony with keynote sessions and coding marathon begins.</p>
            </div>

            <div class="timeline-item">
                <h3>Day 2: Robotics & Core Events</h3>
                <p>April 11, 2026 - 10:00 AM</p>
                <p>Robo Wars, IoT Challenge, technical workshops and exhibitions.</p>
            </div>

            <div class="timeline-item">
                <h3>Day 3: Final Presentations & Closing</h3>
                <p>April 12, 2026 - 02:00 PM</p>
                <p>Final judging, prize distribution and grand closing ceremony.</p>
            </div>

        </div>

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