/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pkgDbManager;

import java.sql.Connection;

/**
 *
 * @author rubeus
 */
public class CategorieDB extends ManagerDB{
    Connection connexion;
    
    public CategorieDB(){
        connexion = super.connection();
    }
}
