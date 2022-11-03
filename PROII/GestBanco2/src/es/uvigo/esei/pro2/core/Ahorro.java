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
public class Ahorro extends Cuenta {
    private double interes;

    public final static String etiAhorro = "ahorro";
    public final static String etiInteres = "interes";
    
    
    public Ahorro(double interes, String numCuenta, Fecha fechaApertura) {
        super(numCuenta, fechaApertura);
        this.interes = interes;
    }
    
    public Ahorro(Element eAhorro) throws ParsingException{
        super(eAhorro);
        
        Element eInteres = eAhorro.getFirstChildElement(etiInteres);
        
        if(eInteres == null){
            throw new ParsingException("No se encontró el interés");
        }
        
        this.interes = Double.parseDouble(eInteres.getValue());
        
    }
 

    public double getInteres() {
        return interes;
    }

    public void setInteres(double interes) {
        this.interes = interes;
    }

    
    public Element toDOM(){
        Element eAhorro = super.toDOM();
        eAhorro.setLocalName(etiAhorro);
        Element eInteres = new Element(etiInteres);
        
        eInteres.appendChild(String.valueOf(getInteres()));

        eAhorro.appendChild(eInteres);

        return eAhorro;
    }
    
    
    
    
    
    
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("\n\t\t\tInterés: ").append(interes);
        return sb.toString();
    }
    
    
}
