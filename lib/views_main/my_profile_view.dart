import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:link_us/services/palette.dart';

// UI for My Profile

class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector( onTap: (){FocusScope.of(context).unfocus();},
        child: CupertinoScrollbar(
          child: ListView(
            children: [
              Center(
                child: Text('Rediger Profil', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold,),
                ),
              ),
              SizedBox(height: 20,),
              //Row containing "profil bilde" and "firma bilde"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //First profil bilde
                  Column(
                    children: [
                      Text('Profilbilde', style: TextStyle(fontSize: 16,),),
                      Padding(padding: EdgeInsets.only(bottom: 5)),
                      Stack(
                        children: [
                          Container(
                            width: 95,
                            height: 95,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: Theme.of(context).scaffoldBackgroundColor
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2, blurRadius: 10, color: Colors.black.withOpacity(0.1), offset: Offset(0,10)
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/ikon_logo.png"),
                                )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Theme.of(context).scaffoldBackgroundColor
                                ),
                                color: Palette.activeColor,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.mode_edit),
                                color: Colors.white,
                                onPressed: () {

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ] ,
                  ),
                  // Dividing the two pictures
                  Container(height: 80, child: VerticalDivider(thickness: 1.0,color: Colors.black)),
                  // Then firma bilde
                  Column(
                    children: [
                      Text('Firma', style: TextStyle(fontSize: 16)),
                      Padding(padding: EdgeInsets.only(bottom: 5)),
                      Stack(
                        children: [
                          Container(
                            width: 95,
                            height: 95,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: Theme.of(context).scaffoldBackgroundColor
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2, blurRadius: 10, color: Colors.black.withOpacity(0.1), offset: Offset(0,10)
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/ikon_logo.png"),
                                )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Theme.of(context).scaffoldBackgroundColor
                                ),
                                color: Palette.activeColor,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.mode_edit),
                                color: Colors.white,
                                onPressed: () {

                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                    // Then firma bilde
                  )
                ],
              ),
              SizedBox(height: 20),
              // Inputfields for the user data
              Column(
                children: [
                  buildTextField(Icon(Icons.person, color: Palette.activeColor,), 'Fornavn'),
                  buildTextField(Icon(Icons.person, color: Palette.activeColor,), 'Etternavn'),
                  buildTextField(Icon(Icons.mail, color: Palette.activeColor,), 'E-post adresse'),
                  buildTextField(Icon(Icons.phone, color: Palette.activeColor,), 'Telefon'),
                  buildTextField(Icon(Icons.work, color: Palette.activeColor,), 'Stilling'),
                  buildTextField(Icon(Icons.apartment, color: Palette.activeColor,), 'Firma'),
                  buildTextField(Icon(Icons.house, color: Palette.activeColor,), 'Adresse'),
              ]),
              //Button for updating user data
              Container(
                margin: EdgeInsets.only(left: 100,right: 100),
                child: TextButton(
                  onPressed: () async {

                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(330, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Colors.white,
                    backgroundColor: Palette.buttonColor,
                    elevation: 3,
                  ),
                  child: Text(
                    "Lagre endringer",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Center(child: Text('Koble profilen din til Sosiale Medier', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(icon, String hintText) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 35,right: 35),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(8.0),),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.activeColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            contentPadding: EdgeInsets.all(1),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16, color: Palette.textColor1),
          ),
        ),
      ),
    );
  }
}
