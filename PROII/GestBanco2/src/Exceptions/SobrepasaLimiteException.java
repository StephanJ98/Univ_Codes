/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exceptions;

/**
 *
 * @author usuario
 */
public class SobrepasaLimiteException extends BancoException{
    public SobrepasaLimiteException(String msg){
        super(msg);
    }
}
