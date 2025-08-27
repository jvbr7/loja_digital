import 'package:app_loja_digital/common/custom_drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerTile(iconData: Icons.home, title: 'Inicio',),
          DrawerTile(iconData: Icons.list, title: 'Produtos',),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos',),
          DrawerTile(iconData: Icons.home, title: 'Lojas',),
        ],
      )
    );
  }
}