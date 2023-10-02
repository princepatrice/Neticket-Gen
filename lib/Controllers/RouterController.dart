import 'package:neticket/Frames/Schemas/router.dart';

class RouterController {
  static RouterController instance = RouterController();
  static List<NRouter> routerList = [
    NRouter(
      username: 'user1',
      password: 'pass1',
      host: 'host1.com',
      name: 'Router1',
    ),
    NRouter(
      username: 'user',
      password: 'pass2',
      host: 'host2.com',
      name: 'Router2',
    ),
    NRouter(
      username: 'user1',
      password: 'pass1',
      host: 'host4.com',
      name: 'Router4',
    ),
    NRouter(
      username: 'user2',
      password: 'pass2',
      host: 'host4.com',
      name: 'Router4',
    ),
  ];
  RouterController();

  static List<NRouter> getHistoryRouter() {
    return routerList ;
  }

  static bool deleteRouter(NRouter router){
    return routerList.remove(router);
  }

  bool addRouter(url,username,password) {
    routerList.add( NRouter(
      username: username,
      password: password,
      host: url,
      name: 'Router${routerList.length+1}',
    ),);
    return true;
    
  }
}
