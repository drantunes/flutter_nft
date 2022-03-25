import 'package:flutter/material.dart';
import 'package:flutter_nft/pages/dashboard_page.dart';
import 'package:flutter_nft/repositories/friend_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FriendRepository>(
          create: (_) => FriendRepository(),
        ),
      ],
      child: const Aplicativo(),
    ),
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
        textTheme: GoogleFonts.sourceCodeProTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      home: DashboardPage(),
    );
  }
}
