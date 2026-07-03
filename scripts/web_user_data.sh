#!/bin/bash

exec > /var/log/web-user-data.log 2>&1
set -x

dnf clean all
dnf update -y
dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>3-Tier Registration App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f8;
            padding: 40px;
        }
        .container {
            width: 420px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #222;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        button {
            width: 100%;
            background: #0f62fe;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #0043ce;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Registration Form</h2>
        <form action="/submit" method="POST">
            <input type="text" name="name" placeholder="Enter Full Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="text" name="phone" placeholder="Enter Phone Number" required>
            <input type="text" name="course" placeholder="Enter Course Name" required>
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
HTML

cat > /etc/nginx/conf.d/registration-app.conf <<NGINX
server {
    listen 80;
    server_name _;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /submit {
        proxy_pass http://${app_private_ip}/submit.php;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
NGINX

rm -f /etc/nginx/conf.d/default.conf

nginx -t

systemctl enable nginx
systemctl restart nginx
systemctl status nginx --no-pager
