import 'package:flutter/material.dart';
import 'package:flutter_nft/models/friend.dart';
import 'package:flutter_nft/repositories/friend_repository.dart';
import 'package:provider/provider.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final _formKey = GlobalKey<FormState>();
  final _valor = TextEditingController();
  String _eyes = '';

  salvar() {
    final friendsRepository = Provider.of<FriendRepository>(context, listen: false);
    //final friendsRepository = context.read<FriendRepository>();

    if (_formKey.currentState!.validate()) {
      friendsRepository.insert(
        Friend(
          id: friendsRepository.friends.length + 1,
          background: const Color(0XFFC1D7E5),
          eyes: _eyes,
          hat: 'Thinking',
          leftArm: 'Axe',
          rightArm: 'Swinging',
          upperBody: 'Grey White',
          sleeves: 'Long Sleeves',
          legs: 'Grey Sport',
          feet: 'Summer Day',
          value: double.parse(_valor.value.text),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Friend cadastrado!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Friend'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _valor,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  suffixText: 'ETH',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o valor!';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Eyes'),
                  ),
                  items: const [
                    DropdownMenuItem(child: Text('Black Nerd glasses'), value: 'Black Nerd glasses'),
                    DropdownMenuItem(child: Text('Googly Eyes'), value: 'Googly Eyes'),
                    DropdownMenuItem(child: Text('Nerd Ghost Glasses'), value: 'Nerd Ghost Glasses'),
                  ],
                  onChanged: (value) => _eyes = value ?? '',
                  validator: (value) {
                    if (value == null) {
                      return 'Selecione a propriedade Eyes.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: salvar,
                    child: const Text('Salvar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
