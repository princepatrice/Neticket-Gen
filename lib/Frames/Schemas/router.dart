class NRouter {
  String username;
  String password;
  String host;
  String name;
  DateTime dateSaved = DateTime.now();

  NRouter({
    required this.username,
    required this.password,
    required this.host,
    required this.name
  });

  String getDateSaved(){
   // dateSaved = DateTime.now();
      return "${dateSaved?.month.toString().padLeft(2, '0')}/${dateSaved?.day.toString().padLeft(2, '0')}/${dateSaved?.year.toString()}";

  }

}
