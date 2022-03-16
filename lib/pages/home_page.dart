import 'package:flutter/material.dart';
import 'package:flutter_nft/models/friend.dart';
import 'package:flutter_nft/repositories/friend_repository.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Friend> friendsList = FriendRepository.friends;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invisible Friends NFT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.separated(
          itemBuilder: (context, int index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/${friendsList[index].id}.gif'),
              ),
              title: Row(
                children: [
                  const Icon(Icons.star),
                  Text('Friend # ${friendsList[index].id}'),
                ],
              ),
              subtitle: Text('${friendsList[index].value} ETH'),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: friendsList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
