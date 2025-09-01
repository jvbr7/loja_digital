import 'package:app_loja_digital/screens/base/login/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_loja_digital/common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = context.read<PageController>();

    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children : <Widget>[
        // Página 0 - Login
        LoginScreen(),

        // Página 1 - Produtos
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text('Produtos'),
          ),
          body: Center(child: Text('Tela Produtos')),
        ),

        // Página 3 - Configurações
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text('Pedidos'),
          ),
          body: Center(child: Text('Meus pedidos')),
        ),

        // Página 4 - Lojas
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text('Lojas'),
          ),
          body: Center(child: Text('Tela das Lojas')),
        ),
      ],
    );
  }
}