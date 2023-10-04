import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neticket/Controllers/ProfilController.dart';
import 'package:neticket/Frames/Admin/Profils/AddProfil.dart';
import 'package:neticket/Frames/Admin/index.dart';
import 'package:neticket/Frames/Schemas/profil.dart';

bool matchProfil(NProfil profil, String searchText) {
  return profil.profileName.toLowerCase().contains(searchText.toLowerCase());
}

List<Card> History(
    BuildContext context, List<NProfil> profilList, Function action) {
  List<Card> profilCards = [];
  profilList.forEach((profil) {
    profilCards.add(Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        child: GestureDetector(
          onTap: () => {_showProfilBottomSheet(context, profil, action)},
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey, // Use any default color you prefer
              child: Icon(Icons.verified_user), // Use any default icon you prefer
            ),
            title: Text(
              profil.profileName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date Saved: ${profil.getDateSaved()}"),
              ],
            ),
          ),
        )));
  });

  return profilCards;
}


void _showProfilBottomSheet(
    BuildContext context, NProfil profil, Function action) {
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
                Text('Profil Information',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 16.0),
                Text('Profil: ${profil.profileName}'),
                Text('Validite: ${profil.validite}'),
                Text('Shared User: ${profil.sharedUser}'),
                Text('Upload: ${profil.upload}'),
                Text('Download: ${profil.download}'),
                Text('Servers: ${profil.servers}'),
                Text('Forfait: ${profil.forfait}'),
                Text('Prix Unitaire: ${profil.prixUnitaire}'),
                Text('Limite Heure: ${profil.limiteHeure}'),
                Text('Limite Heure Jour: ${profil.limiteHeureJour}'),
                Text('Limite Mega: ${profil.limiteMega}'),
                Text('Unity: ${profil.unity}'),

                Text('Date Saved: ${profil.getDateSaved()}'),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (ProfilController.deleteProfil(profil)) {
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
                          SizedBox(
                              width:
                              8), // Add some spacing between the icon and text
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width:10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange), // Set your desired background color here
                      ),
                      onPressed: () {
                       //Edit
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProfilsPage(profil: profil)))
                        .then((result) {
                        Navigator.pop(context);
                        action();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(
                              width:
                              8), // Add some spacing between the icon and text
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                   ],
                )
              ],
            ),
          ));
    },
  );



}
