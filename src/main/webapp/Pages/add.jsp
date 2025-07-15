<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Job Application</title>
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
        <h2><i class="fa-solid fa-briefcase"></i> Add New Job Application</h2>

        <form action="save" method="post">
            <!-- Send the logged-in username to controller -->
            <input type="hidden" name="username" value="${username}" />

            <label for="organization">Organization</label>
            <input type="text" id="organization" name="organization" required>

            <label for="position">Position</label>
            <input type="text" id="position" name="position" required>

            <label for="location">Location</label>
            <input type="text" id="location" name="location" required>

            <label for="status">Status</label>
            <select id="status" name="status" required>
                <option value="">-- Select Status --</option>
                <option value="Applied">Applied</option>
                <option value="Interview Scheduled">Interview Scheduled</option>
                <option value="Rejected">Rejected</option>
                <option value="Offer Received">Offer Received</option>
            </select>

            <label for="notes">Notes</label>
            <textarea id="notes" name="notes" rows="4"></textarea>

            <div class="btn-container">
                <button type="submit" class="submit-btn"><i class="fa-solid fa-save"></i> Save</button>
            </div>
        </form>

        <a href="home?user=${username}" class="back-link"><i class="fa-solid fa-arrow-left"></i> Back to Home</a>
    </div>

</body>
</html>
