class Carta{
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;
  final int inventario;

  const Carta({required this.id, required this.nombre, required this.precio, required this.imagen, required this.descripcion, required this.inventario});

}
final todos =[
  new Carta(id: 1, nombre: "Granadilla", precio: 1.000,imagen: "pic1.png", descripcion:'preparado', inventario: 20),
  new Carta(id: 2, nombre: "Banano", precio: 1.500,imagen: "pic2.png", descripcion:'preparado', inventario: 30),
  new Carta(id: 3, nombre: "Manzana", precio: 8.500,imagen: "pic3.png", descripcion:'preparado', inventario: 100),
  new Carta(id: 4, nombre: "Zanahoria", precio: 1.000,imagen: "pic4.png", descripcion:'preparado', inventario: 50),
  new Carta(id: 5, nombre: "Lechuga", precio: 2.000,imagen: "pic5.png", descripcion:'preparado', inventario: 70),
  new Carta(id: 6, nombre: "Tomate", precio: 2.000,imagen: "pic6.png", descripcion:'preparado', inventario: 10),
  new Carta(id: 7, nombre: "Pimenton", precio: 3.000,imagen: "pic7.png", descripcion:'preparado', inventario: 5),
  new Carta(id: 8, nombre: "Leche", precio: 5.000,imagen: "pic8.png", descripcion:'preparado', inventario: 25),
  new Carta(id: 9, nombre: "Queso", precio: 6.500,imagen: "pic9.png", descripcion:'preparado', inventario: 12),
  new Carta(id: 10, nombre: "Yogurt", precio: 10.000,imagen: "pic10.png", descripcion:'preparado', inventario: 24),
  new Carta(id: 11, nombre: "Quajada", precio: 7.000,imagen: "pic11.png", descripcion:'preparado',inventario: 200),
];
final platos =[
  new Carta(id: 1, nombre: "Granadilla", precio: 1.000,imagen: "pic1.png", descripcion:'preparado', inventario: 20),
  new Carta(id: 2, nombre: "Banano", precio: 1.500,imagen: "pic2.png", descripcion:'preparado', inventario: 30),
  new Carta(id: 3, nombre: "Manzana", precio: 8.500,imagen: "pic3.png", descripcion:'preparado',inventario: 100 ),
  new Carta(id: 4, nombre: "Zanahoria", precio: 1.000,imagen: "pic4.png", descripcion:'preparado', inventario: 50),
];
final bebidas =[
  new Carta(id: 5, nombre: "Lechuga", precio: 2.000,imagen: "pic5.png", descripcion:'preparado', inventario: 70),
  new Carta(id: 6, nombre: "Tomate", precio: 2.000,imagen: "pic6.png", descripcion:'preparado', inventario: 10),
  new Carta(id: 7, nombre: "Pimenton", precio: 3.000,imagen: "pic7.png", descripcion:'preparado', inventario: 5),
];
final postres =[
  new Carta(id: 8, nombre: "Leche", precio: 5.000,imagen: "pic9.png", descripcion:'preparado', inventario: 25),
  new Carta(id: 9, nombre: "Queso", precio: 6.500,imagen: "pic10.png", descripcion:'preparado', inventario: 12),
  new Carta(id: 10, nombre: "Yogurt", precio: 10.000,imagen: "pic11.png", descripcion:'preparado', inventario: 24),
  new Carta(id: 11, nombre: "Quajada", precio: 7.000,imagen: "pic12.png", descripcion:'preparado', inventario: 200),
];