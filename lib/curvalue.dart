import 'dart:convert';

import 'package:firstproj/homepage.dart';
import 'package:firstproj/secretapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

double inrrate = 0;

class CurValue extends StatefulWidget {
  const CurValue({super.key});

  @override
  State<CurValue> createState() => _CurValueState();
}

class _CurValueState extends State<CurValue> {
  
  @override
  void initState() {
    super.initState();
    getINRrate();
  }

  Future getINRrate() async {
    print('calllledddd');
    try {
      final res = await  http.get(Uri.parse("https://api.currencyfreaks.com/v2.0/rates/latest?apikey=$curapikey"));

      final data = jsonDecode(res.body);

      if (data['base'] != 'USD') {
        throw 'an error occured';
      }

      inrrate = double.parse(data['rates']['INR']);
      return data;
    }


    catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}