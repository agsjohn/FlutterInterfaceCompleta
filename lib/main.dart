import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 21, 173, 243)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Interface completa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textoNovo = "";
  String textoAtual = "";

  void enviar() {
    setState(() {
      textoAtual = textoNovo;
    });
  }

  void clica(String texto) {
    setState(() {
      textoNovo = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(30),
              child: TextField(
                onSubmitted: (value) => clica(value),
              ),
            ),
            ElevatedButton(
              onPressed: enviar,
              child: const Text("Clique"),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: Text(textoAtual))
          ],
        ),
      ),
    );
  }
}
