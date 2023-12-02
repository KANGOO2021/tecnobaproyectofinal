<%@page import="Entidad.Articulos,DAO.ArticulosDAO,java.util.ArrayList, Utilidades.ConexionDB, java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="javax.swing.JOptionPane"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>TecnoBA</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
		crossorigin="anonymous">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/ffa1940001.js"crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="shortcut icon" href="assets/portada/favicon.png" type="image/x-icon">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

	<%
	String id = request.getParameter("id");
	
	String usuario = new String();
	String foto = new String();

	if (id != null) {
		Connection cnx = ConexionDB.getConexion();
		PreparedStatement psta = cnx.prepareStatement("SELECT * FROM usuarios WHERE usuarios_id=" + id);
		ResultSet rs = psta.executeQuery();
		rs.next();

		id = rs.getString("usuarios_id");
		usuario = rs.getString("user");
		foto = rs.getString("fotoPerfil");
	}
	%>
	<!-- barra de navegación -->
	<header>
		<nav
			class="navbar navbar-expand-lg bg-body-tertiary bg-dark border-bottom border-body fixed-top"
			data-bs-theme="dark">
			<div class="container-fluid row">
				<div class="col-sm-2 col-md-2 col-3">
					<a class="navbar-brand" href="#"> <img class="icon_codo"
						src="assets/portada/codo_a_codo.png" title="TiendaBA">
					</a>
				</div>
				<div class="titulo col-sm-4 col-md-1 col-4">
					<h1>TecnoBA</h1>
				</div>
				<div class="button-toggle col-sm-1 col-md-1 col-1 text-start">
					<button class="navbar-toggler justify-content-end" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
				<div class="col-sm-1 col-md-1 col-1 ms-2 text-end">
				<form action="carrito.jsp" method="post">
				<input type="hidden" name="id" value="<% out.print(id); %>"/>
					<button type="submit" id="disabled" style="background-color: transparent;border: none;"> <i id="carrito"
						class="fa-solid fa-cart-shopping fa-xl" style="color: #e4dc07; background-color: black;"></i>
						<span id="cuenta-carrito"
						class="position-absolute top-25 start-75 translate-middle badge rounded-pill bg-danger count-product">0</span>
					</button>
				</form>
				</div>
				<input id="stock" type="hidden" value="<% out.print(usuario); %>" />
				<div class="collapse navbar-collapse col-sm-1 col-md-7 col-2 justify-content-end"
					id="navbarNav">
					<ul class="navbar-nav d-flex justify-content-center align-items-center">
						<li class="nav-item"><img title="<% out.print(usuario); %>"
							src="<% out.print(foto); %>"
							class="rounded-circle me-2 foto-perfil"></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#nproductos">Productos</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#novedades">Novedades</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#contacto">Contacto</a></li>
						<li class="nav-item me-2"><a
							class="nav-link active btn btn-light text-black"
							style="width: 80px" aria-current="page" href="index.jsp">Logout</a>
						</li>
						<li id="usuario" class="nav-item me-2 my-2"><a
							class="nav-link active btn btn-danger" style="width: 80px;"
							aria-current="page" href="stock.jsp">Control</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<main>
		<!-- Carrousel de productos -->
		<section>
			<div id="carouselExampleCaptions" class="carousel slide">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="assets/portada/laptops_portada.jpeg"
							class="d-block w-100 rounded" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Notebooks</h5>
							<p>Envío gratis en productos seleccionados</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="assets/portada/celulares_portada.jpg"
							class="d-block w-100 rounded" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Celulares</h5>
							<p>Comprá con la mejor financiación y en cuotas</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="assets/portada/smart_portada.jpeg"
							class="d-block w-100 rounded" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>Smart tv</h5>
							<p>Dimensión y Tecnología sin límites</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
		
		<!--Nuestros productos-->
		<section class="text-center" id="nproductos">
			<div class="container-products" id="container-products">
				<div class="cart-products mb-4" id="products-id">
					<h1 class="text-center">Mi carrito</h1>



					<form id="form" name="form" method="post" action=actualizarStock>
					<input type="hidden" name="id" value="<% out.print(id); %>"/>
					<div class="card-items row">
		
					</div>
					</form>
					
					
					
					<div class="d-flex justify-content-center align-items-center my-3">
						<h2 class="mx-2">
							Total: $<strong class="price-total">0</strong>
						</h2>
						<button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#exampleModal">Ir
							a pagar</button>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true"
							data-bs-backdrop="static" data-bs-keyboard="false">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content modal-carrito" id="comprado">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">TecnoBA</h1>
									</div>
									<div class="modal-body modal-descuentos">
										<div class="div-descuentos">
											<div class="descuentos" onclick="descuentos('0.10')">
												<img class="img-descuentos"
													src="assets/comprar/bancociudad.png" alt="">
												<p>Descuento del 10%</p>
											</div>
											<div class="descuentos" onclick="descuentos('0.15')">
												<img class="img-descuentos"
													src="assets/comprar/bancogalicia.png" alt="">
												<p>Descuento del 15%</p>
											</div>
											<div class="descuentos" onclick="descuentos('0.21')">
												<img class="img-descuentos"
													src="assets/comprar/bancoprovincia.png" alt="">
												<p>Descuento del 21%</p>
											</div>
										</div>
										<div class="div-precios">
											<h3 class="m-2">
												Subtotal: $<strong id="price-descuentos">0</strong>
											</h3>
											<div>
												<select class="form-select" id="seleccion" name="seleccion"
													onclick="precioFinal()" onchange="precioFinal()">
													<option value="" selected>Selecciona tu banco</option>
													<option value="0.10">Banco Ciudad</option>
													<option value="0.15">Banco Galicia</option>
													<option value="0.21">Banco Provincia</option>
												</select> <img class="envios-gratis my-4"
													src="assets/productos/descarga.jpeg" alt="">
												<h2 class="mx-2">
													Precio Total: $<strong id="price-final">0</strong>
												</h2>
											</div>
										</div>
									</div>
									<div class="modal-footer">


										<button type="button" class="btn btn-primary"
											data-bs-dismiss="modal" onclick="volver()">Volver</button>

										<button class="btn btn-primary" data-bs-dismiss="modal"
											name="btn" onclick="comprar()">Finalizar compra</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="container-fluid text-center productos my-3" id="products">

				<h1 class="my-4 me-3">Nuestros Productos</h1>
				



				<div class="row">

					<%
					ArticulosDAO dao = new ArticulosDAO();
					ArrayList<Articulos> lista = dao.listarArticulo();
					for (Articulos e : lista) {
					%>
					
					<div class="col-xl-2 col-sm-3">
						<div class="card" id="card">
							<div class="card-body position-relative">
								<img src="<%=e.getImagen()%>" class="card-img-top img-productos"
									alt="">
								<h5 class="card-title title texto-producto"><%=e.getDescripcion()%></h5>
								<p class="precio text-center precio-producto">
									$<span class="valor"><%=e.getPrecio()%></span>
								</p>
								<a href="#" class="btn btn-dark btn-add-cart boton-producto "
									data-id="<%=e.getIdProducto()%>">Añadir al carrito</a> <input
									type="hidden" class="form-control stockActual"
									value="<%=e.getCantidad()%>">

							</div>
						</div>
					</div>
					
					<%
					}
					%>

				</div>
			</div>

			<!-- Carrousel para productos-celular -->

			<div class="container text-center my-3 productos_cel"
				id="products_cel">
				<h1 class="t-productos">Nuestros Productos</h1>
				<div id="carouselExampleControls2" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner position-relative">

						<%
						ArticulosDAO dao1 = new ArticulosDAO();
						ArrayList<Articulos> lista1 = dao1.listarArticulo();
						for (Articulos e : lista) {
						%>

						<div class="carousel-item" id="carrousel-cel">
							<div class="card" id="card">
								<div class="card-body position-relative">
									<img src="<%=e.getImagen()%>" class="card-img-top"
										id="card-img-top" alt="">
									<h5 class="card-title title texto-producto"><%=e.getDescripcion()%></h5>
									<p class="precio text-center precio-producto">
										$<span class="valor"><%=e.getPrecio()%></span>
									</p>
									<a href="#"
										class="btn btn-dark small btn-add-cart boton-producto"
										data-id="<%=e.getIdProducto()%>">Añadir al carrito</a> <input
										type="hidden" class="form-control stockActual"
										value="<%=e.getCantidad()%>">
								</div>
							</div>
						</div>
						
						<%
						}
						%>

					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
						<span
							class="carousel-control-prev-icon bg-secondary rounded-circle position-absolute top-50 start-0 translate-middle-y"
							aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls2" data-bs-slide="next">
						<span
							class="carousel-control-next-icon bg-secondary rounded-circle position-absolute top-50 end-0 translate-middle-y"
							aria-hidden="true"></span> <span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</section>

		<!--    Productos destacados-->

		<section class="novedades text-center" id="novedades">
			<div>
				<h1 class="t-destacados" data-aos="zoom-in">Productos
					destacados</h1>
			</div>
			<div class="d-destacados">

				<div class="card shadow p-3 mb-3 rounded destacados"
					data-aos="fade-right">
					<img src="assets/destacados/iphone14_card.jpg" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">IPHONE 14 PRO MAX</h5>
						<p class="card-text">Lo último en tecnología Apple. Pantalla
							Super Retina XDR. Hasta 29 horas de reproducción de video y
							muchas más utilidades.</p>
						<a href="https://www.mercadolibre.com.ar/apple-iphone-14-pro-max-128-gb-morado-oscuro/p/MLA19615329?pdp_filters=category:MLA1055#searchVariation=MLA19615329&position=3&search_layout=stack&type=product&tracking_id=afb74a24-a240-4ab0-b439-e25101cd5653"
							class="btn btn-primary" target="_blank">Comprar</a>
					</div>
				</div>
				<div class="card shadow p-3 mb-3 rounded destacados"
					data-aos="fade-right">
					<img src="assets/destacados/notebook_card.webp"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">NOTEBOOK BOOK 3</h5>
						<p class="card-text">Galaxy Book 3 llega con el hardware más
							poderoso, y tiene la mejor integración con el resto del
							ecosistema de la marca.</p>
						<a href="https://www.mercadolibre.com.ar/samsung-galaxy-np750-book3-156-i7-16gb-512gb-color-silver/p/MLA24848182?from=gshop&matt_tool=74941839&matt_word=&matt_source=google&matt_campaign_id=14508409409&matt_ad_group_id=146243344318&matt_match_type=&matt_network=g&matt_device=c&matt_creative=645525118232&matt_keyword=&matt_ad_position=&matt_ad_type=pla&matt_merchant_id=710835605&matt_product_id=MLA24848182-product&matt_product_partition_id=1994760955087&matt_target_id=aud-1930507555160:pla-1994760955087&gclid=CjwKCAjwsKqoBhBPEiwALrrqiE8VdCYA-X7JraAktg0jx4v2W3bk44rKw2uaOkj1PzTVf9djY6auMxoCtL8QAvD_BwE"
							class="btn btn-primary" target="_blank">Comprar</a>
					</div>
				</div>
				<div class="card shadow p-3 mb-3 rounded destacados"
					data-aos="fade-right">
					<img src="assets/destacados/monitor_card.webp" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">MONITOR GAMING</h5>
						<p class="card-text">Es un monitor de 55" con un panel curvo.
							Resolución 4K, refresco de 165 Hz y se puede configurar en
							vertical u horizontal.</p>
						<a href="https://www.mercadolibre.com.ar/monitor-gaming-55-odyssey-ark-con-curvatura-1000r-color-negro/p/MLA22804075?from=gshop&matt_tool=12492076&matt_word=&matt_source=google&matt_campaign_id=19580718235&matt_ad_group_id=149208093590&matt_match_type=&matt_network=g&matt_device=c&matt_creative=645605900839&matt_keyword=&matt_ad_position=&matt_ad_type=pla&matt_merchant_id=710835605&matt_product_id=MLA22804075-product&matt_product_partition_id=2185784341366&matt_target_id=aud-1930507555160:pla-2185784341366&gclid=CjwKCAjwsKqoBhBPEiwALrrqiHA1C6zhHOG03mLsCkSv2xEaZFxkufWIqGyvslS8WcrSB4qIfE3AHBoCc_QQAvD_BwE"
							class="btn btn-primary" target="_blank">Comprar</a>
					</div>
				</div>
			</div>
		</section>

		<!--  suscripcion, novedades -->
		<section class="suscripcion " id="contacto">
			<h1>¡Enterate de todas las novedades!</h1>

			<form action="" method="post" class="my-3 needs-validation was-validated" novalidate>
				<div class="mb-2">
					<label for="InputName" class="form-label">Nombre</label> 
					<input type="text" class="form-control" id="InputName"
						placeholder="Ingresa tu Nombre" required>
					<div class="invalid-feedback">Complete su nombre.</div>
				</div>

				<div class="mb-2">
					<label for="InputEmail" class="form-label">Email</label> 
					<input type="email" class="form-control" id="InputEmail"
						placeholder="Ingresa tu Email" required>
					<div class="invalid-feedback">Complete su email correctamente.</div>
				</div>

				<p class="mb-1">¿Como nos conociste?</p>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio1" value="option1"
						required><label class="form-check-label"
						for="inlineRadio1">Por redes</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio2" value="option2"
						required> <label class="form-check-label"
						for="inlineRadio2">Por contactos</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="inlineRadioOptions" id="inlineRadio2" value="option3"
						required> <label class="form-check-label"
						for="inlineRadio2">Por la web</label>
					<div class="invalid-feedback">Elija una opción</div>
				</div>
				<div>
					<button type="submit" class="btn btn-success my-2" id="enviar">Suscribirse</button>
				</div>
			</form>
		</section>
	</main>
	<footer class="bg-dark-subtle mt-5">
		<div class="container-fluid text-center footer">
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
							data-bs-target="#exampleModal1">Iguazú 333, Parque Patricios
						</a>
					</div>
					<div>
						<a href="">contacto@tecnoba.com.ar</a>
					</div>
					<div class="modal fade" id="exampleModal1" tabindex="-1"
						aria-labelledby="exampleModalLabel1" aria-hidden="true">
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
						class="fa-brands fa-facebook fa-xl" style="color: #000000;"></i></a> 
						<a href="https://www.instagram.com/" target="_blank"><i
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
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
        AOS.init();
    </script>



	<script src="js/js.js"></script>
	<script src="js/validation.js"></script>


</body>
</html>