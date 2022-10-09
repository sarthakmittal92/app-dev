import 'package:flutter/material.dart';
import 'dart:convert';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State <City> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : jsonDecode(jsonEncode(ModalRoute.of(context)?.settings.arguments));
    print(data);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgImg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(3.0,60.0,3.0,0.0),
          child: Column(
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.near_me_rounded,
                      size: 50.0,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/reload');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'weather': result['weather'],
                          'temp': result['temp'],
                        };
                      });
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.location_city_rounded,
                      size: 50.0,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'weather': result['weather'],
                          'temp': result['temp'],
                        };
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 200.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data['temp'],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent,
                        ),
                      ),
                      Text(
                        data['weather'],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.yellowAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    color: Colors.grey[400],
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/${data['weather']}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150.0),
              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
