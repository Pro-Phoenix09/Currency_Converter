import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getINRrate();
  }

  Future getINRrate() async {
    try {
      final res = await  http.get(Uri.parse("https://api.currencyfreaks.com/v2.0/rates/latest?apikey=2696469591944d8a945189e780d124dc"));

      final data = jsonDecode(res.body);

      print(data['date']);
    }


    catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('nais app'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 130,
                bottom: 10,
              ),
              child: Text(
                'Currency Converter', 
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amber,
                ), 
              ),
            ),
            Text('USD to INR', style: TextStyle(color: Colors.cyanAccent)),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text('INR ${result != 0 ? result.toStringAsFixed(2): result.toStringAsFixed(0)}', style: TextStyle(color: Colors.white, fontSize: 30)),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 40,
                bottom: 140,

              ),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: Colors.white,
                ),
              
                decoration: InputDecoration(
                  hintText: "Amount in USD",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
              
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.white54,
                  
                  filled: true,
                  fillColor: Colors.white12,
              
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white10,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
              
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white10,
                      width: 2,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )    
              
                ),
              
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              
                onSubmitted: (value) {
                  setState(() {
                    result = double.parse(textEditingController.text)*86.25;
                  });
                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text)*86.25;
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan[800],
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular((15)))),
                  shadowColor: Colors.white,
                ),                        
              
                child: Text("Convert"),
                
              ),
            ),

            

          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[850],                
              ),



              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      
                      color: Colors.white,
                      size: 30,
                    ),

                    Text(
                      '   Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ),

            ListTile(
              title: Text('hewo', style: TextStyle(color: Colors.cyan[200], fontSize: 20),),
              leading: Icon(
                Icons.settings,
                size: 27,
                color: Colors.cyan,
              ),

              onTap: () {},
            

            )
          ],
        )
      ),
    );
  }
}