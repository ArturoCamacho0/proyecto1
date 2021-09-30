import 'package:flutter/material.dart';
import 'package:proyecto/pages/lista_compras.dart';

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Esta es otra Pagina"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.teal;
                }
                return const Color(0xFF0F735F); // Use the component's default.
              },
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Regresar!'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF0F735F),
        tooltip: 'Cambiar',
        onPressed: ()=>{
          Navigator.push(
              context, MaterialPageRoute(builder: (context)=> ListShopping() )
          )
        },
        label: const Text('Lista de Compras'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}