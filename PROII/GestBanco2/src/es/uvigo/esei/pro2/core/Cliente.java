/*
 * Definicion de la clase Cliente
 */
package es.uvigo.esei.pro2.core;
import Exceptions.*;
import java.util.ArrayList;
import nu.xom.Element;
import nu.xom.Elements;
import nu.xom.ParsingException;
public class Cliente {

    private String dni;             // D.N.I. del cliente
    private String nombre;          // Nombre del cliente
    private String domicilio;       // Domicilio del cliente
    private ArrayList<Cuenta>cuentas;     // Cuentas bancarias del cliente

    public final static String etiCliente = "cliente";
    public final static String etiDni = "dni";
    public final static String etiNombre = "nombre";
    public final static String etiDomicilio = "domicilio";
    public final static String etiCuentas = "cuentas";
    
    
    
    
    
    /**
     * Crea un nuevo cliente, con sus datos: nombre, domicilio, año y las
     * cuentas que tiene.
     *
     * @param dni D.N.I. del cliente
     * @param nombre nombre completo del cliente
     * @param domicilio el domicilio del cliente
     * @param cuentas array con las cuentas que tiene el cliente
     */
    public Cliente(String dni, String nombre, String domicilio,
            ArrayList<Cuenta> cuentas) {
        this.dni = dni;
        this.nombre = nombre;
        this.domicilio = domicilio;
        this.cuentas = cuentas;
    }

    public Cliente(Element eCliente) throws ParsingException{
        
        Element eDni = eCliente.getFirstChildElement(etiDni);
        Element eNombre = eCliente.getFirstChildElement(etiNombre);
        Element eDomicilio = eCliente.getFirstChildElement(etiDomicilio);
        Element eCuentas = eCliente.getFirstChildElement(etiCuentas);
        if(eDni == null){
            throw new ParsingException("No se encontró el DNI");
        }
        if(eNombre == null){
            throw new ParsingException("No se encontró el nombre");
        }
        if(eDomicilio == null){
            throw new ParsingException("No se encontró el domicilio");
        }
        if(eCuentas == null){
            throw new ParsingException("No se encontraron las cuentas");
        }
        
        this.dni = eDni.getValue();
        this.nombre = eNombre.getValue();
        this.domicilio = eDomicilio.getValue();
        
        Elements listaCuentas = eCuentas.getChildElements();
        
        this.cuentas = new ArrayList<Cuenta>(listaCuentas.size());
        
        for(Element eCuenta: listaCuentas){
            if(eCuenta.getLocalName().equals(Ahorro.etiAhorro)){
                this.cuentas.add(new Ahorro(eCuenta));
            }else if(eCuenta.getLocalName().equals(Corriente.etiCorriente)){
                this.cuentas.add(new Corriente(eCuenta));
            }
            
        }

        
    }
    
    
    
    
    
    
    /**
     * Devuelve el D.N.I. del cliente
     *
     * @return el dni del cliente, como String.
     */
    public String getDni() {
        return dni;
    }

    /**
     * Cambia el D.N.I. del cliente
     *
     * @param d el dni del cliente
     */
    public void setDni(String d) {
        dni = d;
    }

    /**
     * Devuelve el nombre del cliente
     *
     * @return El valor como cadena
     *
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Cambia el nombre del cliente
     *
     * @param nombre El nuevo valor, como cadena
     */
    public void setNombre(String nombre) {
        this.nombre = nombre.trim();
    }

    /**
     * Devuelve el domicilio del cliente
     *
     * @return El valor como cadena
     *
     */
    public String getDomicilio() {
        return domicilio;
    }

    /**
     * Cambia el domicilio del cliente
     *
     * @param domicilio El nuevo valor, como cadena
     */
    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio.trim();
    }

    /**
     * Añade una nueva cuenta al listado de cuentas del cliente
     *
     * @param cuenta la nueva Cuenta
     */
    public void nuevaCuenta(Cuenta cuenta) {
        cuentas.add(cuenta);      
    }

    /**
     * Devuelve el número de cuentas del cliente
     *
     * @return el número de cuentas del cliente
     */
    public int getNumCuentas() {
        return this.cuentas.size();
    }

    /**
     * Devuelve el objeto de tipo Cuenta que se encuentra en la posición
     * especificada (empezando en 0)
     *
     * @param cuenta el índice de la cuenta (empezando en 0)
     * @return la Cuenta que se encuentra en la posición especificada
     */
    public Cuenta getCuenta(int cuenta) throws PosicionInvalidaException
    {
        if ((cuenta < 0) || (cuenta >= getNumCuentas())) {           
            throw new PosicionInvalidaException ("La posicion indicada no es valida.");
        }

        return this.cuentas.get(cuenta);
    }

    /**
     * Elimina la Cuenta de la posición especificada (empezando en 0)
     *
     * @param pos el índice de la cuenta que se quiere eliminar (empezando en 0)
     */
    public void eliminaCuenta(int pos) throws UltimaCuentaException{
        if (getNumCuentas() == 1) {
            throw new UltimaCuentaException("El cliente debe tener como minimo una cuenta");
        } else {
            cuentas.remove(pos);   
        }
    }
    
    
    public Element toDOM(){
        Element eCliente = new Element(etiCliente);
        Element eDni = new Element(etiDni);
        Element eDomicilio = new Element(etiDomicilio);
        Element eNombre = new Element(etiNombre);
        Element eCuentas = new Element(etiCuentas);
        
        eDni.appendChild(getDni());
        eDomicilio.appendChild(getDomicilio());
        eNombre.appendChild(getNombre());
        
        for(Cuenta c : this.cuentas){
            eCuentas.appendChild(c.toDOM());
        }
        
        eCliente.appendChild(eDni);
        eCliente.appendChild(eDomicilio);
        eCliente.appendChild(eNombre);
        eCliente.appendChild(eCuentas);
        
        
        return eCliente;
    }
    
    
    
    /**
     * Devuelve los datos del Cliente
     *
     * @return los datos del cliente, como cadena
     */
    @Override
    public String toString() {
        StringBuilder toret = new StringBuilder();

        toret.append("Cliente ").append(getNombre());
        toret.append(" con DNI ").append(getDni());
        toret.append(" y domicilio en ").append(getDomicilio());
        toret.append(". \n\n \tDatos de sus cuentas:  ");

        for (Cuenta cuenta : this.cuentas) {
            toret.append("\n\t\t").append(cuenta.toString());
        }

        return toret.toString();
    }

}
