import 'package:proysena/carrito/Carrito.dart';
import 'package:proysena/models/Carta.dart';
import 'package:proysena/pantallaCarrito.dart';
import 'package:proysena/pantallainicio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proysena/pages/login_page.dart';
import 'package:proysena/pages/register_page.dart';
import 'package:proysena/auth/auth_page.dart';
import 'auth/main_page.dart';
import 'modals.dart';


class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();





  @override
  Widget build(BuildContext context){
    return Consumer<Carrito>(builder:(context, carrito, child){
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _globalKey,
          backgroundColor: Colors.lightGreen[800],
          appBar: AppBar(
            title: Text("CARTA"),
            backgroundColor: Colors.lightGreen[700],
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("TODOS"),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("FRUTAS"),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("VEGETAL"),
                  ),
                ),
                new Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("LACTEOS"),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        carrito.numeroItems!=0 ?
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext) => MainPage()
                        ))
                            :
                        const SnackBar(
                          content: Text("Llenar el carrito", textAlign: TextAlign.center,),
                        );
                      }
                  ),
                  new Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4)),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          carrito.numeroItems.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),),
                      )
                  )
                ],
              )
            ],
          ),
          drawer: menuLateral(),
          body: TabBarView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: todos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.4),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10,10)
                              )
                            ]
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Image.asset("images/"+todos[index].imagen),
                              Text(todos[index].nombre,style: TextStyle( fontWeight: FontWeight.bold, fontSize: (16)),),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("\$"+todos[index].precio.toStringAsFixed(3),style: TextStyle(fontSize: 16),),
                              ),
                              ElevatedButton.icon(
                                onPressed: (){
                                  setState(() {
                                    carrito.agregarItem(
                                      todos [index].id.toString(),
                                      todos [index].nombre,
                                      todos [index].precio,
                                      "1",
                                      todos [index].imagen,
                                      1,
                                      todos[index].inventario,
                                    );
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                                icon: Icon(Icons.add_shopping_cart),
                                label: Text("Agregar"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child:ElevatedButton(
                                  child:Text('Mas Info'),
                                  onPressed:() {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => secondPage(cont: index,)));

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: platos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.4),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10,10)
                              )
                            ]
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Image.asset("images/"+platos[index].imagen),
                              Text(platos[index].nombre,style: TextStyle( fontWeight: FontWeight.bold, fontSize: (16)),),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("\$"+platos[index].precio.toStringAsFixed(3),style: TextStyle(fontSize: 16),),
                              ),
                              ElevatedButton.icon(
                                onPressed: (){
                                  setState(() {
                                    carrito.agregarItem(
                                      platos [index].id.toString(),
                                      platos [index].nombre,
                                      platos [index].precio,
                                      "1",
                                      platos [index].imagen,
                                      1,
                                      platos[index].inventario,
                                    );
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                                icon: Icon(Icons.add_shopping_cart),
                                label: Text("Agregar"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child:ElevatedButton(
                                  child:Text('Mas Info'),
                                  onPressed:() {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => secondPage(cont: index,)));

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: bebidas.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.4),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10,10)
                              )
                            ]
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Image.asset("images/"+bebidas[index].imagen),
                              Text(bebidas[index].nombre,style: TextStyle( fontWeight: FontWeight.bold, fontSize: (16)),),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("\$"+bebidas[index].precio.toStringAsFixed(3),style: TextStyle(fontSize: 16),),
                              ),
                              ElevatedButton.icon(
                                onPressed: (){
                                  setState(() {
                                    carrito.agregarItem(
                                      bebidas [index].id.toString(),
                                      bebidas [index].nombre,
                                      bebidas [index].precio,
                                      "1",
                                      bebidas [index].imagen,
                                      1,
                                      bebidas [index].inventario,
                                    );
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                                icon: Icon(Icons.add_shopping_cart),
                                label: Text("Agregar"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child:ElevatedButton(
                                  child:Text('Mas Info'),
                                  onPressed:() {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => secondPage(cont: index,)));

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: postres.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.4),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10,10)
                              )
                            ]
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Image.asset("images/"+postres[index].imagen),
                              Text(postres[index].nombre,style: TextStyle( fontWeight: FontWeight.bold, fontSize: (16)),),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("\$"+postres[index].precio.toStringAsFixed(3),style: TextStyle(fontSize: 16),),
                              ),
                              ElevatedButton.icon(
                                onPressed: (){
                                  setState(() {
                                    carrito.agregarItem(
                                      postres [index].id.toString(),
                                      postres [index].nombre,
                                      postres [index].precio,
                                      "1",
                                      postres [index].imagen,
                                      1,
                                      postres[index].inventario,
                                    );
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                                icon: Icon(Icons.add_shopping_cart),
                                label: Text("Agregar"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child:ElevatedButton(
                                  child:Text('Mas Info'),
                                  onPressed:() {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => secondPage(cont: index,)));

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
class menuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("S E N A",style: TextStyle(fontSize: 30),),
            accountEmail: Text("mateomolano.herrera@gmail.com"),
            decoration: BoxDecoration(
                color: Colors.lightGreen[800]
            ),
          ),
          InkWell(
            child: new ListTile(
              title: Text("Inicio",style: TextStyle(color: Colors.black),),
              leading: Icon(Icons.home, color: Colors.black87,),
            ),
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext) => PantallaInicio()
                  )
              );
            },
          ),
          InkWell(
            child: new ListTile(
              title: Text("Carro De Compras", style: TextStyle(color: Colors.black),),
              leading: Icon(Icons.shopping_cart,color: Colors.black87,),
            ),
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext) => MainPage()
                  )
              );
            },
          ),
          InkWell(
            child: new ListTile(
              title: Text("Restaurante", style: TextStyle(color: Colors.black),),
              leading: Icon(Icons.account_box, color: Colors.black87,),
            ),
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext) => PantallaInicio()
                  )
              );
            },
          ),
          InkWell(
            child: new ListTile(
              title: Text("Menu", style: TextStyle(color: Colors.black),),
              leading: Icon(Icons.airplay, color: Colors.black87,),
            ),
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext) => Desktop()
                  )
              );
            },
          ),
        ],
      ),
    );
  }

}