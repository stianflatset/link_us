import 'package:community_material_icon/community_material_icon.dart';
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
              Row(
                children: [
                  Flexible(child: buildTextField(Icon(Icons.person, color: Palette.activeColor,), 'Fornavn')),
                  Flexible(child: buildTextField(Icon(Icons.person, color: Palette.activeColor,), 'Etternavn')),
                ],
              ),
              Row(
                children: [
                  Flexible(child: buildTextField(Icon(Icons.phone, color: Palette.activeColor,), 'Telefon')),
                  Flexible(child: buildTextField(Icon(Icons.house, color: Palette.activeColor,), 'Adresse')),
                ],
              ),
              buildTextField(Icon(Icons.mail, color: Palette.activeColor,), 'E-post adresse'),
              Row(
                children: [
                  Flexible(child: buildTextField(Icon(Icons.work, color: Palette.activeColor,), 'Stilling')),
                  Flexible(child: buildTextField(Icon(Icons.apartment, color: Palette.activeColor,), 'Firma')),
                ],
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 20),
              Center(child: Text('Koble profilen din til Sosiale Medier', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              // Buttons for linking to facebook, linkedIn, youtube and instagram
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Facebook button
                  FlatButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(CommunityMaterialIcons.facebook, size: 40.0, color: Palette.facebookColor,),
                        Text('Facebook', style: TextStyle(fontSize: 16,color: Palette.facebookColor, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  // Google button
                  FlatButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(CommunityMaterialIcons.google, size: 40.0, color: Palette.googleColor,),
                        Text('Google', style: TextStyle(fontSize: 16,color: Palette.googleColor, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  // Instagram button
                  FlatButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(CommunityMaterialIcons.instagram, size: 40.0, color: Palette.instagramColor,),
                        Text('Instagram', style: TextStyle(fontSize: 16,color: Palette.instagramColor, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  // LinkedIn button
                  FlatButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(CommunityMaterialIcons.linkedin, size: 40.0, color: Palette.linkedinColor,),
                        Text('LinkedIn', style: TextStyle(fontSize: 16,color: Palette.linkedinColor, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(icon, String hintText) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
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
    );
  }
}
