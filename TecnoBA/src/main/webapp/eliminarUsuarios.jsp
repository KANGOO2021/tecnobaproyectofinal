
<%@page import="Entidad.Usuarios"%>
<%@page import="DAO.UsuariosDAO"%>

<%
UsuariosDAO obj = new UsuariosDAO();
Usuarios beanUsuario = new Usuarios();
//String cod = request.getParameter("cod");
int uno = Integer.parseInt(request.getParameter("cod"));
beanUsuario.setidUsuario(uno);
obj.eliminar(beanUsuario);
request.getRequestDispatcher("usuarios.jsp").forward(request, response);
%>



