import 'package:flutter/material.dart';
import 'package:flutter_nft/models/friend.dart';

class FriendPage extends StatelessWidget {
  final Friend friend;

  const FriendPage({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: friend.background,
      appBar: AppBar(
        title: Text('Friend #${friend.id}'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Hero(
                tag: 'friend_${friend.id}',
                child: Image.asset('assets/images/${friend.id}.gif'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '${friend.value} ETH',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_reaction_outlined),
                      title: Text(friend.eyes),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.back_hand),
                      title: Text(friend.sleeves),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.emoji_emotions_outlined),
                      title: Text(friend.hat),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.accessibility),
                      title: Text(friend.upperBody),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.chevron_left),
                      title: Text(friend.leftArm),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.chevron_right),
                      title: Text(friend.rightArm),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.sports_martial_arts),
                      title: Text(friend.legs),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                      leading: const Icon(Icons.snowshoeing),
                      title: Text(friend.feet),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
