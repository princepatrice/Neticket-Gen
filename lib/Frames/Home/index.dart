import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neticket/Controllers/RouterController.dart';
import 'package:neticket/Frames/Home/AddRouter.dart';
import 'package:neticket/Frames/Home/HistoryUrl.dart';
import 'package:neticket/Frames/Schemas/router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late List<NRouter> routers;
  List<Card> listJobCards = [];
  bool _isSearching = false;
  Timer? _searchDebounce;

  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    routers = RouterController.getHistoryRouter();
    listJobCards = HistoryUrl(context, routers, () => {RefreshList()});
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
            "Neticket (Ticket Generator)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left:10),
            child: Image.asset('assets/logo/ico.png', width: 40.0, height: 40.0) ,)
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
              hintText: 'Search ...',
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

      List<NRouter> jobFiltered = routers
          .where((router) => matchRouter(router, text))
          .toList(growable: true);

      setState(() {
        _isSearching = false;
        // Update your UI with the filtered job list
        listJobCards = HistoryUrl(context, jobFiltered, () => {RefreshList()});
      });
    });
  }

  void RefreshList() {
    setState(() {
      // Update your UI with the filtered job list
      routers = RouterController.getHistoryRouter();
      listJobCards = HistoryUrl(
          context, RouterController.getHistoryRouter(), () => {RefreshList()});
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
              onPressed: () => addJob(),
              tooltip: 'Add Router',
              child: const Icon(Icons.add),
            )),
      ],
    );
  }

  void addJob() {
    addBottomSheet(context, () => {RefreshList()});
  }
}
