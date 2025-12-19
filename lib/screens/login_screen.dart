import 'package:flutter/material.dart';
import '../main.dart'; // Para acessar a SelecaoTipoUsuario

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bem-vindo ao Chama Chapa", 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(labelText: "E-mail", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () { /* Lógica de Login */ },
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Text("ENTRAR"),
              ),
              TextButton(
                onPressed: () {
                  // Navegação para a tela de escolha (Chapa ou Empresa)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelecaoTipoUsuario()),
                  );
                },
                child: const Text("Não tem conta? Clique aqui para Registrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}