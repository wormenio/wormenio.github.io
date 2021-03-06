package modelo.Entidades;

import modelo.CategorizacionEntidad.CategoriaEntidad;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value="Base")
public class EntidadBase extends Entidad {

	private String descripcion;


	public EntidadBase(String nombreFicticio,String descripcion, CategoriaEntidad categoriaEntidad){
		this.descripcion = descripcion;
		super.setCategoriaEntidad(categoriaEntidad);
		super.setNombreFicticio(nombreFicticio);
	}

	public EntidadBase() {

	}


	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Boolean esEntidadBase(){
		return true;
	}
	public Boolean esEntidadJuridica(){
		return false;
	}


	/*

	public void setCategoriaEntidad(CategoriaEntidad categoria) {
		this.categoriaEntidad = categoria;
	}





	public Integer getMontoMaximoEgreso(){
		return montoMaximoEgreso;
	}

	public String getTipoEntidad(){
		return tipoEntidad;
	}

	@Override
	public Boolean esEntidadBase() {
		return true;
	}

	@Override
	public Boolean esEntidadJuridica() {
		return false;
	}

	public void setEntidadJuridica(EntidadJuridica entidadJuridica) {
		this.entidadJuridica = entidadJuridica;
	}

	public Boolean tieneEntidadJuridica(){
		return this.entidadJuridica == null;
	}

	public Organizacion getOrganizacion(){
		return organizacion;
	}
*/

	/*
        static final String tipoEntidad = "BASE";
        String descripcion;
        String nombreFicticio;
        CategoriaEntidad categoriaEntidad;
        Integer montoMaximoEgreso;
        EntidadJuridica entidadJuridica;
        Organizacion organizacion;


    */

		/*@Override
	public void categorizarEntidad(Integer codigoCategoria, ReglasDeNegocio reglasDeNegocio) {
		categoriaEntidad = new CategoriaEntidad(codigoCategoria,reglasDeNegocio);
	}*/
/*
	@Override
	public void setCategoriaEntidadJuridica(CategoriaEntidadJuridica categoria) {
		throw new EntidadException("Una Entidad Base no puede tener Categorizacion de Entidad juridica");
	}*/
}
