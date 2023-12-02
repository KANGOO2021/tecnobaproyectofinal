<%@page import="Entidad.Articulos,DAO.ArticulosDAO,java.util.ArrayList, Utilidades.ConexionDB, java.sql.*"%>

<%
//conectarme a la db
//validar que el user y pass existan
// dar mensaje ok o error

String user = request.getParameter("user");
String pass = request.getParameter("pass");

//out.println(user);
//out.println(pass);

Connection cnx = ConexionDB.getConexion();
PreparedStatement psta = cnx
		.prepareStatement("SELECT * FROM usuarios WHERE user='" + user + "' AND pass='" + pass + "'");
ResultSet rs = psta.executeQuery();
if (rs.next()) {
	//response.sendRedirect("stock.jsp");
	if (user.equals("admin") && pass.equals("admin")) {
		response.sendRedirect("stock.jsp");
	} else {
		int id = rs.getInt("usuarios_id");
		response.sendRedirect("tecnoba.jsp?id=" + id);

	}
} else {
	//out.println("Usuario o contrase�a incorrecta!!!");
	response.sendRedirect("login.jsp?mensaje=Datos%20incorrectos,%20vuelva%20a%20ingresarlos!");
}
%>