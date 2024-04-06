import 'package:flutter/material.dart';
import 'navegation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> pacientes = ['João da Silva', 'Maria Souza', 'Carlos Oliveira'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: pacientes.length,
        itemBuilder: (context, index) {
          final paciente = pacientes[index];
          return ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(paciente),
            subtitle: const Text('dd/mm'), // Substitua pela data real da sessão
          );
        },
      ),
      bottomNavigationBar: const NavigacaoBar());
      
  }
}
