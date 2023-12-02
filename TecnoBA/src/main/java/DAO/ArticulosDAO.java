/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import Entidad.Articulos;
import Utilidades.ConexionDB;

/**
 * 
 * @author _mrodriguezb
 */
public class ArticulosDAO {

	public void eliminar(Articulos articulo) {

		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx.prepareStatement("delete from productos where productos_id=?");
			psta.setInt(1, articulo.getIdProducto());
			psta.executeUpdate();
			psta.close();
			cnx.close();

		} catch (Exception e) {
		}

	}

	public void actualizar(Articulos articulo) {

		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("UPDATE productos SET descripcion =?,precio =?,cantidad =?, imagen=? where productos_id =?");
			
			psta.setString(1, articulo.getDescripcion());
			psta.setDouble(2, articulo.getPrecio());
			psta.setInt(3, articulo.getCantidad());
		    psta.setString(4, articulo.getImagen());
			psta.setInt(5, articulo.getIdProducto());
			
			
			psta.executeUpdate();

			psta.close();
			cnx.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}
	
	public void actualizarStock(Articulos articulo) {

		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("UPDATE productos SET cantidad =? where productos_id =?");
			
			psta.setInt(1, articulo.getCantidad());
			psta.setInt(2, articulo.getIdProducto());

			psta.executeUpdate();

			psta.close();
			cnx.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}
	
	
	
	

	public void insertar(Articulos articulo) {

		try {
			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("INSERT INTO productos (productos_id,descripcion,precio,cantidad,imagen) VALUES (?,?,?,?,?)");
			psta.setInt(1, articulo.getIdProducto());
			psta.setString(2, articulo.getDescripcion());
			psta.setDouble(3, articulo.getPrecio());
			psta.setInt(4, articulo.getCantidad());
			psta.setString(5, articulo.getImagen());
		
			psta.executeUpdate();

			psta.close();
			cnx.close();
		} catch (Exception e) {
		}

	}

	
	public ArrayList<Articulos> listarArticulo() {

		ArrayList<Articulos> lista = new ArrayList<Articulos>();
		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("select * from productos");
			ResultSet rs = psta.executeQuery();
			while (rs.next()) {
				Articulos em = new Articulos(rs.getInt(1), rs.getString(2),
						rs.getInt(3), rs.getInt(4), rs.getString(5));
				lista.add(em);
			}

			psta.close();
			cnx.close();
		} catch (Exception e) {

			System.out.println("" + e.toString());
		}

		return lista;
	}
	
	
	public Articulos buscarArticulo(int codigo) {

		Articulos bean = null;
		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("select * from productos where productos_id='"+ codigo + "'");
			ResultSet rs = psta.executeQuery();
			while (rs.next()) {
				bean = new Articulos(rs.getInt(1), rs.getString(2),
						rs.getInt(3), rs.getInt(4), rs.getString(5));
			}
			rs.close();
			psta.close();
			cnx.close();
		} catch (Exception e) {

			System.out.println("" + e.toString());
		}

		return bean;
	}
	

}
