<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Student</title>
    <style>
        /* Borrowing your clean dashboard styles */
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
            background-color: #28a745; /* Distinctive Green for Add operations */
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

        .btn:hover { background-color: #218838; }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover { background-color: #5a6268; }

        /* Alert styling for the dynamic response */
        .alert {
            padding: 15px;
            margin-top: 20px;
            border-radius: 8px;
            font-weight: bold;
            text-align: left;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Student</h2>

    <!-- Form submits via POST to match your doPost method -->
    <form action="AddStudent" method="POST">
        <div class="input-group">
            <label for="Sid">Student ID:</label>
            <input type="number" id="Sid" name="Sid" required>
        </div>

        <div class="input-group">
            <label for="Sname">Student Name:</label>
            <input type="text" id="Sname" name="Sname" required>
        </div>

        <div class="input-group">
            <label for="PhoneNo">Phone Number:</label>
            <input type="text" id="PhoneNo" name="PhoneNo" required>
        </div>

        <button type="submit" class="btn">Save Student</button>
    </form>

    <!-- Dynamic Response logic based on your 'check' attribute -->
    <c:if test="${not empty check}">
        <c:choose>
            <%-- executeUpdate returns 1 if one row was successfully inserted --%>
            <c:when test="${check > 0}">
                <div class="alert alert-success">
                    Student successfully added to the database!
                </div>
            </c:when>
            <%-- If 0 was returned, or an exception occurred causing it to not be > 0 --%>
            <c:otherwise>
                <div class="alert alert-error">
                    Failed to add student. Please ensure the ID does not already exist.
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <br>
    <!-- Direct back to dashboard button -->
    <form action="Dashboard.jsp" method="GET">
        <button type="submit" class="btn btn-secondary">Back to Dashboard</button>
    </form>
</div>

</body>
</html>