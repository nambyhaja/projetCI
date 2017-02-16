<% 
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
    httpResponse.setDateHeader("Expires", 0); // Proxies.
    if(session.getAttribute("utilisateur")!=null)
    {
        response.sendRedirect("accueil.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FreeZiks</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
        
        <link rel="shortcut icon" sizes="196x196" href="images/logo.png">

        <!-- style -->
        <link rel="stylesheet" href="css/animate.css/animate.min.css" type="text/css" />
        <link rel="stylesheet" href="css/glyphicons/glyphicons.css" type="text/css" />
        <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css" type="text/css" />
        <link rel="stylesheet" href="css/material-design-icons/material-design-icons.css" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap/dist/css/bootstrap.min.css" type="text/css" />

        <!-- build:css css/styles/app.min.css -->
        <link rel="stylesheet" href="css/styles/app.css" type="text/css" />
        <link rel="stylesheet" href="css/styles/style.css" type="text/css" />
        <link rel="stylesheet" href="css/styles/font.css" type="text/css" />
    </head>
    <body>
        <div class="app dk" id="app">
            <!-- #Debut HEADER -->
            <div class="padding">
                <div class="navbar">
                    <div class="pull-center">
                        <a href="index.html" class="navbar-brand md">
                            <svg width="32" height="32" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"  xmlns:xlink="http://www.w3.org/1999/xlink"> 
                                <circle cx="33" cy="20" r="3"  fill="black" class="brand-animate"/>      
                                <image xlink:href="images/logo.png" x="0" y="0" height="48" width="48" />    
                            </svg>       
                            <!--<img src="images/logo.png" alt="." style="width:32px;height: 32px;">-->
                            <span class="hidden-folded inline">FreeZiks</span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- #Fin HEADER -->
            
            <!-- #Debut FORMULAIRE CONNEXION -->
            <div class="b-t">
                <div class="center-block w-xxl w-auto-xs p-y-md text-center">
                    <div id="erreur">
                        
                    </div>
                    <div class="p-a-md">
                        <div>
                            <a href="https://www.facebook.com" class="btn btn-block indigo text-white m-b-sm">
                                <i class="fa fa-facebook pull-left"></i>
                                Se connecter avec Facebook
                            </a>
                            <a href="https://www.plus.google.com" class="btn btn-block red text-white">
                                <i class="fa fa-google-plus pull-left"></i>
                                Se connecter avec Google+
                            </a>
                        </div>
                        <div class="m-y text-sm">
                            Ou
                        </div>
                        <form name="form">
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email" id="email">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Mot de passe" id="password">
                            </div>      
                            <div class="m-b-md">        
                                <label class="md-check">
                                    <input type="checkbox"><i class="primary"></i>Rester connecter
                                </label>
                            </div>
                            <button id="login" type="button" class="btn btn-lg black p-x-lg">Se connecter</button>
                        </form>
                        <div class="m-y">
                            <a href="#" class="_600">Probleme de connexion ?</a>
                        </div>
                        <div>
                            Pas encore de compte ?
                            <a href="inscription.jsp" class="text-primary _600">S'inscrire ici</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #Fin FORMULAIRE CONNEXION -->
        </div>
        
        <!-- JS scripts -->
        <script src="libs/jquery/dist/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="libs/tether/dist/js/tether.min.js"></script>
        <script src="libs/bootstrap/dist/js/bootstrap.js"></script>
     	<script src="libs/PACE/pace.min.js"></script>
        <script>
            $(document).ready(function(e)
            {
                $("#login").click(function(){
                    email = $("#email").val();
                    password = $("#password").val();
                    $.ajax({
                        type: 'POST',
                        url: 'Connexion',
                        data: 'email='+email+'&password='+password,
                        dataType: 'text',
                        success: function(data,status)
                        {
                            if(data=='false')
                            {
                                var erreur = document.getElementById("erreur");
                                erreur.innerHTML="";
                                erreur.removeAttribute("class");
                                erreur.setAttribute("class","row alert-danger");
                                var erreurP = document.createElement("P");
                                erreurP.innerHTML="Email ou mot de passe invalide";
                                erreur.append(erreurP);
                            }
                            else
                            {
                                window.location.href = "accueil.jsp";
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
