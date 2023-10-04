import 'package:neticket/Frames/Schemas/profil.dart';

class ProfilController {
  static ProfilController instance = ProfilController();
  static List<NProfil> profilList = [
    NProfil(
      profileName: 'Profil1',
      validite: 0, // You need to provide appropriate values for these attributes
      sharedUser: 0,
      upload: 100, // Example value
      download: 200, // Example value
      servers: 'Server 1', // Example value
      forfait: 'Forfait 1', // Example value
      prixUnitaire: 10.0, // Example value
      limiteHeure: 50, // Example value
      limiteHeureJour: 100, // Example value
      limiteMega: 500, // Example value
      unity: 'MB', // Example value
    ),
    NProfil(
      profileName: 'Profil2',
      validite: 0, // You need to provide appropriate values for these attributes
      sharedUser: 0,
      upload: 150, // Example value
      download: 250, // Example value
      servers: 'Server 2', // Example value
      forfait: 'Forfait 2', // Example value
      prixUnitaire: 15.0, // Example value
      limiteHeure: 60, // Example value
      limiteHeureJour: 120, // Example value
      limiteMega: 600, // Example value
      unity: 'MB', // Example value
    ),
    NProfil(
      profileName: 'Profil3',
      validite: 0, // You need to provide appropriate values for these attributes
      sharedUser: 0,
      upload: 120, // Example value
      download: 220, // Example value
      servers: 'Server 3', // Example value
      forfait: 'Forfait 3', // Example value
      prixUnitaire: 12.0, // Example value
      limiteHeure: 55, // Example value
      limiteHeureJour: 110, // Example value
      limiteMega: 550, // Example value
      unity: 'MB', // Example value
    ),
    NProfil(
      profileName: 'Profil4',
      validite: 0, // You need to provide appropriate values for these attributes
      sharedUser: 0,
      upload: 130, // Example value
      download: 230, // Example value
      servers: 'Server 4', // Example value
      forfait: 'Forfait 4', // Example value
      prixUnitaire: 13.0, // Example value
      limiteHeure: 58, // Example value
      limiteHeureJour: 116, // Example value
      limiteMega: 580, // Example value
      unity: 'MB', // Example value
    ),
  ];

  ProfilController();

  static List<NProfil> getHistoryProfil() {
    return profilList ;
  }

  static bool updateProfil(NProfil oldProfil, NProfil updatedProfil) {
    final index = profilList.indexOf(oldProfil);
    if (index != -1) {
      profilList[index] = updatedProfil;
      return true;
    }
    return false;
  }

  static bool deleteProfil(NProfil profil){
    return profilList.remove(profil);
  }

  bool addProfil(NProfil profil) {
    profilList.add(profil);
    return true;
  }
}
