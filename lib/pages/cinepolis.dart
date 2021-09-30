import 'package:flutter/material.dart';
// Importamos el main para regresar despues
import '../main.dart';

// Dentro de la clase Cinepolis estara la base de nuestra aplicacion
class Cinepolis extends StatelessWidget {
  const Cinepolis({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Cinépolis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Ecatepec de Morelos',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Color(0xFF0F735F),
          ),
          const Text('50'),
        ],
      ),
    );

    Color color = Colors.teal;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Llamar'),
        _buildButtonColumn(color, Icons.near_me, 'Ir'),
        _buildButtonColumn(color, Icons.share, 'Compartir'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Cinépolis es una empresa mexicana dedicada a la exhibición de películas'
            'fundada en 1971 en Morelia, Michoacán, bajo el nombre de Organización'
            'Ramírez. Hasta el 31 de mayo de 2021 operaban 871 conjuntos cinematográficos'
            'con 6,728 salas 100% digitales; 477 se ubican en México y 394 en países:'
            'Estados Unidos, Chile, Guatemala, Honduras, El Salvador, Costa Rica, Panamá, Colombia,'
            'Perú, Argentina, Brasil, España, India, Omán, Baréin, Arabia Saudita.1​2​3​'
            'e Indonesia convirtiéndose así en la compañía de exhibición cinematográfica'
            'más grande de México y América Latina, ocupando el tercer lugar en el mundo en'
            'número de salas, el segundo lugar en número de boletos vendidos y la cadena que'
            'más boletos por sala vende en el mundo.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Cinépolis'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/cinepolisportada.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF0F735F),
        tooltip: 'Cambiar',
        onPressed: () {
          Navigator.popUntil(
            context, ModalRoute.withName('/'),
          );
        },
        label: const Text('Inicio'),
        icon: const Icon(Icons.home),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}