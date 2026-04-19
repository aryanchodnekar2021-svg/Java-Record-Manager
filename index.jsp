<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nexus Admissions | Student Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="portal-header">
    <div class="portal-badge">Nexus Admissions</div>
    <h1 class="portal-title">Student <span>Portal</span></h1>
    <p class="portal-sub">Fill in your details to submit your course application</p>
</div>

<div class="form-card">

    <div class="card-topbar">
        <div class="card-topbar-left">
            <h2>New Application</h2>
            <p>Academic Year 2025 &ndash; 26</p>
        </div>
        <div class="card-topbar-icon">
            <!-- Inline SVG graduation cap — no emoji, no encoding risk -->
            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 3L1 9l11 6 9-4.91V17h2V9L12 3zM5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82z"/>
            </svg>
        </div>
    </div>

    <div class="card-body">
        <form method="post">

            <div class="section-label">Personal Information</div>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="e.g. John Doe" required>
            </div>

            <div class="flex-group">
                <div class="form-group">
                    <label>Mobile Number</label>
                    <input type="number" name="tel" placeholder="9876543210" required>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="john@example.com" required>
                </div>
            </div>

            <div class="form-group">
                <label>Location</label>
                <input type="text" name="location" placeholder="e.g. Kalyan, Mumbai" required>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <div class="radio-group">
                    <div class="radio-item">
                        <input type="radio" name="gender" id="g-male" value="Male" checked>
                        <label for="g-male">Male</label>
                    </div>
                    <div class="radio-item">
                        <input type="radio" name="gender" id="g-female" value="Female">
                        <label for="g-female">Female</label>
                    </div>
                    <div class="radio-item">
                        <input type="radio" name="gender" id="g-other" value="Other">
                        <label for="g-other">Other</label>
                    </div>
                </div>
            </div>

            <div class="section-label" style="margin-top: 28px;">Academic Preferences</div>

            <div class="flex-group">
                <div class="form-group">
                    <label>Department</label>
                    <div class="select-wrapper">
                        <select name="dept">
                            <option>Computer Engineering</option>
                            <option>Information Technology</option>
                            <option>Electronics</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Preferred Course</label>
                    <div class="select-wrapper">
                        <select name="course">
                            <option>Full Stack Web Dev</option>
                            <option>Data Science (XGBoost)</option>
                            <option>Java Enterprise</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Programming Language Experience</label>
                <input type="text" name="lang" placeholder="e.g. Java, Python, C++" required>
            </div>

            <button type="submit" name="btn" class="btn-submit">Submit Application &rarr;</button>
        </form>

<%
    if (request.getParameter("btn") != null) {
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        String lang = request.getParameter("lang");
        String gender = request.getParameter("gender");
        String dept = request.getParameter("dept");
        String course = request.getParameter("course");

        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enq12nov25", "root", "root");

            String sql = "INSERT INTO student (name, tel, email, location, lang, gender, dept, course) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, tel);
            pst.setString(3, email);
            pst.setString(4, location);
            pst.setString(5, lang);
            pst.setString(6, gender);
            pst.setString(7, dept);
            pst.setString(8, course);
            pst.executeUpdate();

            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", "587");
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");

            Session ms = Session.getInstance(p, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("aryanchodnekar2021@gmail.com", "sntkbmdjkrygxfcg");
                }
            });

            MimeMessage msg = new MimeMessage(ms);
            msg.setFrom(new InternetAddress("aryanchodnekar2021@gmail.com"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress("gojooooo2025@gmail.com"));
            msg.setSubject("New Nexus Admission: " + name);

            String bodyText = "Hello Admin,\n\nA new student has registered:\n\n" +
                              "Name: " + name + "\n" +
                              "Phone: " + tel + "\n" +
                              "Email: " + email + "\n" +
                              "Location: " + location + "\n" +
                              "Languages: " + lang + "\n" +
                              "Gender: " + gender + "\n" +
                              "Department: " + dept + "\n" +
                              "Course: " + course + "\n\n" +
                              "Please follow up accordingly.";
            msg.setText(bodyText);

            Transport.send(msg);

            out.println("<div class='msg'>Application submitted and confirmation email sent successfully!</div>");
            con.close();

        } catch (Exception e) {
            out.println("<div class='msg error'>System Error: " + e.getMessage() + "</div>");
        }
    }
%>

    </div>

    <div class="card-footer">
        <p>&copy; 2025 Nexus Admissions. All rights reserved.</p>
        <span class="secure">Secure Form</span>
    </div>

</div>

<script src="script.js"></script>
</body>
</html>