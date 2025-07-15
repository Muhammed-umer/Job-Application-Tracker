<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family: 'Segoe UI', sans-serif;
		}

		body {
			background-color: #fffec8; /* Light Yellow */
		}

		.heading {
			text-align: center;
			margin: 30px 0 10px 0;
			color: #ff2dbf; /* Bright Pink */
			font-size: 28px;
			font-weight: bold;
		}

		.body {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 80vh;
		}
		.box {
			background-color: #ffffff;
			border-radius: 12px;
			box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
			width: 360px;
			padding: 25px;
			border: 2px solid #ff99cc;
			text-align: center;
		}

		.h1 {
			color: #ff2dbf;
			font-size: 24px;
			margin-bottom: 20px;
			font-weight: bold;
		}

		.box input[type="text"],
		.box input[type="password"],
		.box input[type="email"] {
			width: 100%;
			padding: 12px;
			margin: 10px 0 20px 0;
			border: 1px solid #ddd;
			border-radius: 6px;
			outline: none;
			font-size: 15px;
			transition: border-color 0.3s, box-shadow 0.3s;
		}

		.box input:focus {
			border-color: #ff2dbf;
			box-shadow: 0 0 6px rgba(255, 45, 191, 0.3);
		}

		button {
			background-color: #ff2dbf;
			color: white;
			padding: 12px;
			border: none;
			border-radius: 6px;
			width: 100%;
			font-size: 16px;
			cursor: pointer;
			transition: background-color 0.3s ease;
			margin-top: 10px;
			margin-bottom: 10px;
		}

		button:hover {
			background-color: #e600a9;
		}

		p {
			margin-top: 10px;
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
			<form method="post" action="\login">
				<h1 class="h1">Login</h1>
				<h3><label for="name">Username</label></h3>
				<input type="text" id="name" name="username" required>
			
				<h3><label for="pass">Password</label></h3>
				<input type="password" id="pass" name="password" required>
					
				<c:if test="${not empty error}">
    				<p style="color:red;">${error}</p>
				</c:if>	
				
				<button type="submit">Login</button>
			</form>
			<p>OR</p>
			<button><a href="signup">Don't have an account ? Sign up</a></button>
		</div>
	</div>
</body>
</html>