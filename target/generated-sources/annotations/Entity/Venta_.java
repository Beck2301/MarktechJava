package Entity;

import Entity.Cliente;
import Entity.DetalleTarjeta;
import Entity.Factura;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-11-24T11:43:23")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, String> fecha;
    public static volatile SingularAttribute<Venta, Cliente> cliente;
    public static volatile SingularAttribute<Venta, String> estado;
    public static volatile SingularAttribute<Venta, DetalleTarjeta> detalleTarjeta;
    public static volatile ListAttribute<Venta, Factura> lista_facturas;
    public static volatile SingularAttribute<Venta, Integer> idVenta;

}