<%-- 
    Document   : PanierControleur
    Created on : 20 mars 2014, 16:51:59
    Author     : 
--%>

<%@page import="pkgFormManager.Panier"%>
<%@page import="pkgEntities.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panier</title>
        <meta charset="utf-8">
        <link rel="stylesheet" media="screen" href="/ECommerce/css/header.css" type="text/css" />
        <link rel="stylesheet" media="screen" href="/ECommerce/css/cart.css" type="text/css" />
    </head>
    <body>
        <header>
            <div id="header">
                <ul>
                    <li><a href="/ECommerce/Categorie/IndiePop">Indie-Pop</a></li>
                    <li><a href="/ECommerce/Categorie/PopRock">Pop-Rock</a></li>
                    <li><a href="/ECommerce/Categorie/PunkRock">Punk-Rock</a></li>
                    <li><a href="/ECommerce/Categorie/Alternatif">Alternatif</a></li>
                </ul>
                <div id="logo"><a href="IndexControleur">
                    <img src="/ECommerce/icon/logo.png" alt="logo">
                    <h1>WonderSHOP</h1>
                </a></div>
            </div>
            <div id="cart"><a href="PanierControleur">
                <div id="shop">
                    <img src="/ECommerce/icon/cart.png" alt="cart">
                    <span>
                        <%
                        Panier panier = (Panier) session.getAttribute("panier");
                        out.println( "("+ panier.getEffectif() +")" );
                        %>
                    </span>
                </div>
            </a></div>
            
        </header>

        <section>
            <ul>         
                <%
                if(panier!=null) {
                    String html = "";
                    for(Article article : panier.getMap().keySet()) {
                        html+="<li>";
                        html+="     <img src=\"img/magicman.jpg\" alt=\"article\"/>";
                        html+="     <form acion=\"PanierControleur\" method=\"post\">";
                        html+="         <p>"+article.getNom()+" ("+panier.getMap().get(article)+") </p>";
                        html+="         <input type=\"hidden\" name=\"article\" value=\""+article.getNom()+"\"/>";
                        html+="         <input type=\"submit\" name=\"action\" value=\"Supprimer\" />";
                        html+="         <input type=\"submit\" name=\"action\" value=\"Ajouter\" />";
                        html+="     </form>";
                        html+="     <div>";
                        html+="     <p>"+article.getPrix()+"€</p>";
                        html+="     </div>";
                        html+="</li>";
                    }

                    out.println(html);
                }
                else out.println("Panier NULL");
                %>
            </ul>
            <p id="total"><%= panier.getPrix() %>€</p>
            <div id="buy"><a href="ConnexionControleur">
                <img src="/ECommerce/icon/buy.png" alt="buy"/>
                <p>Valider mon panier</p>
            </a></div>
        </section>    
    </body>
</html>
