<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student</title>
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
            background-color: #dc3545; /* Red color for Delete action */
            color: #ffffff;
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

        .btn:hover { background-color: #c82333; }

        .btn-secondary {
            background-color: #6c757d;
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
    <h2>Delete a Student</h2>
    <p style="color: #666; font-size: 14px; margin-bottom: 20px;">Warning: This action cannot be undone.</p>

    <form action="DeleteStudent" method="POST">
        <div class="input-group">
            <label for="Sid">Student ID to Delete:</label>
            <input type="number" id="Sid" name="Sid" required>
        </div>

        <button type="submit" class="btn">Permanently Delete Student</button>
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