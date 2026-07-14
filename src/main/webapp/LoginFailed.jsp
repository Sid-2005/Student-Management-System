<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed</title>
    <style>
        body {
            background-color: #e6fbfb;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 60px;
        }
        .message-box {
            background: #ffffff;
            padding: 24px 32px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            text-align: center;
            max-width: 360px;
        }
        h2 {
            color: #cc0000;
            margin-top: 0;
        }
        p {
            color: #333333;
        }
        a.retry-btn {
            display: inline-block;
            margin-top: 16px;
            background-color: #008080;
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
        }
        a.retry-btn:hover {
            background-color: #006666;
        }
    </style>
</head>
<body>
<div class="message-box">
    <h2>Login Failed</h2>
    <p>The email or password you entered is incorrect. Please try again.</p>
    <a class="retry-btn" href="index.html">Back to Login</a>
</div>
</body>
</html>
