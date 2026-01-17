<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0", viewport-fit=cover">
    <title>JobAppTracker - Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #FFFDCC; /* light yellow */
            color: #333;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
           
            padding: 15px 30px;
            border-bottom: 2px solid #ffd1ec;
        }

        .welcome-text {
            font-size: 22px;
            color: #FF33CC;
            font-weight: bold;
            text-align:center;
        }

        .logout-btn {
            background-color: #FF4C4C;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .logout-btn:hover {
            background-color: #d93737;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .top-actions {
            text-align: right;
            margin-bottom: 15px;
        }

        .add-btn {
            background-color: #FF33CC;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            text-decoration: none;
        }

        .add-btn:hover {
            background-color: #e126b5;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #FF99E6;
            color: #333;
        }

        tr:hover {
            background-color: #FFF0F8;
        }

        .action-links a {
            color: #FF33CC;
            text-decoration: none;
            font-weight: bold;
        }


        td.action-links {
            white-space: nowrap; /* Forces icons to stay on one line */
            min-width: 100px;    /* Ensures column has enough breathing room */
        }

        @media (max-width: 768px) {
            .action-links a {
                font-size: 18px; /* Make icons larger for fingers */
                padding: 5px;    /* Increase tap area */
                display: inline-block;
            }
        }

        .action-links a:hover {
            text-decoration: underline;
        }

        .table-responsive {
            width: 100%;
            overflow-x: auto; /* Enables horizontal scrolling */
            -webkit-overflow-scrolling: touch; /* Smooth scrolling on iOS */
            margin-bottom: 20px;
        }


        @media (max-width: 768px) {
            .top-bar {
                flex-direction: column;
                gap: 15px;
                padding: 15px;
            }

            .container {
                width: 95%;
                padding: 15px;
            }

            .welcome-text {
                font-size: 18px;
                margin-bottom: 10px;
            }


            th, td {
                padding: 10px 5px; /* Reduce padding */
                font-size: 14px; /* Reduce font size */
            }
        }
    </style>
</head>
<body>

    <!-- Top Bar -->
    <div class="top-bar">
        <div class="welcome-text">Welcome, ${username}!</div>
        <a href="login" class="logout-btn">Logout</a>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="top-actions">
            <a href="add?user=${username}" class="add-btn"><i class="fa-solid fa-plus"></i> Add new job application</a>
        </div>
        <div class="table-responsive">
            <table>
                <tr>
                    <th>Organization</th>
                    <th>Position</th>
                    <th>Location</th>
                    <th>Status</th>
                    <th>Notes</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="app" items="${applications}">
                 <tr>
                    <td>${app.organization}</td>
                    <td>${app.position}</td>
                    <td>${app.location}</td>
                    <td>${app.status}</td>
                    <td>${app.notes}</td>
                    <td class="action-links">
                        <a href="edit?id=${app.id}" ...><i class="fa-solid fa-pen-to-square"></i></a>
                        &nbsp;|&nbsp;
                        <a href="delete?id=${app.id}" ...><i class="fa-solid fa-trash"></i></a>
                    </td>
            	 </tr>
                </c:forEach>
            </table>
        </div>

    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
