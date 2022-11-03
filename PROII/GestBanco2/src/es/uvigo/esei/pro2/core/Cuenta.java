/*
 *  Definición de la clase Cuenta
 *  En un banco tendremos una serie de clientes con sus cuentas bancarias
 */
package es.uvigo.esei.pro2.core;

import nu.xom.Element;
import nu.xom.ParsingException;

public abstract class Cuenta {

//    public static enum TipoCuenta {
//        AHORRO, CORRIENTE
//    };

    private String numCuenta;   // Numero de cuenta 
    private Fecha fechaApertura;
//    private int anhoApertura;   // Año de apertura de la cuenta
//    private TipoCuenta tipo;    // Tipo de cuenta

    public final static String etiCuenta = "cuenta";
    public final static String etiNumCuenta = "numeroCuenta";
    public final static String etiFechaApertura = "fechaApertura";
    
    

    /**
     * Crea una nueva cuenta del cliente, con sus datos: numero de cuenta, año
     * de apertura y tipo de cuenta (ahorro o corriente)
     *
     * @param numCuenta número de cuenta del cliente
     * @param anhoApertura el año de apertura de la cuenta del cliente
     * @param tipo el tipo de cuenta (ahorro, corriente)
     */
    public Cuenta(String numCuenta, Fecha fechaApertura) {

        this.numCuenta = numCuenta;
        this.fechaApertura = fechaApertura;
    }

    public Cuenta(Element eCuenta) throws ParsingException{
        
        Element eNumCuenta = eCuenta.getFirstChildElement(etiNumCuenta);
        Element eFechaApertura = eCuenta.getFirstChildElement(etiFechaApertura);
        
        if(eNumCuenta == null){
            throw new ParsingException("No se halló numero de cuenta");
        }
        if(eFechaApertura == null){
            throw new ParsingException("No se halló fecha de apertura");
        }
        
        this.numCuenta = eNumCuenta.getValue();
        this.fechaApertura = new Fecha(eFechaApertura);
        
    }
    
    
    
    
    /**
     * Devuelve el número de cuenta del cliente
     *
     * @return el numCuenta del cliente, como String.
     */
    public String getNumCuenta() {
        return numCuenta;
    }

    /**
     * Cambia el número de cuenta del cliente
     *
     * @param nCuenta el numCuenta del cliente
     */
    public void setNumCuenta(String nCuenta) {
        numCuenta = nCuenta;
    }

    public Fecha getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(Fecha fechaApertura) {
        this.fechaApertura = fechaApertura;
    }


    public Element toDOM(){
       Element eCuenta = new Element(etiCuenta);
       Element eNumCuenta = new Element(etiNumCuenta);
       Element eFechaApertura = getFechaApertura().toDOM();
       eFechaApertura.setLocalName(etiFechaApertura);
       
       eNumCuenta.appendChild(String.valueOf(getNumCuenta()));

       eCuenta.appendChild(eNumCuenta);
       eCuenta.appendChild(eFechaApertura);
       
       
       return eCuenta;
    }
    
    
    
    
    
    
    

    @Override
    public String toString() {
        StringBuilder toret = new StringBuilder();

        toret.append("Cuenta numero: ").append(numCuenta);
        toret.append("\n\t\t\tAnho de apertura: ").append(fechaApertura.toString());

        return toret.toString();
    }

}
