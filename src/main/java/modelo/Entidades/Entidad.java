package modelo.Entidades;

import modelo.CategorizacionEntidad.CategoriaEntidad;
import modelo.Organizacion;

import javax.persistence.*;

@Entity
@Table(name = "Entidades")
@DiscriminatorColumn(name="tipo_entidad")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class Entidad {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "categoria_entidad_id")
	private CategoriaEntidad categoriaEntidad;

	@Column(name = "monto_maximo_egreso")
	private Double MontoMaximoEgreso;

	@Column(name = "nombre_ficticio")
	private String nombreFicticio;

	@Transient
	Organizacion organizacion = new Organizacion();

	public Long getId() {
		return id;
	}

	public String getNombreFicticio(){
		return nombreFicticio;
	}

	public void setNombreFicticio(String nombreFicticio) {
		this.nombreFicticio = nombreFicticio;
	}

	public void setMontoMaximoEgreso(Double montoMaximoEgreso) {
		MontoMaximoEgreso = montoMaximoEgreso;
	}
	public Double getMontoMaximoEgreso() {
		return MontoMaximoEgreso;
	}

	public Organizacion getOrganizacion(){
		return organizacion;
	}

	public void setCategoriaEntidad(CategoriaEntidad categoriaEntidad){
		this.categoriaEntidad = categoriaEntidad;
	}

	public CategoriaEntidad getCategoriaEntidad() {
		return categoriaEntidad;
	}

	public void validarReglasDeNegocioDelEgreso(){
		categoriaEntidad.validarReglasDeNegocioDelEgreso(this, null);
	}

	public void validarReglasDeNegocioDeEntidad(Entidad entidadDestino){
		categoriaEntidad.validarReglasDeNegocioDeLaEntidad(this, entidadDestino);
	}

	public void validarReglasDeNegocio(){
//		return categoriaEntidad.aplicarReglasDeNegocio();
	}

	public abstract Boolean esEntidadBase();
	public abstract Boolean esEntidadJuridica();

}
