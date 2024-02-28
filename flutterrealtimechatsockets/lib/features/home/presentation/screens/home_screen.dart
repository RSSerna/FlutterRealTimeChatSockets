import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutterrealtimechatsockets/core/user/domain/entities/user.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = const [
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        header: const WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.amber),
          waterDropColor: Colors.amberAccent,
          refresh: Icon(Icons.abc, color: Colors.blue),
        ),
        child: _UserListViewWidget(usuarios: usuarios),
      ),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}

class _UserListViewWidget extends StatelessWidget {
  const _UserListViewWidget({
    super.key,
    required this.usuarios,
  });

  final List<User> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => UserTileWidget(user: usuarios[i]),
        separatorBuilder: (_, i) => const Divider(),
        itemCount: usuarios.length);
  }
}

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
