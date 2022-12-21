import 'package:proysena/pantallainicio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proysena/carrito/Carrito.dart';
import 'package:proysena/desktop.dart';
import 'package:proysena/responsive.dart';

import 'firebase_options.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); runApp(

  ChangeNotifierProvider(
    create: (context) => Carrito(),

    child: MyApp(),
  )

);




  // This widget is the root of your application
}

