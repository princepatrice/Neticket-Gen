class NProfil {
  String? id;
  String profileName;
  int validite;
  int sharedUser;
  int upload;
  int download;
  String servers;
  String forfait;
  double prixUnitaire;
  int limiteHeure;
  int limiteHeureJour;
  int limiteMega;
  String unity;
  DateTime dateSaved = DateTime.now();

  // Constructor for initializing the attributes
  NProfil({
    this.profileName = '',
    this.validite = 0,
    this.sharedUser = 0,
    this.upload = 0,
    this.download = 0,
    this.servers = '',
    this.forfait = '',
    this.prixUnitaire = 0.0,
    this.limiteHeure = 0,
    this.limiteHeureJour = 0,
    this.limiteMega = 0,
    this.unity = '',
  });

  String getDateSaved() {
    // dateSaved = DateTime.now();
    return "${dateSaved?.month.toString().padLeft(2, '0')}/${dateSaved?.day.toString().padLeft(2, '0')}/${dateSaved?.year.toString()}";
  }
}
