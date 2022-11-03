/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uvigo.esei.pro2.core;

import nu.xom.Element;
import nu.xom.ParsingException;

/**
 *
 * @author usuario
 */
public class Corriente extends Cuenta {
    
    private String numeroTarjeta;
    private Fecha fechaCaducidad;
    
    public final static String etiNumeroTarjeta = "numeroTarjeta";
    public final static String etiFechaCaducidad = "fechaCaducidad";
    public final static String etiCorriente = "corriente";

    public Corriente(String numeroTarjeta, Fecha fechaCaducidad, String numCuenta, Fecha fechaApertura) {
        super(numCuenta, fechaApertura);
        this.numeroTarjeta = numeroTarjeta;
        this.fechaCaducidad = fechaCaducidad;
    }
    
    public Corriente(Element eCorriente) throws ParsingException{
        super(eCorriente);
        
        Element eNumeroTarjeta = eCorriente.getFirstChildElement(etiNumeroTarjeta);
        Element eFechaCaducidad = eCorriente.getFirstChildElement(etiFechaCaducidad);
        
        if(eNumeroTarjeta == null){
            throw new ParsingException("No se encontró número de tarjeta");
        }
        if(eFechaCaducidad == null){
            throw new ParsingException("No se encontró fecha de caducidad");
        }
        
        this.numeroTarjeta = eNumeroTarjeta.getValue();
        this.fechaCaducidad = new Fecha(eFechaCaducidad);
        
    }
    
    

    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public Fecha getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(Fecha fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    
    public Element toDOM(){
        
        Element eCuenta = super.toDOM();
        Element eNumeroTarjeta = new Element(etiNumeroTarjeta);
        Element eFechaCaducidad = getFechaCaducidad().toDOM();
        eCuenta.setLocalName(etiCorriente);
        eFechaCaducidad.setLocalName(etiFechaCaducidad);
        
        
        eNumeroTarjeta.appendChild((getNumeroTarjeta()));
        

        eCuenta.appendChild(eNumeroTarjeta);
        eCuenta.appendChild(eFechaCaducidad);
        
        
        return eCuenta;
    }
    
    
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        
        sb.append(super.toString());
        sb.append("\n\t\t\tNúmero de tarjeta: ").append(numeroTarjeta);
        sb.append("\n\t\t\tFecha Caducidad: ").append(fechaCaducidad.toString());
 
        return sb.toString();
    }


    
    
    
    
    
}
