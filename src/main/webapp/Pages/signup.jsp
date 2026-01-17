<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0", viewport-fit=cover">
	<title>Signup</title>
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		}
		body {
			background-color: #ffffcc; /* pastel yellow */
		}
		.heading {
			text-align: center;
			margin: 20px;
			color: #ff33cc;
			font-size: 28px;
			font-weight: bold;
		}
		.body {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 85vh;
		}
		.box {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 360px;
            padding: 25px;
            border: 2px solid #ff99cc;
            text-align: center;
            margin: 20px;
        }

        @media (max-width: 480px) {
            .heading {
                font-size: 24px; /* Reduce heading size */
            }
            .box {
                padding: 20px; /* Reduce padding for more space */
            }
        }
		.h1 {
			text-align: center;
			color: #ff33cc;
			margin-bottom: 15px;
		}
		label {
			font-weight: bold;
		}
		.box input[type="text"],
		.box input[type="password"],
		.box input[type="email"] {
			width: 100%;
			padding: 10px;
			margin: 8px 0 18px 0;
			font-size: 16px;
			border: 1px solid #ccc;
			border-radius: 5px;
			outline: none;
			transition: 0.3s;
		}
		.box input[type="text"]:focus,
		.box input[type="password"]:focus,
		.box input[type="email"]:focus {
			border-color: #ff2dbf;
			box-shadow: 0 0 6px rgba(255, 45, 191, 0.3)
		}
		button {
			padding: 12px 20px;
			border: none;
			border-radius: 8px;
			cursor: pointer;
			font-size: 16px;
			background-color: #ff33cc;
			color: white;
			transition: background-color 0.3s ease;
			width: 100%;
			margin-top: 10px;
			margin-bottom: 10px;
		}
		button:hover {
			background-color: #e600ac;
		}
		
		p {
			text-align: center;
			font-size: 14px;
		}
		a {
			text-decoration: none;
			color: white;
			font-weight: bold;
		}

		a:hover {
			text-decoration: underline;
		}
	</style>
</head>

<body>
	<h1 class="heading">Job Application Tracker</h1>
	<div class="body">
		<div class="box">
			<form method="post" action="/signup">
				<h1 class="h1">Signup</h1>
				
				<h3><label for="mail">Email</label></h3>
				<input type="email" id="mail" name="email" required>
				
				<h3><label for="name">Username</label></h3>
				<input type="text" id="name" name="username" required>
			
				<h3><label for="pass">Password</label></h3>
				<input type="password" id="pass" name="password" required>
				
				<c:if test="${not empty error}">
    				<p style="color: red;">${error}</p>
    				
				</c:if>
				
				<c:if test="${not empty message}">   
    				<script>alert("${message}");</script>
				</c:if> 
				
				<button type="submit">Sign up</button>
			</form>
			<p>OR</p>
			<button><a href="/login">Already have an account ? Login</a></button>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>