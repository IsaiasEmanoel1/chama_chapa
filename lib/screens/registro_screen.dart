import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegistroScreen extends StatefulWidget {
  final String tipo; // 'Chapa' ou 'Empresa'
  const RegistroScreen({super.key, required this.tipo});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  File? _image;
  final _formKey = GlobalKey<FormState>();
  
  // Controladores de Texto
  final _nomeController = TextEditingController();
  final _docController = TextEditingController(); // CPF ou CNPJ
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _dataNascController = TextEditingController(); // Só para chapa

  // Função para pegar foto da galeria
  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Erro ao selecionar imagem: $e"); // Evita crash na Web se der erro
    }
  }

  void _confirmarCadastro() {
    if (!_formKey.currentState!.validate()) return;
    
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, escolha uma foto de perfil.')),
      );
      return;
    }

    // Tela de Carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // AQUI ENTRARÁ O CÓDIGO DO FIREBASE DEPOIS
    // Por enquanto, apenas simula e volta para o login
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Fecha o loading
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cadastro realizado! Faça login.")),
      );
      Navigator.pop(context); // Volta para a tela anterior
      Navigator.pop(context); // Volta para o Login
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isChapa = widget.tipo == 'Chapa';

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de ${widget.tipo}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // BOLA BRANCA DA FOTO
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Toque para adicionar foto", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),

              // CAMPOS DO FORMULÁRIO
              TextFormField(
                controller: _nomeController,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                decoration: InputDecoration(
                  labelText: isChapa ? "Nome Completo" : "Nome da Empresa",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _docController,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: isChapa ? "CPF" : "CNPJ",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.badge),
                ),
              ),
              const SizedBox(height: 15),

              // Só mostra Data de Nascimento se for Chapa
              if (isChapa) ...[
                TextFormField(
                  controller: _dataNascController,
                  validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: "Data de Nascimento",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 15),
              ],

              TextFormField(
                controller: _enderecoController,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                decoration: const InputDecoration(
                  labelText: "Endereço Completo",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _emailController,
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: _senhaController,
                validator: (v) => v!.length < 6 ? 'Mínimo 6 caracteres' : null,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 40),

              // BOTÃO CONFIRMAR
              ElevatedButton(
                onPressed: _confirmarCadastro,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isChapa ? Colors.green : Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "CONFIRMAR CADASTRO",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}