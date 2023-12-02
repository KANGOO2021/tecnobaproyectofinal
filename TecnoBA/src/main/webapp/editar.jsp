<%@page import="Entidad.Articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Utilidades.ConexionDB,java.sql.*,DAO.ArticulosDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TecnoBA - Editar</title>
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

	ArticulosDAO obj = new ArticulosDAO();
	Articulos bean = obj.buscarArticulo(cod);
	%>
	
	<div class="container my-2 bg-white p-3 rounded col-sm-8 col-lg-6 col-xl-5" >
		<h2 class="text-center mb-2">Editar Producto</h2>

		<form action="editar.jsp" class="formContact">

			<div class="mb-3" form-group>
				<label>Imagen</label>
				<div
					class="d-flex flex-sm-row flex-column justify-content-between align-items-center">
					<input type="file" class="form-control" id="imagen"
						style="width: 100%">
					<button class="btn btn-success" type="button" id="boton"
						style="width: 100%">Agregar imagen</button>
				</div>
				<input type="text" class="form-control" name="txtImagen"
					value="<%=bean.getImagen()%>" id=up-img>
			</div>

			<div class="mb-3" form-group>
				<label>Id del producto</label> <input type="text"
					class="form-control" name="cod" value="<%=bean.getIdProducto()%>"
					readonly="readonly">
			</div>

			<div class="mb-3" form-group>
				<label>Descripción</label> <input type="text" class="form-control"
					name="txtDescripcion" value="<%=bean.getDescripcion()%>">
			</div>

			<div class="mb-3" form-group>
				<label>Precio</label> <input type="text" class="form-control"
					name="txtPrecio" value="<%=bean.getPrecio()%>">
			</div>

			<div class="mb-3" form-group>
				<label>Cantidad</label> <input type="text" class="form-control"
					name="txtStock" value="<%=bean.getCantidad()%>">
			</div>

			<div class="text-center" form-group>
				<input type="hidden" name="accion" /> <input class="btn btn-primary"
					type="button" name="btn" value="Editar producto"
					onclick="enviarDatos();">
			</div>
		</form>


		<h5 class="text-center mt-3">
			<a href="stock.jsp">Volver al Stock</a>
		</h5>
	</div>

	<script type="text/javascript">
        
        function enviarDatos(){
        	if(document.forms[0].txtDescripcion.value.length==0){
        		alert("Ingrese Descripcion");
            	return;	
        	}
        	if(document.forms[0].txtPrecio.value.length==0){
        		alert("Ingrese Precio");
            	return;	
        	}
        	
        	if(document.forms[0].txtStock.value.length==0){
        		alert("Ingrese Cantidad");
            	return;	
        	}
        	
        	document.forms[0].accion.value="editar";
        	document.forms[0].submit();
        }
        </script>
	<%
	if (request.getParameter("accion") != null && request.getParameter("accion").equals("editar")) {

		Articulos beanArticulo = new Articulos();
		beanArticulo.setIdProducto(Integer.parseInt(request.getParameter("cod")));
		beanArticulo.setDescripcion(request.getParameter("txtDescripcion"));
		beanArticulo.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
		beanArticulo.setCantidad(Integer.parseInt(request.getParameter("txtStock")));
		beanArticulo.setImagen(request.getParameter("txtImagen"));
		obj.actualizar(beanArticulo);
		request.getRequestDispatcher("stock.jsp").forward(request, response);
	}
	%>

	<script type="module" src="js/uploadImages.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
    </script>

</body>
</html>