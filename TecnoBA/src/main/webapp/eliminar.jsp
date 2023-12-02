
<%@page import="Entidad.Articulos"%>
<%@page import="DAO.ArticulosDAO"%>


<%
ArticulosDAO obj = new ArticulosDAO();
Articulos beanArticulo = new Articulos();
//String cod = request.getParameter("cod");
int uno = Integer.parseInt(request.getParameter("cod"));
beanArticulo.setIdProducto(uno);
obj.eliminar(beanArticulo);
request.getRequestDispatcher("stock.jsp").forward(request, response);
%>



