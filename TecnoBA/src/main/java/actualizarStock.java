
import Utilidades.ConexionDB;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class actualizarStock
 */
public class actualizarStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actualizarStock() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
	
		
		String id_usuario= request.getParameter("id");
		String id_compra[]= request.getParameterValues("cod");
		String stock[]= request.getParameterValues("txtStock");
		
		for(int i=0; i<id_compra.length; i++) {
			//System.out.println("el id:" + id[i] + " stock: " + stock[i]);
			
		
			try {

				Connection cnx = ConexionDB.getConexion();
				PreparedStatement psta = cnx
						.prepareStatement("UPDATE productos SET cantidad =? where productos_id =?");
				
				psta.setString(1, stock[i] );
				psta.setString(2, id_compra[i]);

				psta.executeUpdate();

				psta.close();
				cnx.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		
//		Connection cnx = ConexionDB.getConexion();
//		PreparedStatement psta = cnx
//				.prepareStatement("UPDATE productos SET cantidad='" + stock[i] + "' where productos_id ='" + id[i] + "'");
//		ResultSet rs = psta.executeQuery();
//		if (rs.next()) {
//			response.sendRedirect("stock.jsp");
//			
//		} else {
//			//out.println("Usuario o contrase�a incorrecta!!!");
//			response.sendRedirect("login.jsp?mensaje=Datos%20incorrectos,%20vuelva%20a%20ingresarlos!");
//		}
//			
//		}
		
	}
		response.sendRedirect("tecnoba.jsp?id="+id_usuario);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
