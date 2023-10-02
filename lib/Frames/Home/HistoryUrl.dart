import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neticket/Controllers/RouterController.dart';
import 'package:neticket/Frames/Schemas/router.dart';

bool matchRouter(NRouter router, String searchText) {
  return router.name.toLowerCase().contains(searchText.toLowerCase()) ||
      router.host.toLowerCase().contains(searchText.toLowerCase());
}

List<Card> HistoryUrl(BuildContext context, List<NRouter> routerList,Function action) {
  List<Card> routerCards = [];
  routerList.forEach((router) {
    routerCards.add(Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        child: GestureDetector(
          onTap: () => {_showRouterBottomSheet(context, router, action)},
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey, // Use any default color you prefer
              child: Icon(Icons.router), // Use any default icon you prefer
            ),
            title: Text(
              router.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Company: ${router.host}"),
                Text("Date Saved: ${router.getDateSaved()}"),
              ],
            ),
          ),
        )));
  });

  return routerCards;
}

void _showRouterBottomSheet(BuildContext context, NRouter router, Function action) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: 500,
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Router Information',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 16.0),
                Text('Router: ${router.name}'),
                Text('Host: ${router.host}'),
                Text('Date Saved: ${router.getDateSaved()}'),
                const SizedBox(height: 16.0),
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      if(RouterController.deleteRouter(router)){
                        action();
                      }
                      Navigator.pop(context);
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8), // Add some spacing between the icon and text
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),

                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8), // Add some spacing between the icon and text
                      Text(
                        'Connect',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ),
                ],)

              ],
            ),
          ));
    },
  );
}
