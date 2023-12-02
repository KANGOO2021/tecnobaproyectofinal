<%@page import="Entidad.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Utilidades.ConexionDB,java.sql.*,DAO.UsuariosDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TecnoBA - Editar Usuario</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/ffa1940001.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="shortcut icon" href="assets/portada/favicon.png" type="image/x-icon">
</head>
<body class="bg-image" style="background-image: url('assets/portada/smart_portada.jpeg');
	 background-repeat: no-repeat; background-size: cover; width: 100vw; height: 100vh;">


	<%
	//String cod = request.getParameter("cod");

	int cod = Integer.parseInt(request.getParameter("cod"));

	UsuariosDAO obj = new UsuariosDAO();
	Usuarios bean = obj.buscarUsuario(cod);
	%>
	<div class="container my-2 bg-white p-3 rounded col-sm-8 col-lg-6 col-xl-5">
		<h2 class="text-center mb-2">Editar Usuario</h2>

		<form action="editarUsuarios.jsp" class="formContact">

			<div class="mb-3" form-group>
				<label>Foto de perfil</label>
				<div
					class="d-flex flex-sm-row flex-column justify-content-between align-items-center">
					<input type="file" class="form-control" id="imagen"
						style="width: 100%">
					<button class="btn btn-success" type="button" id="boton"
						style="width: 100%">Agregar imagen</button>
				</div>
				<input type="text" class="form-control" name="txtImagen"
					value="<%=bean.getFotoPerfil()%>" id=up-img>
			</div>

			<div class="mb-3" form-group>
				<label>Id del Usuario</label> <input type="text"
					class="form-control" name="cod" value="<%=bean.getidUsuario()%>"
					readonly="readonly">
			</div>

			<div class="mb-3" form-group>
				<label>Usuario</label> <input type="text" class="form-control"
					name="txtUsuario" value="<%=bean.getUsuario()%>">
			</div>

			<div class="mb-3" form-group>
				<label>Contraseña</label> <input type="text" class="form-control"
					name="txtPassword" value="<%=bean.getPassword()%>">
			</div>
			<div class="text-center" form-group>
				<input type="hidden" name="accion" /> <input class="btn btn-primary"
					type="button" name="btn" value="Editar Usuario"
					onclick="enviarDatos();">
			</div>
		</form>


		<h5 class="text-center mt-3">
			<a href="usuarios.jsp">Volver Listado Usuarios</a>
		</h5>
	</div>

	<script type="text/javascript">
        
        function enviarDatos(){
        	if(document.forms[0].txtUsuario.value.length==0){
        		alert("Ingrese Usuario");
            	return;	
        	}
        	if(document.forms[0].txtPassword.value.length==0){
        		alert("Ingrese la contraseña");
            	return;	
        	} 	
        	document.forms[0].accion.value="editar";
        	document.forms[0].submit();
        }
        </script>
	<%
	if (request.getParameter("accion") != null && request.getParameter("accion").equals("editar")) {

		Usuarios beanUsuario = new Usuarios();
		beanUsuario.setidUsuario(Integer.parseInt(request.getParameter("cod")));
		beanUsuario.setUsuario(request.getParameter("txtUsuario"));
		beanUsuario.setPassword(request.getParameter("txtPassword"));
		beanUsuario.setFotoPerfil(request.getParameter("txtImagen"));
		obj.actualizarUsuario(beanUsuario);
		request.getRequestDispatcher("usuarios.jsp").forward(request, response);
	}
	%>

	<script type="module" src="js/uploadImagesUser.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
    </script>

</body>
</html>