import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State <MyLocation> {
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgImg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0,60.0,10.0,0),
          child: Column(
            children: <Widget> [
              SizedBox(height: 60.0),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_city_rounded,
                    color: Colors.white,
                  ),
                  labelText: 'Enter a city',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: new BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onSubmitted: (string) {
                  setState(() {
                    city = string;
                  });
                }
              ),
              SizedBox(height: 30.0),
              TextButton(
                onPressed: () async {
                  Weather I = Weather(location: city.toString());
                  await I.getWeather();
                  Navigator.pop(context, {
                    'location': I.location,
                    'weather': I.weather,
                    'temp': I.temp,
                  });
                },
                child: Text(
                  'GET WEATHER',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
