<% 
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
        
        <!-- CSS calendrier -->
        <link rel="stylesheet" href="css/jquery.ui/jquery-ui.css"/>
    </head>
    <body>
        <div class="app dk" id="app">
            <!-- #Debut HEADER -->
            <div class="padding">
                <div class="navbar">
                    <div class="pull-center">
                        <a href="index.jsp" class="navbar-brand md">
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
            
            <!-- #Debut FORMULAIRE INSCRIPTION -->
            <div class="b-t">
                <div class="center-block w-xxl w-auto-xs p-y-md text-left">
                    <div id="erreur"></div>
                    <div class="p-a-md">
                        <form name="form">
                            <div class="form-group">
                                <label for="nom" class="control-label">Nom</label>
                                <input type="text" placeholder="Nom" name="nom" class="form-control" id="nom">
                            </div>
                            <div class="form-group">
                                <label for="prenoms" class="control-label">Prenoms</label>
                                <input type="text" placeholder="Prenoms" name="prenoms" class="form-control" id="prenoms">
                            </div>
                            <div class="form-group">
                                <label for="datepicker" class="control-label">Date de naissance</label>
                                <input type="text" placeholder="Date de naissance" name="datenaissance" class="form-control" id="datepicker">
                            </div>
                            <div class="form-group">
                                <label for="email" class="control-label">Email</label>
                                <input type="text" placeholder="Email" name="email" class="form-control" id="email">
                            </div>
                            <div class="form-group">
                                <label for="description" class="control-label">Description</label>
                                <input type="text" placeholder="Une petite description sur vous" name="description" class="form-control" id="description">
                            </div>
                            <div class="form-group">
                                <label for="mdp" class="control-label">Mot de passe</label>
                                <input type="password" placeholder="Mot de passe" name="mdp" class="form-control" id="mdp">
                            </div>
                            <div class="form-group">
                                <label for="cmdp" class="control-label">Confirmer votre mot de passe</label>
                                <input type="password" placeholder="Confirmer votre mot de passe" name="cmdp" class="form-control" id="cmdp">
                            </div>
                            <div class="text-center">
                                <button type="button" class="btn btn-lg black p-x-lg" id="inscription">S'inscrire</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- #Fin FORMULAIRE INSCRIPTION -->
        </div>
        
        <!-- JS scripts -->
        <script src="libs/jquery/dist/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="libs/tether/dist/js/tether.min.js"></script>
        <script src="libs/bootstrap/dist/js/bootstrap.js"></script>
     	<script src="libs/PACE/pace.min.js"></script>
        
        <!-- JS calendrier -->
        <script src="libs/jquery.ui/jquery-ui.js"></script>
        <script>
            $( function() 
            {
                $( "#datepicker" ).datepicker({ changeMonth: true ,changeYear : true, defaultDate: new Date('1 January 1997')});
                $("#inscription").click(function(){ 
                    var nom = document.getElementById('nom').value;
                    var prenoms = document.getElementById("prenoms").value;
                    var email = document.getElementById("email").value;
                    var mdp = document.getElementById("mdp").value;
                    var cmdp = document.getElementById("cmdp").value;
                    var datenaissance = document.getElementById("datepicker").value;
                    var description = document.getElementById("description").value;
                    
                    if(nom=="" || prenoms=="" || email=="" || mdp=="" || cmdp=="" || datenaissance=="" || description=="")
                    {
                        $("#erreur").empty();
                        var erreur = document.getElementById("erreur");
                        erreur.setAttribute("class","alert-danger");
                        var p = document.createElement("P");
                        $(p).prepend('Veuillez remplir les champs vides');
                        $(erreur).append(p);
                    }
                    else
                    {
                        $.ajax({
                           type: 'POST',
                           url: 'Inscription',
                           data: 'nom='+nom+'&prenoms='+prenoms+'&datenaissance='+datenaissance+'&email='+email+'&mdp='+mdp+'&cmdp='+cmdp,
                           dataType : 'text',
                           success: function(data,status)
                           {
                               if(data!="True")
                               {
                                   $("#erreur").empty();
                                    var erreur = document.getElementById("erreur");
                                    erreur.setAttribute("class","alert-danger");
                                    var p = document.createElement("P");
                                    $(p).prepend(data);
                                    $(erreur).append(p);
                               }
                               else
                               {
                                   alert("Inscription reussie");
                                   window.location.href = "index.jsp";
                               }
                           }
                        });
                    }
                });
                $("#email").keyup(function(){
                    var regex = /^[a-zA-Z0-9._-]+@[a-z0-9._-]{4,}\.[a-z]{2,4}$/;
                    if(!regex.test($(this).val()))
                    {
                        $("#erreur").empty();
                        var erreur = document.getElementById("erreur");
                        erreur.setAttribute("class","alert-danger");
                        var p = document.createElement("P");
                        $(p).prepend("L'email n'est pas valide");
                        $(erreur).append(p);
                    }
                    else
                    {
                        $("#erreur").empty();
                        var erreur = document.getElementById("erreur");
                        erreur.setAttribute("class","alert-success");
                        var p = document.createElement("P");
                        $(p).prepend("Email valide");
                        $(erreur).append(p);
                    }
                });
                $("#mdp").keyup(function(){
                    var majRegex = new RegExp("(?=.*[A-Z]).*$","g");
                    var chiffreRegex = new RegExp("(?=.*[0-9]).*$","g");                  
                    var tailleRegex = new RegExp("(?=.{8,}).*$", "g");
                    var specRegex = new RegExp("(?=.*\\W).*$","g");
                    $("#cmdp").val("");
                    
                    $("#erreur").empty();   
                    if (tailleRegex.test($(this).val()) === false) 
                    {
                        $("#erreur").empty();
                        var erreur = document.getElementById("erreur");
                        erreur.setAttribute("class","alert-danger");
                        var p = document.createElement("P");
                        $(p).prepend('Le mot de passe doit faire au moins 8 caracteres');
                        $(erreur).append(p);
                    }  
                    else
                    {
                        if (majRegex.test($(this).val()) === false) 
                        {
                            $("#erreur").empty();
                            var erreur = document.getElementById("erreur");
                            erreur.setAttribute("class","alert-danger");
                            var p = document.createElement("P");
                            $(p).prepend('Le mot de passe doit contenir au moins une majuscule');
                            $(erreur).append(p);
                        }  
                        else if (chiffreRegex.test($(this).val()) === false) 
                        {
                            $("#erreur").empty();
                            var erreur = document.getElementById("erreur");
                            erreur.setAttribute("class","alert-danger");
                            var p = document.createElement("P");
                            $(p).prepend('Le mot de passe doit contenir au moins un chiffre');
                            $(erreur).append(p);
                        }  
                        else if (specRegex.test($(this).val()) === false) 
                        {
                            $("#erreur").empty();
                            var erreur = document.getElementById("erreur");
                            erreur.setAttribute("class","alert-danger");
                            var p = document.createElement("P");
                            $(p).prepend('Le mot de passe doit contenir au moins un caractere special');
                            $(erreur).append(p);
                        }  
                        else
                        {  
                            $("#erreur").empty();
                            var ok = document.getElementById("erreur");
                            ok.setAttribute("class","alert-success");
                            var p = document.createElement("P");
                            $(p).prepend('Mot de passe valide');
                            $(ok).append(p);
                        }
                    }
                });
                $("#cmdp").keyup(function(){
                    var motdepasse = $("#mdp").val();
                    var confirm = $("#cmdp").val();
                    if(motdepasse===confirm)
                    {
                        $("#erreur").empty();
                        var erreur = document.getElementById("erreur");
                        erreur.setAttribute("class","alert-success");
                        var p = document.createElement("P");
                        $(p).prepend('Les mots de passes sont identiques');
                        $(erreur).append(p);
                    }
                    else
                    {
                        $("#erreur").empty();
                        var erreur = document.getElementById("erreur");
                        erreur.setAttribute("class","alert-danger");
                        var p = document.createElement("P");
                        $(p).prepend('Les mots de passes ne sont pas identiques');
                        $(erreur).append(p);
                    }
                });
            });
        </script>
    </body>
</html>
