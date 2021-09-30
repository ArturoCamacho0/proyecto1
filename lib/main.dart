import 'package:flutter/material.dart';
import 'package:proyecto/pages/segunda_pagina.dart';

// En este metodo nosotros vamos a devolver un widget de texto que ira aumentando
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

// Dentro de este metodo vamos a tener el boton que al presionarlo incrementeara el contador
class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
}

// Aqui creamos el metodo de contador que va a traer el metodo counter state que aumentara el contador
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

// Creamos un metodo con estado, para que pueda cambiar el valor dinamicamente
class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterIncrementor(onPressed: _increment),
        const SizedBox(width: 16),
        CounterDisplay(count: _counter),
      ],
    );
  }
}


// Dentro del main va a iniciar nuestra aplicacion
void main() {
  runApp(
    const MaterialApp(
      title: 'Proyecto departamental',
      home: ProyectoDepartamental(),
    ),
  );
}

// Ahora si creamos toda nuestra aplicacion para el contador
class ProyectoDepartamental extends StatelessWidget {
  const ProyectoDepartamental({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'menu general',
          onPressed: null,
        ),
        title: const Text('Proyecto departamental'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'buscar',
            onPressed: null,
          ),
        ],
      ),
      body: const Center(
        child: Counter(),
      ),
			// Con el floating button podremos cambiar de pagina dentro del onpressed
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF0F735F),
        tooltip: 'Cambiar',
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => SegundaPagina()));
        },
        label: const Text('Segunda página'),
        icon: const Icon(Icons.thumb_up),
      ),
    );
  }
}
