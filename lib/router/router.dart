import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/router/routes_handlers.dart';

class Flurorouter{

  static final FluroRouter router = FluroRouter();

  static void configureRoutes(){
    //Rutas
    router.define('/:page', handler: homeHandler);

    //Ruta 404
    router.notFoundHandler = homeHandler;
  }
}