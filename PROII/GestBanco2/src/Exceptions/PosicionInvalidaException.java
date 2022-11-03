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
public class PosicionInvalidaException extends BancoException{
    public PosicionInvalidaException(String msg){
        super(msg);
    }
}
