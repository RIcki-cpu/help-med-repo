import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String serviceImage;
  final String serviceName;

  Service({
    required this.serviceImage,
    required this.serviceName,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0),
      child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(218, 98, 233, 202),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              //foto del servicio
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  serviceImage,
                  height: 90,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //titulo del servicio
              Text(
                serviceName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
