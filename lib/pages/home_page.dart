import 'package:flutter/material.dart';
import 'package:flutter_nft/models/friend.dart';
import 'package:flutter_nft/pages/add_friend_page.dart';
import 'package:flutter_nft/pages/friend_page.dart';
import 'package:flutter_nft/repositories/friend_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FriendRepository friendsRepository;
  List<Friend> friendsList = [];
  List<bool> checkboxes = [];

  @override
  void initState() {
    super.initState();
    friendsRepository = FriendRepository();
    friendsList = friendsRepository.friends;
    checkboxes = List.generate(friendsList.length, (_) => false);
  }

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
        builder: (_) => AddFriendPage(
          friendsRepository: friendsRepository,
          onSave: refreshFriends,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  refreshFriends() {
    setState(() {
      friendsList = friendsRepository.friends;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Friend cadastrado!')),
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
        child: ListView.separated(
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
              trailing: Checkbox(
                value: checkboxes[index],
                onChanged: (value) => setState(() => checkboxes[index] = value!),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: friendsList.length,
        ),
      ),
    );
  }
}
