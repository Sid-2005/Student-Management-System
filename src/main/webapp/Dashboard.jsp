<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System Dashboard</title>
    <style>
        /* Base styles */
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

        /* Dashboard Container */
        .dashboard-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 90%;
            text-align: center;
        }

        /* Title */
        .dashboard-title {
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }

        /* Grid Layout for Buttons */
        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            justify-content: center;
        }

        /* Button Styles */
        .btn {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 16px 24px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
            width: 100%;
        }

        /* Hover Effects */
        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.3);
        }

        .btn:active {
            transform: translateY(1px);
            box-shadow: 0 2px 4px rgba(0, 123, 255, 0.2);
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <h1 class="dashboard-title">Student Management System Dashboard</h1>

    <div class="button-grid">
        <form action="allStudent" method="GET" style="width: 100%;">
            <button type="submit" class="btn">Display All Students</button>
        </form>

        <form action="searchStudent" method="GET" style="width: 100%;">
            <button type="submit" class="btn">Search Student</button>
        </form>

        <form action="UpdateStudent" method="GET" style="width: 100%;">
            <button type="submit" class="btn">Update Student</button>
        </form>

        <form action="AddStudent" method="GET" style="width: 100%;">
            <button type="submit" class="btn">Add Student</button>
        </form>

        <form action="DeleteStudent" method="GET" style="width: 100%;">
            <button type="submit" class="btn">Delete Student</button>
        </form>

        <form action="LogOut" method="GET" style="width: 100%;">
            <button type="submit" class="btn">Log Out</button>
        </form>

    </div>
</div>

</body>
</html>