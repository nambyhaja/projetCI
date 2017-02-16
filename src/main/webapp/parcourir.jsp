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
            
            <!-- Parcourir -->
            <div class="app dk" id="app">
                <div class="page-content">
                    <div class="row-col">
                        <div class="col-lg-9 b-r no-border-md">
                            <div class="padding">
                                <div class="page-title m-b">
                                    <h1 class="inline m-a-0">Parcourir</h1>
                                    <div class="dropdown inline">
                                            <select ng-model="categories" class="form-control">
                                                <option value="">Tous</option>
                                                <option ng-repeat="categ in categorie" value="{{categ.idCategorieMusique}}">{{categ.nomCategorie}}</option>
                                            </select>
                                       
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="rechercheTitre">Rechercher titre : </label>
                                            <input type="text" ng-model="q" placeholder="Titre" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="pageSizes">Afficher : </label>
                                            <select ng-model="pageSize" id="pageSizes" class="form-control">
                                                <option value="5">5 ziks</option>
                                                <option value="10">10 ziks</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row text-right">
                                        <div class="form-group">
                                            <button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1" class="btn green-500">
                                                Precedent
                                            </button>
                                            {{currentPage+1}}/{{numberOfPages()}}
                                            <button ng-disabled="currentPage > getData().length/pageSize - 1" ng-click="currentPage=currentPage+1" class="btn green-500">
                                                Suivant
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-sm-4 col-md-3" ng-repeat="zik in ziks | filter:{titreMusique:q,idCategorieMusique:categories} | startFrom:currentPage*pageSize | limitTo:pageSize">
                                            <div class="item r" data-id="item-{{zik.idMusique}}" data-src="http://api.soundcloud.com/tracks/79031167/stream?client_id=a10d44d431ad52868f1bce6d36f5234c">
                                                <div class="item-media ">
                                                    <a href="#" class="item-media-content" style="background-image: url('images/b2.jpg');"></a>
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
                                                    <div class="item-author text-sm text-ellipsis ">
                                                        <a class="text-muted">{{zik.artisteMusique}}</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row text-right">
                                        <div class="form-group">
                                            <button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1" class="btn green-500">
                                                Precedent
                                            </button>
                                            {{currentPage+1}}/{{numberOfPages()}}
                                            <button ng-disabled="currentPage > getData().length/pageSize - 1" ng-click="currentPage=currentPage+1" class="btn green-500">
                                                Suivant
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Parcourir -->
        </div>
            
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
        
        <script>
            var app = angular.module('myApp', []);
            app.controller('myCtrl', function($scope,$http,$filter) 
            {
                $http({
                    method: 'POST',
                    url: 'GetAllMusique'
                }).then(function succes(response) {
                    $scope.ziks = response.data;
                });
                $http({
                    method: 'POST',
                    url: 'GetCategorieMusique'
                }).then(function succes(response) {
                    $scope.categorie = response.data;
                });
                
                $scope.currentPage = 0;
                $scope.pageSize = 10;
                $scope.q = '';
                
                $scope.getData = function () 
                {
                    return $filter('filter')($scope.ziks, $scope.q)
                }
                
                $scope.numberOfPages=function()
                {
                    return Math.ceil($scope.getData().length/$scope.pageSize);                
                }              
            });     
            app.filter('trusted', ['$sce', function ($sce) {
                return $sce.trustAsResourceUrl;
            }]);
            app.filter('startFrom', function() {
                return function(input, start) {
                    start = +start; //parse to int
                    return input.slice(start);
                }
            });
        </script>
    </body>
</html>