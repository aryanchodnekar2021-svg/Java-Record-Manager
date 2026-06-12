# 🎓 Nexus Admissions Portal

A modern Student Admission Portal built with **JSP, MySQL, and JavaMail API**. The application enables students to submit admission inquiries through a responsive web interface while automatically notifying administrators via email whenever a new application is received.

---

## 🚀 Key Features

### 🎨 Modern User Interface

* Elegant Glassmorphism-inspired design
* Responsive layout for desktop and mobile devices
* Smooth animations and interactive UI elements
* Clean and intuitive admission form experience

### 🗄️ Database Integration

* Secure storage of student admission records
* Structured MySQL database design
* Efficient JDBC-based connectivity

### 📧 Automated Email Notifications

* Instant email alerts for new admissions
* SMTP integration using JavaMail API
* Automated communication workflow

### ✅ Form Validation

* HTML5 client-side validation
* Required field enforcement
* Email and phone format verification
* Improved data quality before submission

---

## 🛠️ Technology Stack

| Technology              | Purpose                           |
| ----------------------- | --------------------------------- |
| JSP (JavaServer Pages)  | Frontend & Server-side Processing |
| Java                    | Application Logic                 |
| MySQL                   | Database Management               |
| JDBC                    | Database Connectivity             |
| JavaMail API            | Email Notifications               |
| HTML5, CSS3, JavaScript | User Interface & Validation       |
| Apache Tomcat           | Application Server                |

---

## 📋 Prerequisites

Ensure the following software is installed before deployment:

| Component                  | Version      |
| -------------------------- | ------------ |
| Java Development Kit (JDK) | 8 or higher  |
| Apache Tomcat              | 9.0+         |
| MySQL Server               | 5.7+ or 8.0+ |

---

## 📦 Required Libraries

Place the following JAR files inside the `WEB-INF/lib/` directory:

```text
WEB-INF/
└── lib/
    ├── mysql-connector-java.jar
    ├── javax.mail.jar
    └── activation.jar
```

| Library                  | Purpose                   |
| ------------------------ | ------------------------- |
| mysql-connector-java.jar | MySQL JDBC Driver         |
| javax.mail.jar           | JavaMail API              |
| activation.jar           | Java Activation Framework |

---

## ⚙️ Installation & Setup

### 1. Create the Database

Run the following SQL script:

```sql
CREATE DATABASE IF NOT EXISTS enq12nov25;

USE enq12nov25;

CREATE TABLE IF NOT EXISTS student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    course VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

### 2. Configure Database Connection

Update the connection details in `index.jsp`:

```java
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/enq12nov25",
    "YOUR_MYSQL_USERNAME",
    "YOUR_MYSQL_PASSWORD"
);
```

---

### 3. Configure Email Service

Generate a Gmail App Password and update the authentication section:

```java
Session mailSession = Session.getInstance(
    properties,
    new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(
                "your-email@gmail.com",
                "your-app-password"
            );
        }
    }
);
```

> **Security Note:** Never commit real email credentials or passwords to version control. Use environment variables or external configuration files in production environments.

---

### 4. Deploy the Application

Copy the project folder to Tomcat's `webapps` directory:

```text
apache-tomcat/
└── webapps/
    └── kly_eng_app/
```

Start Tomcat and open:

```text
http://localhost:8080/kly_eng_app/index.jsp
```

---

## 📁 Project Structure

```text
kly_eng_app/
│
├── index.jsp          # Admission form and server-side processing
├── style.css          # UI styling and responsive design
├── script.js          # Client-side interactions and animations
├── schema.sql         # Database schema
├── WEB-INF/
│   └── lib/
│       ├── mysql-connector-java.jar
│       ├── javax.mail.jar
│       └── activation.jar
│
└── .gitignore
```

---

## 🔒 Security Recommendations

* Store sensitive credentials outside source code.
* Use HTTPS in production.
* Validate user input on both client and server sides.
* Restrict database user permissions.
* Enable proper exception logging and monitoring.

---

## 🎯 Future Enhancements

* Student dashboard and application tracking
* Admin panel for managing inquiries
* OTP/email verification
* File upload support for documents
* PDF admission receipt generation
* REST API integration
* Role-based authentication and authorization

---

## 📄 License

This project is provided for educational and learning purposes. Feel free to modify and extend it according to your requirements.

---

### 👨‍💻 Developed With Java, JSP & MySQL

A lightweight admission management solution designed to demonstrate full-stack Java web development concepts, including database integration, form handling, and automated email notifications.
