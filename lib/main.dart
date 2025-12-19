import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SelecaoTipoUsuario(),
    debugShowCheckedModeBanner: false,
  ));
}

class SelecaoTipoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "CHAMA CHAPA",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 50),
          Text("Como você quer usar o app?"),
          SizedBox(height: 20),
          // Botão para o Trabalhador (Chapa)
          ElevatedButton(
            onPressed: () { Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => LoginScreen(tipoUsuario: 'Chapa')),
);},
            child: Text("SOU TRABALHADOR (CHAPA)"),
            style: ElevatedButton.styleFrom(minimumSize: Size(250, 50)),
          ),
          SizedBox(height: 10),
          // Botão para a Empresa
          OutlinedButton(
            onPressed: () { Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => LoginScreen(tipoUsuario: 'Empregador')),
); },
            child: Text("SOU EMPREGADOR"),
            style: OutlinedButton.styleFrom(minimumSize: Size(250, 50)),
          ),
        ],
      ),
    );
  }
}