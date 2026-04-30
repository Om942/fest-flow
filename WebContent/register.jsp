<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - TechFest 2026</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .register-container {
            max-width: 800px;
            margin: 0 auto;
        }
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%2394a3b8%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem top 50%;
            background-size: 0.8rem auto;
        }
        select.form-control option {
            background: var(--bg-color);
            color: var(--text-primary);
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="animated-bg"></div>
    
    <!-- Navigation -->
    <nav class="glass-nav">
        <div class="nav-container">
            <a href="index.jsp" class="logo">TechFest<span class="highlight">2026</span></a>
            <div class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="events.jsp">Events</a>
                <a href="about.jsp">About</a>
                <a href="contact.jsp">Contact</a>
                <a href="register.jsp" class="btn-primary">Register Now</a>
            </div>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <header class="page-header">
        <div class="container">
            <h1>Event <span class="text-gradient">Registration</span></h1>
            <p>Secure your spot in the most anticipated tech events.</p>
        </div>
    </header>

    <!-- Registration Section -->
    <section class="container" style="margin-bottom: 6rem;">
        <div class="register-container glass-panel">
            <h2 style="margin-bottom: 2rem; text-align: center;">Participant <span class="highlight">Details</span></h2>
            
            <%
                // Prefill the event selection if the "event" parameter is passed from the events page
                String selectedEvent = request.getParameter("event");
            %>

            <form action="index.jsp" method="POST">
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" class="form-control" placeholder="John" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" class="form-control" placeholder="Doe" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="john.doe@university.edu" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" class="form-control" placeholder="+1 (555) 000-0000" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="university">University / College</label>
                    <input type="text" id="university" name="university" class="form-control" placeholder="Enter your institution name" required>
                </div>

                <div class="form-group">
                    <label for="eventSelect">Select Event to Register For</label>
                    <select id="eventSelect" name="eventSelect" class="form-control" required>
                        <option value="" disabled <%=(selectedEvent == null || selectedEvent.isEmpty()) ? "selected" : ""%>>-- Choose an Event --</option>
                        <option value="coding-clash" <%="coding-clash".equals(selectedEvent) ? "selected" : ""%>>Coding Clash</option>
                        <option value="robo-wars" <%="robo-wars".equals(selectedEvent) ? "selected" : ""%>>Robo Wars</option>
                        <option value="ai-innovathon" <%="ai-innovathon".equals(selectedEvent) ? "selected" : ""%>>AI Innovathon</option>
                        <option value="ctf" <%="ctf".equals(selectedEvent) ? "selected" : ""%>>Capture The Flag</option>
                        <option value="ar-vr" <%="ar-vr".equals(selectedEvent) ? "selected" : ""%>>AR/VR Showcase</option>
                        <option value="iot" <%="iot".equals(selectedEvent) ? "selected" : ""%>>IoT Challenge</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="teamDetails">Team Details (if applicable)</label>
                    <textarea id="teamDetails" name="teamDetails" class="form-control" placeholder="Enter team name and teammate names..." style="min-height: 80px;"></textarea>
                </div>

                <button type="submit" class="btn-primary" style="width: 100%; margin-top: 1rem; font-size: 1.1rem; padding: 1rem;">Complete Registration</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="glass-footer">
        <div class="footer-bottom">
            <p>&copy; 2026 TechFest. All rights reserved.</p>
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
