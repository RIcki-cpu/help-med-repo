import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:help_med/model/models.dart';
import 'package:help_med/widgets/widgets.dart';

import '../db.dart';

class SwitchAccount extends StatefulWidget {
  const SwitchAccount({Key? key}) : super(key: key);

  @override
  State<SwitchAccount> createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  final boldStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final DataRepository repository =
        DataRepository(userid: arguments['userid']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Miembros'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: repository.getStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();

            return _buildList(context, snapshot.data?.docs ?? []);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addProfile();
        },
        tooltip: 'Añade un Miembro',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addProfile() {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return const AddProfileDialog();
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final profile = Profile.fromSnapshot(snapshot);

    return ProfileCard(profile: profile, boldStyle: boldStyle);
  }
}
