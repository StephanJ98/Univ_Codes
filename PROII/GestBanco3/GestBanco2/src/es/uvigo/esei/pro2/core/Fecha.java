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
public class Fecha {
    
    private int dia;
    private int mes;
    private int anho;

    public static final String etiDia = "dia";
    public static final String etiMes = "mes";
    public static final String etiAnho = "anho";
    public static final String etiFecha = "fecha";
    
    public Fecha(int dia, int mes, int anho) {
        this.dia = dia;
        this.mes = mes;
        this.anho = anho;
    }

    public Fecha(Element eFecha) throws ParsingException{
        
        Element eDia = eFecha.getFirstChildElement(etiDia);
        Element eMes = eFecha.getFirstChildElement(etiMes);
        Element eAnho = eFecha.getFirstChildElement(etiAnho);
        
        if(eDia == null){
            throw new ParsingException("No se encontró el día");
        }
        if(eMes == null){
            throw new ParsingException("No se encontró el mes");
        }
        if(eAnho == null){
            throw new ParsingException("No se encontró el año");
        }
        
        this.dia = Integer.parseInt(eDia.getValue());
        this.mes = Integer.parseInt(eMes.getValue());
        this.anho = Integer.parseInt(eAnho.getValue());
        
    }
    
    
    
    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnho() {
        return anho;
    }

    public void setAnho(int anho) {
        this.anho = anho;
    }

    public Element toDOM(){
        Element eFecha = new Element(etiFecha);
        Element eDia = new Element(etiDia);
        Element eMes = new Element(etiMes);
        Element eAnho = new Element(etiAnho);
        
        eDia.appendChild(String.valueOf(getDia()));
        eMes.appendChild(String.valueOf(getMes()));
        eAnho.appendChild(String.valueOf(getAnho()));
        
        eFecha.appendChild(eDia);
        eFecha.appendChild(eMes);
        eFecha.appendChild(eAnho);
        
        return eFecha;
    }
    
    
    
    
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(dia).append("/").append(mes).append("/").append(anho);
        
        return sb.toString();
        }
    
}
