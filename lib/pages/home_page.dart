import 'package:flutter/material.dart';
import 'package:flutter_nft/models/friend.dart';
import 'package:flutter_nft/pages/add_friend_page.dart';
import 'package:flutter_nft/pages/friend_page.dart';
import 'package:flutter_nft/repositories/friend_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  openFriendPage(Friend friend) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FriendPage(friend: friend)),
    );
  }

  addFriendPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddFriendPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invisible Friends NFT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addFriendPage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Consumer<FriendRepository>(builder: (context, friendsRepository, _) {
          final friendsList = friendsRepository.friends;
          return ListView.separated(
            itemBuilder: (context, int index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Hero(
                    tag: 'friend_${friendsList[index].id}',
                    child: Image.asset('assets/images/${friendsList[index].id}.gif'),
                  ),
                ),
                title: Text('Friend # ${friendsList[index].id}'),
                subtitle: Text('${friendsList[index].value} ETH'),
                onTap: () => openFriendPage(friendsList[index]),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: friendsList.length,
          );
        }),
      ),
    );
  }
}
