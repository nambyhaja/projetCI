<%@page import="mapping.Musique"%>
<%@page import="utilDB.Operations"%>
<% 
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
    httpResponse.setDateHeader("Expires", 0); // Proxies.
    if(session.getAttribute("utilisateur")==null)
    {
        response.sendRedirect("index.jsp");
    }
    else
    {
        Musique[] topMusiques = Operations.findMusiquesTopSemaine();
        Musique[] recentMusiques = Operations.findMusiquesRecents();
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
    
    <body>
        <!-- #Debut MENU -->
        <jsp:include page="templates/menu.jsp" />
        <!-- #Fin MENU -->
        
        <!-- #Debut CONTENU -->
        <div id="content" class="app-content white bg box-shadow-z2" role="main">
            <jsp:include page="templates/musiqueplayer_logo.jsp" />
            
            <!-- Accueil -->
            <div class="app dk" id="app">
                <div class="page-content">
                    <div class="row-col">
                        <div class="col-lg-9 b-r no-border-md">
                            <div class="padding">
                                <!-- TOP -->
                                <h2 class="widget-title h4 m-b">Tops de la semaine</h2>
                                <div class="row">
                                    <div class="owl-carousel owl-theme owl-dots-center" data-ui-jp="owlCarousel" data-ui-options="{
                                                margin: 20,
                                                responsiveClass:true,
                                            responsive:{
                                                0:{
                                                        items: 2
                                                },
                                                543:{
                                                    items: 4
                                                }
                                            }
                                        }"
                                    >
                                        <% for(int i=0;i<topMusiques.length;i++){ %>
                                        <div>
                                            <div class="item r" data-id="item-<% out.print(topMusiques[i].getIdMusique()); %>" data-src="<% out.print(topMusiques[i].getLienMusique()); %>">
                                                <div class="item-media item-media-4by3">
                                                    <a class="item-media-content" style="background-image: url('images/b2.jpg');"></a>
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
                                                        <a href="track.detail.html"><% out.print(topMusiques[i].getTitreMusique()); %></a>
                                                    </div>
                                                    <div class="item-author text-sm text-ellipsis ">
                                                        <a class="text-muted"><% out.print(topMusiques[i].getArtisteMusique()); %></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div>
                                </div>
                                <!-- /TOP -->
                                
                                <!-- RECENT -->
                                <h2 class="widget-title h4 m-b">Recent</h2>
                                <div class="row">
                                    <% for(int i=0;i<recentMusiques.length;i++){ %>
                                    <div class="col-xs-4 col-sm-4 col-md-3">
                                        <div class="item r" data-id="item-<% out.print(recentMusiques[i].getIdMusique()); %>" data-src="<% out.print(recentMusiques[i].getLienMusique()); %>">
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
                                                    <a href="#"><% out.print(recentMusiques[i].getTitreMusique()); %></a>
                                                </div>
                                                <div class="item-author text-sm text-ellipsis ">
                                                    <a class="text-muted"><% out.print(recentMusiques[i].getArtisteMusique()); %></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                                <!-- /RECENT -->
                                
                                <!-- RECOMMANDE -->
                                <h2 class="widget-title h4 m-b">Recommandé pour vous</h2>
                                <div class="row item-list item-list-md m-b">
                                    <% for(int i=0;i<8;i++){ %>
                                    <div class="col-sm-6">
                                        <div class="item r" data-id="item-10" data-src="http://streaming.radionomy.com/JamendoLounge">
                                            <div class="item-media ">
                                                <a href="#" class="item-media-content" style="background-image: url('images/b4.jpg');"></a>
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
                                                    <a href="#">Live Radio <% out.print(i); %></a>
                                                </div>
                                                <div class="item-author text-sm text-ellipsis ">
                                                    <a class="text-muted">Radionomy</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                                <!-- /RECOMMANDE -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Accueil -->
        </div>
        
        <!-- #Fin CONTENU -->
    
        <script src="libs/jquery/dist/jquery.js"></script>
        
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
    <% } %>   
    </body>
</html>
