import 'package:app_loja_digital/common/custom_drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerHeader(
            child: Text('Minha Loja Digital',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          DrawerTile(iconData: Icons.home, title: 'Início', page: 0),
          DrawerTile(iconData: Icons.list, title: 'Produtos', page: 1),
          DrawerTile(iconData: Icons.shopping_cart, title: 'Meus Pedidos', page: 2),
          DrawerTile(iconData: Icons.person, title: 'Lojas', page: 3),
        ],
      ),
    );
  }
}