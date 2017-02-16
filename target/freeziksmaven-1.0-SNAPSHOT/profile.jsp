<%@page import="mapping.CategorieMusique"%>
<%@page import="mapping.Musique"%>
<%@page import="utilDB.Operations"%>
<%@page import="mapping.Utilisateur"%>
<% 
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
    httpResponse.setDateHeader("Expires", 0); // Proxies.
    if(session.getAttribute("utilisateur")==null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FreeZiks</title>
		<meta charset="utf-8">
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
        <link rel="stylesheet" href="css/styles/loader.css" type="text/css" />

        <link rel="stylesheet" href="libs/owl.carousel/dist/assets/owl.carousel.min.css" type="text/css" />
        <link rel="stylesheet" href="libs/owl.carousel/dist/assets/owl.theme.css" type="text/css" />
        <link rel="stylesheet" href="libs/mediaelement/build/mediaelementplayer.min.css" type="text/css" />
        <link rel="stylesheet" href="libs/mediaelement/build/mep.css" type="text/css" />
    </head>
    <script src="libs/jquery/dist/jquery.js"></script>
    <script src="scripts/angular.min.js"></script>
    <body ng-app="myApp" ng-controller="myCtrl">
        <!-- #Debut MENU -->
        <jsp:include page="templates/menu.jsp" />
        <!-- #Fin MENU -->
        
        <!-- #Debut CONTENU -->
        <div id="content" class="app-content white bg box-shadow-z2" role="main">
            <jsp:include page="templates/musiqueplayer_logo.jsp" />
            
            <!-- Profile -->
            <div class="app dk" id="app">
                <div class="page-bg" data-stellar-ratio="2" style="background-image: url('images/a3.jpg');"></div>
                <div class="page-content">
                    <div class="padding b-b">
                        <div class="row-col">
                            <div class="col-sm w w-auto-xs m-b">
                                <div class="item w rounded">
                                    <div class="item-media">
                                        <div class="item-media-content" style="background-image: url('images/a3.jpg');"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="p-l-md no-padding-xs">
                                    <h1 class="page-title">
                                        <% if(session.getAttribute("utilisateur")!=null){ 
                                            Utilisateur user = (Utilisateur)session.getAttribute("utilisateur");
                                        %>
                                      <span class="h1 _800"><% out.print(user.getNomUtilisateur()); %> <% out.print(user.getPrenomsUtilisateur()); %></span>
                                        
                                    </h1>
                                    <p class="item-desc text-ellipsis text-muted" data-ui-toggle-class="text-ellipsis"><% out.print(user.getDescription()); %></p>
                                    <div class="item-action m-b">
                                        <a data-toggle="modal" data-target="#upload" class="btn btn-sm rounded primary">Upload Zik</a>
                                        <a href="#" class="btn btn-sm rounded blue">Nouveau playlist</a>
                                        <a href="#" class="btn btn-sm rounded white">Editer Profile</a>
                                    </div>
                                    <div class="block clearfix m-b">
                                        <span>9</span> <span class="text-muted">Playlists</span>, <span>{{myZik.length}}</span> <span class="text-muted">Ziks</span>
                                    </div>
                                </div>
                                    
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="row-col">
                    <div class="col-lg-9 b-r no-border-md">
                        <div class="padding p-y-0 m-b-md">
                            <!-- Tabs -->
                            <div class="nav-active-border b-primary bottom m-b-md m-t">
                                <ul class="nav l-h-2x" data-ui-jp="taburl">
                                    <li class="nav-item m-r inline">
                                        <a class="nav-link active" href="#" data-toggle="tab" data-target="#ziks">Ziks</a>
                                    </li>
                                    <li class="nav-item m-r inline">
                                        <a class="nav-link" href="#" data-toggle="tab" data-target="#playlist">Playlists</a>
                                    </li>
                                    <li class="nav-item m-r inline">
                                        <a class="nav-link" href="#" data-toggle="tab" data-target="#favoris">Favoris</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <!-- Ziks -->
                                <div class="tab-pane active" id="ziks">
                                    <div class="row item-list item-list-by m-b">
                                        
                                        <div class="col-xs-12" ng-repeat="zik in myZik">
                                            <div class="item r" data-id="item-{{zik.idMusique}}" data-src="{{zik.lienMusique | trusted}}">
                                                <div class="item-media ">
                                                    <a href="#" class="item-media-content" style="background-image: url('images/b9.jpg');"></a>
                                                    <div class="item-overlay center">
                                                        <button  class="btn-playpause">Play</button>
                                                    </div>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-overlay bottom text-right">
                                                        <a href="#" class="btn-favorite"><i class="fa fa-heart-o"></i></a>
                                                        <a href="#" class="btn-more" data-toggle="dropdown"><i class="fa fa-ellipsis-h"></i></a>
                                                        <div class="dropdown-menu pull-right black lt"></div>
                                                    </div>
                                                    <div class="item-title text-ellipsis">
                                                        <a href="#">{{zik.titreMusique}}</a>
                                                    </div>
                                                    <div class="item-author text-sm text-ellipsis hide">
                                                        <a href="#" class="text-muted">{{zik.artisteMusique}}</a>
                                                    </div>
                                                    <div class="item-meta text-sm text-muted">
                                                        <span class="item-meta-category"><a href="#" class="label">Categorie</a></span>                 
                                                    </div>

                                                    <div class="item-except visible-list text-sm text-muted h-2x m-t-sm">
                                                        Cliquer sur le bouton play.
                                                    </div>

                                                    <div class="item-action visible-list m-t-sm">
                                                        <a href="#" class="btn btn-xs white">Modifier</a>
                                                        <a href="#" class="btn btn-xs white" data-toggle="modal" data-target="#delete-modal">Supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>     
                                    </div>
                                    <a href="#" class="btn btn-sm white rounded">Plus</a>
                                </div>                    
                                <!-- /Ziks -->
                                
                                <!-- Playlists -->
                                <div class="tab-pane" id="playlist">
                                    <div class="row item-list item-list-by m-b">
                                        <% for(int i=0;i<5;i++){ %>
                                        <div class="col-xs-12">
                                            <div class="item r" data-id="item-10" data-src="http://api.soundcloud.com/tracks/237514750/stream?client_id=a10d44d431ad52868f1bce6d36f5234c">
                                                <div class="item-media ">
                                                    <a href="#" class="item-media-content" style="background-image: url('images/b9.jpg');"></a>
                                                    <div class="item-overlay center">
                                                        <button  class="btn-playpause">Play</button>
                                                    </div>
                                                </div>
                                                <div class="item-info">

                                                    <div class="item-title text-ellipsis">
                                                        <a href="#">My playlist</a>
                                                    </div>
                                                    <div class="item-author text-sm text-ellipsis hide">
                                                        <a href="artist.detail.html" class="text-muted">Postiljonen</a>
                                                    </div>
                                                    <div class="item-meta text-sm text-muted">
                                                        <span class="item-meta-stats text-xs ">
                                                            <i class="fa fa-play text-muted"></i> 30 
                                                            <i class="fa fa-heart m-l-sm text-muted"></i> 10
                                                        </span>
                                                    </div>

                                                    <div class="item-except visible-list text-sm text-muted h-2x m-t-sm">
                                                        Cry -- A thousand years 
                                                    </div>

                                                    <div class="item-action visible-list m-t-sm">
                                                        <a href="#" class="btn btn-xs white">Modifier</a>
                                                        <a href="#" class="btn btn-xs white" data-toggle="modal" data-target="#delete-modal">Supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div>
                                    <a href="#" class="btn btn-sm white rounded">Plus</a>
                                </div>
                                <!-- /Playlists -->
                                
                                <!-- Favoris -->
                                <div class="tab-pane" id="favoris">
                                    <div class="row item-list item-list-by m-b">
                                        <% for(int i =0;i<2;i++){ %>
                                        <div class="col-xs-12">
                                            <div class="item r" data-id="item-10" data-src="http://api.soundcloud.com/tracks/237514750/stream?client_id=a10d44d431ad52868f1bce6d36f5234c">
                                                <div class="item-media ">
                                                    <a href="#" class="item-media-content" style="background-image: url('images/b9.jpg');"></a>
                                                    <div class="item-overlay center">
                                                        <button  class="btn-playpause">Play</button>
                                                    </div>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-overlay bottom text-right">
                                                        <a href="#" class="btn-favorite"><i class="fa fa-heart-o"></i></a>
                                                        <a href="#" class="btn-more" data-toggle="dropdown"><i class="fa fa-ellipsis-h"></i></a>
                                                        <div class="dropdown-menu pull-right black lt"></div>
                                                    </div>
                                                    <div class="item-title text-ellipsis">
                                                        <a href="#">The Open Road</a>
                                                    </div>
                                                    <div class="item-author text-sm text-ellipsis hide">
                                                        <a class="text-muted">Postiljonen</a>
                                                    </div>
                                                    <div class="item-meta text-sm text-muted">
                                                        <span class="item-meta-category"><a href="browse.html" class="label">Soul</a></span>
                                                        <span class="item-meta-date text-xs">02.04.2016</span>
                                                    </div>

                                                    <div class="item-except visible-list text-sm text-muted h-2x m-t-sm">
                                                        Litatem tantae pecuniae? Utram tandem linguam nescio? Sed hoc sane concedamus.
                                                    </div>

                                                    <div class="item-action visible-list m-t-sm">
                                                        <a href="#" class="btn btn-xs white">Modifier</a>
                                                        <a href="#" class="btn btn-xs white" data-toggle="modal" data-target="#delete-modal">Supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div>
                                    <a href="#" class="btn btn-sm white rounded">Plus</a>
                                </div>                    
                                <!-- /Favoris -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Profile -->
        </div>
        
        <!-- #Fin CONTENU -->
        <div id="loader" style="display: none;"></div>
        <!-- Modal -->
        <div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
            
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="h1_800">Upload Zik</h1>
                    </div>
                    <form id="uploader">
                        <input type="hidden" value="<% out.print(user.getIdUtilisateur()); %>" name="userId" />
                        <div class="modal-body">            
                            <div class="form-group">
                                Choisissez votre zik : <input type="file" class="form-control" name="nomFichier" accept="audio/mp3"/>
                            </div>
                            <div class="form-group">
                                <label for="nomZik">Nom de la Zik : </label>
                                <input type="text" class="form-control" placeholder="Nom de la zik" name="nomZik" />
                            </div>
                            <div class="form-group">
                                <label for="auteur">Auteur : </label>
                                <input type="text" class="form-control" placeholder="Auteur" name="auteur"/>
                            </div>
                            <div class="form-group">
                                <label for="categorie">Categorie</label>
                                <select id="categorie" name="categorie" class="form-control">
                                    <option ng-repeat="categorie in myCategorie" value="{{categorie.idCategorieMusique}}">{{categorie.nomCategorie}}</option>
                                </select>
                            </div>                       
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                            <input class="btn btn-success btn-ok" type="submit" value="Uploader"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
        <!-- Bootstrap -->
        <script src="libs/tether/dist/js/tether.min.js"></script>
        <script src="libs/bootstrap/dist/js/bootstrap.js"></script>
        <!-- core -->
        <script src="libs/jQuery-Storage-API/jquery.storageapi.min.js"></script>
        <script src="libs/jquery.stellar/jquery.stellar.min.js"></script>
        <script src="libs/owl.carousel/dist/owl.carousel.min.js"></script>
        <script src="libs/jscroll/jquery.jscroll.min.js"></script>
        <script src="libs/PACE/pace.min.js"></script>
        <script src="libs/jquery-pjax/jquery.pjax.js"></script>

        <script src="libs/mediaelement/build/mediaelement-and-player.min.js"></script>
        <script src="libs/mediaelement/build/mep.js"></script>
        <script src="scripts/player.js"></script>

        <script src="scripts/config.lazyload.js"></script>
        <script src="scripts/ui-load.js"></script>
        <script src="scripts/ui-jp.js"></script>
        <script src="scripts/ui-include.js"></script>
        <script src="scripts/ui-device.js"></script>
        <script src="scripts/ui-form.js"></script>
        <script src="scripts/ui-nav.js"></script>
        <script src="scripts/ui-screenfull.js"></script>
        <script src="scripts/ui-scroll-to.js"></script>
        <script src="scripts/ui-toggle-class.js"></script>
        <script src="scripts/ui-taburl.js"></script>
        <script src="scripts/app.js"></script>
        <script src="scripts/site.js"></script>
        <script src="scripts/ajax.js"></script>
        
        <% 
            if(session.getAttribute("utilisateur")!=null){
            Utilisateur utilisateur = (Utilisateur)session.getAttribute("utilisateur"); 
        %>
        <script>
            var app = angular.module('myApp', []);
            app.controller('myCtrl', function($scope,$http) 
            {
                $http({
                    method: 'POST',
                    url: 'GetMusique',
                    params: {userId: '<% out.print(utilisateur.getIdUtilisateur()); %>'}
                }).then(function succes(response) {
                    $scope.myZik = response.data;
                });
                $http({
                    method: 'POST',
                    url: 'GetCategorieMusique',
                }).then(function succes(response) {
                    $scope.myCategorie = response.data;
                });
            });     
            app.filter('trusted', ['$sce', function ($sce) {
                return $sce.trustAsResourceUrl;
             }]);
        </script>
        <% } %>
        
        <script>
            $(document).ready(function(e)
            {
                $(document).on({
                    ajaxStart: function() { document.getElementById("loader").style.display = "block";    },
                    ajaxStop: function() { document.getElementById("loader").style.display = "none"; }    
                });
                $("form#uploader").submit(function(event){
                    event.preventDefault();
                    var formData = new FormData($(this)[0]);
                    $('#upload').modal('toggle');
                    $.ajax({
                        url:'Uploader',
                        type: 'POST',
                        data: formData,
                        cache: false,
                        contentType: false,
                        processData: false,
                        dataType: 'text',
                        success: function (returndata)
                        {
                            if(returndata=='True')
                            {
                                alert("Zik uploadé avec succes");
                                window.location.href = "profile.jsp";
                            }
                            else
                            {
                                alert(returndata);
                            }
                        }
                    });                   
                    return false;
                });
            });
        </script>
    </body>
</html>
