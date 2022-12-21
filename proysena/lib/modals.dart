import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proysena/pantallaCarta.dart';
import 'package:proysena/models/Carta.dart';
import 'package:get/get.dart';
import 'package:proysena/desktop.dart';

class secondPage extends StatelessWidget {
  const secondPage({Key? key, required this.cont}) : super(key: key);
  final int cont;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Hero(
                          tag: 'images/pic${cont + 1}.png',
                          child: Image.asset(
                            'images/pic${cont + 1}.png',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                        ),
                      ),
                      Text(
                        todos[cont].nombre,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "\$" + todos[cont].precio.toStringAsFixed(3),
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text("Cantidad: " + todos[cont].inventario.toStringAsFixed(0),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text('Sobre el producto',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      const SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur '
                            'adipiscing elit, sed do eiusmod tempor '
                            'incididunt ut labore et dolore magna '
                            'aliqua. Ut enim ad minim veniam, quis '
                            'nostrud exercitation ullamco laboris nisi '
                            'ut aliquip ex ea commodo consequat. '
                            'Duis aute irure dolor in reprehenderit in '
                            'voluptate velit esse cillum dolore eu fugiat ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                ),
                                onPressed: () => null,
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: ElevatedButton(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 12.0),
                                      child: Text(
                                        'volver',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      primary: Colors.green,
                                    )))
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}