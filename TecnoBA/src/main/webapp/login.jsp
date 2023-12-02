<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="shortcut icon" href="assets/portada/favicon.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="bg-image" style="background-image: url('assets/portada/laptops_portada.jpeg'); 
	background-repeat: no-repeat; background-size: cover; width: 100vw; height: 100vh;">


	<div class="container col-md-5 mt-5 bg-white py-3 rounded">
		<h2 class="text-center mb-4">Login</h2>

		<div class="d-flex justify-content-center">
		
			<form action="checkLogin.jsp" method="post" class="formContact"
				style="width: 70%;">

				<div class="mb-3" form-group>
					<label>Usuario</label> <input type="text" class="form-control mb-3"
						name="user" placeholder="Ingrese usuario" required>
				</div>

				<div class="mb-3" form-group>
					<label>Contraseña</label> <input type="text"
						class="form-control mb-3" name="pass"
						placeholder="Ingrese contraseña" required>
				</div>

				<div class="text-center mt-5" form-group>
					<input type="submit" value="Enviar" class="btn btn-primary mb-3"
						style="width: 100%;">
				</div>

				<div class="text-center mb-2" form-group>
					<a id="usuario" class="btn btn-outline-success"
						style="width: 100%;" href="registro.jsp">Registrarse</a>
				</div>

				<%
				String mensaje = request.getParameter("mensaje");
				if (mensaje != null) {
					out.println("<div class='bg-danger text-center p-1 rounded'>");
					out.println(mensaje);
					out.println("</div>");
				}
				String mensaje1 = request.getParameter("mensaje1");
				if (mensaje1 != null) {
					out.println("<div class='bg-success text-center p-1 rounded text-white'>");
					out.println(mensaje1);
					out.println("</div>");
				}
				%>

			</form>
		</div>
	</div>

	<script src="js/js.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>