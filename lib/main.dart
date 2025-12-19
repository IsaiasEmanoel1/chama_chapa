import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/registro_screen.dart'; 

void main() async {
  // Isso aqui é obrigatório para o Firebase funcionar
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChamaChapaApp());
}

class ChamaChapaApp extends StatelessWidget {
  const ChamaChapaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chama Chapa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Agora a primeira tela é o Login
      home: const LoginScreen(),
    );
  }
}

// Esta é a tela que pergunta se é Chapa ou Empresa
class SelecaoTipoUsuario extends StatelessWidget {
  const SelecaoTipoUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Isso centraliza horizontalmente e verticalmente
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400), // Limita largura na Web
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza no meio
            children: [
              const Text(
                "CHAMA CHAPA",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 50),
              const Text("Como você quer se registrar?"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroScreen(tipo: 'Chapa')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("SOU TRABALHADOR (CHAPA)", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroScreen(tipo: 'Empresa')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("SOU EMPRESA", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}