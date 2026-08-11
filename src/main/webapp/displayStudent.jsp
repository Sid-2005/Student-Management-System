<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Import the JSTL core library to use the <c:forEach> loop --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Students</title>
    <style>
        /* Reusing your clean dashboard styles */
        body {
            background-color: #f4f7f6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .table-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
            margin-top: 40px;
        }

        .page-title {
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 600;
            text-align: center;
        }

        /* Table specific styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: 500;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Back button styling */
        .btn-back {
            background-color: #6c757d;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="table-container">
    <h1 class="page-title">Registered Students</h1>

    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Phone Number</th>
            </tr>
        </thead>
        <tbody>
            <%-- This loop iterates over the 'studentList' you set in your Servlet --%>
            <c:forEach var="student" items="${studentList}">
                <tr>
                    <%-- Accessing the getters from your Student.java POJO --%>
                    <td>${student.sid}</td>
                    <td>${student.sname}</td>
                    <td>${student.phone_no}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- A quick way to get back to the main dashboard -->
    <a href="Dashboard.jsp" class="btn-back">Back to Dashboard</a>
</div>

</body>
</html>