import 'package:flutter/material.dart';
import 'package:flutterrealtimechatsockets/features/home/domain/entities/user.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final usuarios = [
    User(online: true, email: 'test1@test.com', name: "nombre1", uid: "1"),
    User(online: false, email: 'test2@test.com', name: "nombre2", uid: "2"),
    User(online: true, email: 'test3@test.com', name: "nombre3", uid: "3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Nombre'),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.exit_to_app,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            // child: const Icon(Icons.check_circle, color: Colors.green,),
            child: const Icon(
              Icons.offline_bolt,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, i) => ListTile(
                title: Text(usuarios[i].name),
                leading: CircleAvatar(
                  child: Text(usuarios[i].name.substring(0, 2)),
                ),
                trailing: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: usuarios[i].online ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
          separatorBuilder: (_, i) => const Divider(),
          itemCount: usuarios.length),
    );
  }
}
