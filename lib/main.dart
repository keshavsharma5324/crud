import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_crud/providers/product_provider.dart';
import 'package:project_crud/screens/products.dart';
import 'package:project_crud/services/firestore_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider()),
            StreamProvider(create: (context)=> firestoreService.getProducts()),
          ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Products(),
      ),
    );
  }
}

