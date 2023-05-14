import 'package:flutter/material.dart';
import 'package:lotie/delivery.dart';
import 'package:lotie/homescreen.dart';
import 'package:lotie/loading.dart';

import 'IA.dart';
import 'geo.dart';


class opciones extends StatelessWidget {
  final categories = [    {'title': 'Spotify', 'image': 'https://images.pexels.com/photos/5077404/pexels-photo-5077404.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},    {'title': 'IA', 'image': 'https://images.pexels.com/photos/97077/pexels-photo-97077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},    {'title': 'Pantallas de carga', 'image': 'https://images.pexels.com/photos/1521580/pexels-photo-1521580.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'}, {'title': 'Delivery', 'image': 'https://images.pexels.com/photos/2119903/pexels-photo-2119903.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'}, {'title': 'Geometry', 'image': 'https://images.pexels.com/photos/3293037/pexels-photo-3293037.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'}, ];


 


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text('Animaciones Lotie El3'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categorías',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Container(
              height: categories.length * 90.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    title: categories[index]['title']!,
                    image: categories[index]['image']!, onPressed: () 
                    {
                      

                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;

  CategoryCard({required this.title, required this.image, required Null Function() onPressed});

  void _navigateToCategory(BuildContext context) {
    switch (title) {
      case 'Spotify':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 'IA':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IA()),
        );
        break;
      case 'Pantallas de carga':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => loading()),
        );
        break;
      case 'Delivery':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => delivery()),
        );
        break;
        case 'Geometry':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => geo()),
        );
        break;
      default:
        // Si se selecciona una categoría no válida, no hacemos nada.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToCategory(context);
      },
      child: Container(
        height:100.0,
        margin: EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 247, 247),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}