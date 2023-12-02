<%@page import="Utilidades.ConexionDB, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TecnoBA - Carrito</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/ffa1940001.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="shortcut icon" href="assets/portada/favicon.png" type="image/x-icon">
</head>
<body>

	<%
	String id = request.getParameter("id");
	
	%>

	<header class="bg-dark">
		<div class="row container-fluid">
			<div class="col-md-6 col-auto">
				<a href="#"><img class="icon_codo my-2"
					src="assets/portada/codo_a_codo.png" title="TiendaBA">
				</a>
			</div>
			<div class="col-md-6 col-auto text-end">
				<h1 class="titulo my-2 mx-3">TecnoBA</h1>
			</div>
		</div>
	</header>

	<main class="main-carrito">
		<div class="text-center">
			<h1 id="carrito-vacio">Tu carrito está vacío</h1>
			<a href="tecnoba.jsp?id=<% out.print(id); %>">Probá agregar tu primer producto</a>
			<div class="my-4">
				<img class="img-carrito" src="assets/productos/carrito.jpg" alt="">
			</div>
		</div>
	</main>

	<footer class="bg-dark-subtle">
		<div class="container-fluid text-center">
			<div class="row mx-md-5">
				<div class="col-sm-3 text-sm-start mt-2">
					<h4>TecnoBA</h4>
					<span class="copyright">&copy; 2023</span> <span class="copyright">desarrollado
						por</span>
					<p class="mb-0 copyright">Sergio Muñoz</p>
					<address class="copyright">Buenos Aires - Argentina</address>
				</div>
				<div class="col-sm-3 text-sm-start my-2">
					<h4>Contacto</h4>
					<div>
						<a href="#" class="ubicacion" data-bs-toggle="modal"
							data-bs-target="#exampleModal2">Iguazú 333, Parque Patricios
						</a>
					</div>

					<div>
						<a href="">contacto@tecnoba.com.ar</a>
					</div>
					<div class="modal fade" id="exampleModal2" tabindex="-1"
						aria-labelledby="exampleModalLabel2" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel1">Ubicacion</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<iframe class="img-ubicacion"
										src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3282.5205347918604!2d-58.408952725112016!3d-34.64155485949597!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bccb0d81a1f483%3A0x170f2295f76c0e6c!2sIguaz%C3%BA%20333%2C%20C1437ETC%20CABA!5e0!3m2!1ses-419!2sar!4v1695339001216!5m2!1ses-419!2sar"
										style="border: 0;" allowfullscreen="" loading="lazy"
										referrerpolicy="no-referrer-when-downgrade"></iframe>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-sm-3 text-sm-start my-2">
					<div>
						<h4>Más información</h4>
					</div>
					<div>
						<a href="">Nosotros</a>
					</div>
					<div>
						<a href="">Preguntas frecuentes</a>
					</div>
					<div>
						<a href="">Políticas de privacidad</a>
					</div>
					<div>
						<a href="">Terminos y condiciones</a>
					</div>
				</div>
				<div class="col-sm-3 text-sm-start my-2">
					<div>
						<h4>Seguinos en las redes</h4>
					</div>
					<a href="https://www.facebook.com/" target="_blank"><i
						class="fa-brands fa-facebook fa-xl" style="color: #000000;"></i></a> <a
						href="https://www.instagram.com/" target="_blank"><i
						class="fa-brands fa-instagram fa-xl" style="color: #000000;"></i></a>
					<a href="https://twitter.com/?lang=es" target="_blank"><i
						class="fa-brands fa-x-twitter fa-xl" style="color: #000000;"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
    </script>
</body>
</html>