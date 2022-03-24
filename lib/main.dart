import 'package:flutter/material.dart';
import 'package:flutter_nft/pages/home_page.dart';

void main() {
  runApp(
    const Aplicativo(),
  );
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Invisible NFT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage());
  }
}
