import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neticket/Controllers/ProfilController.dart';
import 'package:neticket/Frames/Admin/Profils/AddProfil.dart';
import 'package:neticket/Frames/Admin/Profils/History.dart';
import 'package:neticket/Frames/Schemas/profil.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});
  @override
  State<ProfilScreen> createState() => ProfilScreenState();
}

class ProfilScreenState extends State<ProfilScreen> {
  late List<NProfil> profils;
  List<Card> listJobCards = [];
  bool _isSearching = false;
  Timer? _searchDebounce;

  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profils = ProfilController.getHistoryProfil();
    listJobCards = History(context, profils, () => {RefreshList()});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profils",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left:10),
            child: Icon(Icons.verified_user, size: 40,))
          ,
          backgroundColor: Colors.orange,
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: SingleChildScrollView(
                child: Column(children: [
                  getSearchBarWidget(),
                  Column(children: listJobCards)
                ]))),
        floatingActionButton: getFloatingButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }

  Widget getSearchBarWidget() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search Profil...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: _onSearchTextChanged));
  }

  void _onSearchTextChanged(String text) {
    if (_searchDebounce?.isActive ?? false) {
      _searchDebounce!.cancel();
    }

    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _isSearching = true;
      });

      List<NProfil> profilFiltered = profils
          .where((profil) => matchProfil(profil, text))
          .toList(growable: true);

      setState(() {
        _isSearching = false;
        // Update your UI with the filtered profil list
        listJobCards = History(context, profilFiltered, () => {RefreshList()});
      });
    });
  }

  void RefreshList() {
    setState(() {
      // Update your UI with the filtered profil list
      profils = ProfilController.getHistoryProfil();
      listJobCards = History(
          context, ProfilController.getHistoryProfil(), () => {RefreshList()});
    });
  }

  Widget getFloatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: 60.0, // Adjust the width as needed
            height: 60.0, // Adjust the height as needed
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(30.0), // Adjust the radius as needed
              ),
              onPressed: () => addProfil(),
              tooltip: 'Add Profil',
              child: const Icon(Icons.add),
            )),
      ],
    );
  }

  void addProfil() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProfilsPage(profil: NProfil())))
        .then((result) {
      RefreshList();
    });
  }
}
