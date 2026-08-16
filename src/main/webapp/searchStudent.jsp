<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Student</title>
    <style>
        /* Reusing your dashboard styling */
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
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-bottom: 10px;
        }

        .btn:hover { background-color: #0056b3; }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover { background-color: #5a6268; }

        /* Styling for the results box */
        .result-box {
            margin-top: 30px;
            padding: 20px;
            background-color: #e9ecef;
            border-radius: 8px;
            text-align: left;
        }

        .error-message {
            color: #dc3545;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Search for a Student</h2>

    <!-- The form sends data back to the same Servlet -->
    <form action="searchStudent" method="GET">
        <div class="input-group">
            <label for="Sid">Enter Student ID:</label>
            <!-- keeps the typed ID in the box after submitting -->
            <input type="number" id="Sid" name="Sid" value="${param.Sid}" required>
        </div>
        <button type="submit" class="btn">Search</button>
    </form>

    <!-- This block only shows up if the Servlet attaches 'studentData' -->
    <c:if test="${not empty studentData}">
        <div class="result-box">
            <h3>Student Found:</h3>
            <p><strong>ID:</strong> ${studentData.sid}</p>
            <p><strong>Name:</strong> ${studentData.sname}</p>
            <p><strong>Phone:</strong> ${studentData.phone_no}</p>
        </div>
    </c:if>

    <!-- This block only shows up if the Servlet attaches an 'errorMessage' -->
    <c:if test="${not empty errorMessage}">
        <p class="error-message">${errorMessage}</p>
    </c:if>

    <br>
    <!-- Direct back to dashboard button -->
    <form action="Dashboard.jsp" method="GET">
        <button type="submit" class="btn btn-secondary">Back to Dashboard</button>
    </form>
</div>

</body>
</html>