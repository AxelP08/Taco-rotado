import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';

void main() => runApp(TacoRotado());

class TacoRotado extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State {

  AccelerometerEvent posicion;
  double alto;
  double ancho;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Taco rotado"),
          ),
          body:
          Center(
              child:
              Container(
                child:
                Image.asset('img/taco.jpg', width: ancho, height: alto),
                transform: Matrix4.rotationZ((pi / 180) * posicion.x.round() * 10),
              )
          )
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        posicion = event;
        //30 como factor para multiplicar el tamaño de la imagen respecto al valor medido del sensor.
        ancho = event.y * 30;
        //La imagen original mide 315 * 481 lo que da una proporción de 1.5269 del alto respecto al ancho.
        alto = ancho * 1.5269;
      });
    });
  }

}