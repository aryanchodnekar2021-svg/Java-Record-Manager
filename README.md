# 🎓 Nexus Admissions Portal

A premium Student Admission Portal built using **JSP, MySQL, and JavaMail API**. This application provides a modern interface for students to register for various courses and automatically notifies administrators via email upon every new submission.

![Premium UI](https://img.shields.io/badge/UI-Premium-e63946?style=for-the-badge)
![Tech Stack](https://img.shields.io/badge/Stack-JSP%20%7C%20MySQL%20%7C%20CSS3-blue?style=for-the-badge)

## ✨ Features

- **Modern Glassmorphism UI**: A sleek, responsive design using custom CSS variables.
- **Micro-animations**: Interactive elements and smooth entrance transitions powered by JavaScript.
- **Database Integration**: Securely stores student information (Name, Phone, Email, etc.) in MySQL.
- **Email Notifications**: Real-time admin alerts for every application using JavaMail.
- **Form Validation**: Standard HTML5 validation for all inputs.

## 🛠️ Prerequisites

To run this project locally, you will need:
- **Apache Tomcat 9.0+**
- **JDK 8 or higher**
- **MySQL Server**
- **Java Libraries** (placed in `WEB-INF/lib`):
  - `mysql-connector-java.jar`
  - `javax.mail.jar`
  - `activation.jar`

## ⚙️ Setup Instructions

1. **Database Setup**:
   - Run the provided `schema.sql` in your MySQL environment.
   - Database Name: `enq12nov25`
   - Table Name: `student`

2. **Configure Connection**:
   - Open `index.jsp`.
   - Update the connection string: `DriverManager.getConnection("jdbc:mysql://localhost:3306/enq12nov25", "username", "password")`.

3. **Email Configuration**:
   - Update the `Authenticator` in `index.jsp` with your Gmail address and [App Password](https://myaccount.google.com/apppasswords).
   - *Note: Ensure SMTP is enabled for your account.*

4. **Deploy**:
   - Copy the project folder `kly_eng_app` into your Tomcat `webapps` directory.
   - Start Tomcat and visit `http://localhost:8080/kly_eng_app/index.jsp`.

## 📁 Project Structure

```text
kly_eng_app/
├── index.jsp       # Main Structure & Logic
├── style.css       # Premium Styling
├── script.js      # Interactivity & Animations
├── schema.sql      # Database Setup Script
└── .gitignore      # Git Exclusions
```

---
*Created with ❤️ for premium education management.*
