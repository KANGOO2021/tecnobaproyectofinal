<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="Entidad.Usuarios"%>
<%@page import="DAO.UsuariosDAO"%>    
<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registrarse</title>
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

<body class="bg-image" style="background-image: url('assets/portada/descarga (3).jpg');
	background-repeat: repeat;">


	<%
	UsuariosDAO obj = new UsuariosDAO();
	%>
	
	<div class="container col-md-5 mt-5 py-3 rounded border border-black"
		style="background-color: rgb(236, 232, 232);">
		<h2 class="text-center mb-4 display-5">
			<b>Registrarse</b>
		</h2>

		<div class="d-flex justify-content-center">
			<form action="registro.jsp" method="post" class="formContact"
				style="width: 70%;">

				<div class="mb-3" form-group>
					<label>Foto de perfil</label> <input type="file"
						class="form-control" id="imagen" style="width: 100%">
					<button class="btn btn-success" type="button" id="boton"
						style="width: 100%">Agregar imagen</button>

					<input type="text" class="form-control" name="txtFotoPerfil"
						placeholder="Espere url de la imagen" id=up-img required>
				</div>

				<div class="mb-3" form-group>
					<label>Usuario</label> <input type="text" class="form-control mb-3"
						name="txtUser" placeholder="Ingrese su email" required>
				</div>


				<label>Contraseña</label>
				<div class="input-group mb-3">

					<input type="password" id="pass" name="txtPass"
						class="form-control" placeholder="max 8 caracteres alfanúmericos"
						aria-label="Username" aria-describedby="basic-addon1"> <span
						class="input-group-text" id="basic-addon1"> <a href="#">
							<i class="bi bi-eye-slash-fill" id="icono"
							onclick="mostrarPass()"></i>
					</a>
					</span>
				</div>

				<div class="text-center mt-5" form-group>
					<input type="hidden" name="accion" /> <input type="submit"
						value="Enviar" class="btn btn-primary mb-3" style="width: 100%;"
						onclick="enviarDatos();">
				</div>

				<%
				String mensaje3 = request.getParameter("mensaje.");
				if (mensaje3 != null) {
					out.println("<div class='bg-danger text-center p-1 rounded'>");
					out.println(mensaje3);
					out.println("</div>");
				}
				%>

			</form>
		</div>
	</div>


	<script type="text/javascript">
        
        function enviarDatos(){
        	
        	if(document.forms[0].txtFotoPerfil.value.length==0){
        		alert("Ingrese su Foto de perfil");
            	return;	
        	}
        	
        	if(document.forms[0].txtUser.value.length==0){
        		alert("Ingrese su email");
            	return;	
        	}
        	
        	if(document.forms[0].txtPass.value.length==0){
        		alert("Ingrese su contraseña");
            	return;	
        	}
        	
        	document.forms[0].accion.value="nuevo";
        	document.forms[0].submit();
        }
        </script>
	<%
	if (request.getParameter("accion") != null && request.getParameter("accion").equals("nuevo")) {
		Usuarios beanUsuario = new Usuarios();
		//beanArticulo.setIdProducto(Integer.parseInt(request.getParameter("cod")));
		beanUsuario.setFotoPerfil(request.getParameter("txtFotoPerfil"));
		beanUsuario.setUsuario(request.getParameter("txtUser"));
		beanUsuario.setPassword(request.getParameter("txtPass"));
		obj.insertar(beanUsuario);
		response.sendRedirect("login.jsp?mensaje1=El%20usuario%20se%20creo%20exitosamente");
		//request.getRequestDispatcher("login.jsp").forward(request, response);

		//request.getRequestDispatcher("stock.jsp").forward(request, response);
	}
	%>





	<script src="js/registro.js"></script>
	<script type="module" src="js/uploadImagesUser.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>