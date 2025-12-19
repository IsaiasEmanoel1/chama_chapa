import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String tipoUsuario; // 'chapa' ou 'empregador'

  LoginScreen({required this.tipoUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login - $tipoUsuario")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true, // Esconde a senha
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Aqui depois vamos colocar a lógica de entrar
              },
              child: Text("Entrar"),
            ),
            TextButton(
              onPressed: () {
                // Aqui vamos levar para a tela de Cadastro que faremos depois
              },
              child: Text("Não tem conta? Cadastre-se"),
            )
          ],
        ),
      ),
    );
  }
}