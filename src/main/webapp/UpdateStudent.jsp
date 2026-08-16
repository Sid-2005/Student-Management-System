<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
    <style>
        body {
            background-color: #f4f7f6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .btn {
            background-color: #ffc107; /* Warning yellow for updates */
            color: #212529;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-bottom: 10px;
        }

        .btn:hover { background-color: #e0a800; }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover { background-color: #5a6268; }

        .alert-box {
            margin-top: 20px;
            padding: 15px;
            background-color: #e2e3e5;
            color: #383d41;
            border: 1px solid #d6d8db;
            border-radius: 8px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Update Student Details</h2>
    <p style="color: #666; font-size: 14px; margin-bottom: 20px;">Enter the Student ID, and fill out only the fields you wish to change.</p>

    <form action="UpdateStudent" method="POST">
        <div class="input-group">
            <label for="Sid">Student ID (Required):</label>
            <!-- ID is required to know WHO to update -->
            <input type="number" id="Sid" name="Sid" required>
        </div>

        <div class="input-group">
            <label for="SName">New Student Name (Optional):</label>
            <!-- Note: Name parameter here must exactly match 'SName' from your Servlet -->
            <input type="text" id="SName" name="SName">
        </div>

        <div class="input-group">
            <label for="PhoneNo">New Phone Number (Optional):</label>
            <input type="text" id="PhoneNo" name="PhoneNo">
        </div>

        <button type="submit" class="btn">Update Student</button>
    </form>

    <!-- Dynamic Response logic based on your 'Message' attribute -->
    <c:if test="${not empty Message}">
        <div class="alert-box">
            ${Message}
        </div>
    </c:if>

    <br>
    <form action="Dashboard.jsp" method="GET">
        <button type="submit" class="btn btn-secondary">Back to Dashboard</button>
    </form>
</div>

</body>
</html>