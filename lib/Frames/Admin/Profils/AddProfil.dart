import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neticket/Controllers/ProfilController.dart';
import 'package:neticket/Frames/Custom/utils.dart';
import 'package:neticket/Frames/Schemas/profil.dart';


class AppColors {
  static const Color appTextColor = Colors.orange;
  static const Color appBackgroundColor = Colors.orange;
}

class AddProfilsPage extends StatefulWidget {
  final NProfil profil; // Pass the NProfil object as an argument

  AddProfilsPage({
    required this.profil,
  });



  @override
  _AddProfilsPageState createState() => _AddProfilsPageState();
}

class _AddProfilsPageState extends State<AddProfilsPage> {
  late TextEditingController profileNameController;
  late TextEditingController validiteController;
  late TextEditingController sharedUserController;
  late TextEditingController uploadController;
  late TextEditingController downloadController;
  late TextEditingController serversController;
  late TextEditingController forfaitController;
  late TextEditingController prixUnitaireController;
  late TextEditingController limiteHeureController;
  late TextEditingController limiteHeureJourController;
  late TextEditingController limiteMegaController;
  late TextEditingController unityController;

  @override
  void initState() {
    print(widget.profil.id);
    print(widget.profil.profileName);
    super.initState();
    profileNameController = TextEditingController(text: widget.profil.profileName);
    validiteController = TextEditingController(text: widget.profil.validite.toString());
    sharedUserController = TextEditingController(text: widget.profil.sharedUser.toString());
    uploadController = TextEditingController(text: widget.profil.upload.toString());
    downloadController = TextEditingController(text: widget.profil.download.toString());
    serversController = TextEditingController(text: widget.profil.servers);
    forfaitController = TextEditingController(text: widget.profil.forfait);
    prixUnitaireController = TextEditingController(text: widget.profil.prixUnitaire.toString());
    limiteHeureController = TextEditingController(text: widget.profil.limiteHeure.toString());
    limiteHeureJourController = TextEditingController(text: widget.profil.limiteHeureJour.toString());
    limiteMegaController = TextEditingController(text: widget.profil.limiteMega.toString());
    unityController = TextEditingController(text: widget.profil.unity);
  }

  @override
  void dispose() {
    profileNameController.dispose();
    validiteController.dispose();
    sharedUserController.dispose();
    uploadController.dispose();
    downloadController.dispose();
    serversController.dispose();
    forfaitController.dispose();
    prixUnitaireController.dispose();
    limiteHeureController.dispose();
    limiteHeureJourController.dispose();
    limiteMegaController.dispose();
    unityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orange),
        title: Text(
          widget.profil.id == null? 'Add Profile': "Profil (${widget.profil.profileName}) ",
          style: TextStyle(color: AppColors.appTextColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTextField('Profile Name', profileNameController),
            _buildTextField('Validite', validiteController),
            _buildTextField('Shared User', sharedUserController),
            _buildTextField('Upload', uploadController),
            _buildTextField('Download', downloadController),
            _buildTextField('Servers', serversController),
            _buildTextField('Forfait', forfaitController),
            _buildTextField('Prix Unitaire', prixUnitaireController),
            _buildTextField('Limite Heure', limiteHeureController),
            _buildTextField('Limite Heure Jour', limiteHeureJourController),
            _buildTextField('Limite Mega', limiteMegaController),
            _buildTextField('Unity', unityController),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save the updated information
                final updatedProfileName = profileNameController.text;
                final updatedValidite = int.tryParse(validiteController.text) ?? 0;
                final updatedSharedUser = int.tryParse(sharedUserController.text) ?? 0;
                final updatedUpload = int.tryParse(uploadController.text) ?? 0;
                final updatedDownload = int.tryParse(downloadController.text) ?? 0;
                final updatedServers = serversController.text;
                final updatedForfait = forfaitController.text;
                final updatedPrixUnitaire = double.tryParse(prixUnitaireController.text) ?? 0.0;
                final updatedLimiteHeure = int.tryParse(limiteHeureController.text) ?? 0;
                final updatedLimiteHeureJour = int.tryParse(limiteHeureJourController.text) ?? 0;
                final updatedLimiteMega = int.tryParse(limiteMegaController.text) ?? 0;
                final updatedUnity = unityController.text;


                final updatedNProfil = NProfil(
                  profileName: updatedProfileName,
                  validite: updatedValidite,
                  sharedUser: updatedSharedUser,
                  upload: updatedUpload,
                  download: updatedDownload,
                  servers: updatedServers,
                  forfait: updatedForfait,
                  prixUnitaire: updatedPrixUnitaire,
                  limiteHeure: updatedLimiteHeure,
                  limiteHeureJour: updatedLimiteHeureJour,
                  limiteMega: updatedLimiteMega,
                  unity: updatedUnity,
                );

                if (widget.profil.id==null){
                  String id= updatedNProfil.profileName+ getRandomNumer().toString();
                  updatedNProfil.id = id;
                  ProfilController.instance.addProfil(updatedNProfil);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('New Profile Added succesfully')),
                  );
                  Navigator.pop(context);
                }else{
                  updatedNProfil.id = widget.profil.id;
                  ProfilController.updateProfil(widget.profil,updatedNProfil);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile Information saved')),
                  );
                }

              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.appTextColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.appTextColor),
            ),
            labelText: label,
            //labelStyle: TextStyle(color: AppColors.appTextColor),
            hintStyle: TextStyle(color: Colors.orange),
            hintText: label),
        //  ...? widget.otherParams,
      )
    );
  }
}

