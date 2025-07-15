<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Job Application</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #FFFDCC;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #FF33CC;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
        }

        .btn-container {
            text-align: center;
        }

        .submit-btn {
            background-color: #FF33CC;
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #e126b5;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #FF33CC;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2><i class="fa-solid fa-pen-to-square"></i> Edit Job Application</h2>

        <form action="update" method="post">
            <input type="hidden" name="id" value="${application.id}">

            <label for="organization">Organization</label>
            <input type="text" id="organization" name="organization" value="${application.organization}" required>

            <label for="position">Position</label>
            <input type="text" id="position" name="position" value="${application.position}" required>

            <label for="location">Location</label>
            <input type="text" id="location" name="location" value="${application.location}" required>

            <label for="status">Status</label>
            <select id="status" name="status" required>
                <option value="">-- Select Status --</option>
                <option value="Applied" ${application.status == 'Applied' ? 'selected' : ''}>Applied</option>
                <option value="Interview Scheduled" ${application.status == 'Interview Scheduled' ? 'selected' : ''}>Interview Scheduled</option>
                <option value="Rejected" ${application.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                <option value="Offer Received" ${application.status == 'Offer Received' ? 'selected' : ''}>Offer Received</option>
            </select>

            <label for="notes">Notes</label>
            <textarea id="notes" name="notes" rows="4">${application.notes}</textarea>

            <div class="btn-container">
                <button type="submit" class="submit-btn"><i class="fa-solid fa-save"></i> Update</button>
            </div>
        </form>

        <a href="home?user=${application.user.username}" class="back-link"><i class="fa-solid fa-arrow-left"></i> Back to Home</a>
    </div>

</body>
</html>
