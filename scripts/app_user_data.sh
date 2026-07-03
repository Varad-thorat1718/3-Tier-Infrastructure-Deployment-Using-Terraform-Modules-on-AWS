#!/bin/bash

dnf update -y
dnf install -y httpd php php-mysqli mariadb105

systemctl enable httpd
systemctl start httpd

cat > /var/www/html/submit.php <<'PHP'
<?php
$db_host = "${db_host}";
$db_name = "${db_name}";
$db_user = "${db_user}";
$db_pass = "${db_pass}";

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

if ($conn->connect_error) {
    die("<h2>Database connection failed</h2><p>" . $conn->connect_error . "</p>");
}

$create_table = "CREATE TABLE IF NOT EXISTS registrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    course VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

$conn->query($create_table);

$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$course = $_POST['course'];

$stmt = $conn->prepare("INSERT INTO registrations (name, email, phone, course) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $name, $email, $phone, $course);

if ($stmt->execute()) {
    echo "<h2>Registration Successful</h2>";
    echo "<p>Your data has been saved in RDS MySQL database.</p>";
    echo "<a href='/'>Go Back</a>";
} else {
    echo "<h2>Registration Failed</h2>";
    echo "<p>" . $stmt->error . "</p>";
}

$stmt->close();
$conn->close();
?>
PHP

chown apache:apache /var/www/html/submit.php
chmod 644 /var/www/html/submit.php

systemctl restart httpd
