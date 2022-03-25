import 'package:flutter/material.dart';
import 'package:flutter_nft/models/friend.dart';
import 'package:flutter_nft/pages/home_page.dart';
import 'package:flutter_nft/repositories/friend_repository.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  // final ValueNotifier<String> texto = ValueNotifier('Valor inicial');

  const DashboardPage({Key? key}) : super(key: key);

  valorMedio(List<Friend> friends) {
    double soma = 0;
    for (var friend in friends) {
      soma += friend.value;
    }
    return (soma / friends.length).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: SizedBox(
            width: double.infinity,
            height: 400,
            child: Consumer<FriendRepository>(
              builder: (context, repository, _) {
                final friendsList = repository.friends;
                return Card(
                  elevation: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${friendsList.length}', style: const TextStyle(fontSize: 40)),
                      const Text('Invisible Friends'),
                      const SizedBox(height: 12),
                      Text(valorMedio(friendsList), style: const TextStyle(fontSize: 40)),
                      const Text('É o valor médio da coleção'),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: OutlinedButton(
                          onPressed: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage())),
                          child: const Text('Lista de Amigos'),
                        ),
                      ),
                      // TextFormField(
                      //   initialValue: texto.value,
                      //   onChanged: (value) => texto.value = value,
                      // ),
                      // ValueListenableBuilder(
                      //   valueListenable: texto,
                      //   builder: (context, String valor, _) => Text(valor),
                      // ),
                      // ValueListenableBuilder(
                      //   valueListenable: texto,
                      //   builder: (context, String valor, _) => Text('${valor.length} caracteres'),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
