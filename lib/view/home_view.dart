import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  final temp;
  final desc;
  final humidity;
  final windSpeed;
  final pressure;
  final main;

  HomeView(this.temp, this.desc, this.humidity, this.windSpeed, this.pressure, this.main);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Batangas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                this.temp != null ? (this.temp - 273.15).toStringAsFixed(2) + '\u00B0C' : "Please wait",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Text(
                this.main != null ? this.main.toString() : "Please wait",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              ListTile(
                leading: FaIcon(FontAwesomeIcons.temperatureLow),
                title: Text('Temperature'),
                trailing: Text(
                    this.temp != null ? (this.temp - 273.15).toStringAsFixed(2)+"\u00B0C" : "Please wait"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.cloud),
                title: Text('Weather'),
                trailing: Text(
                    this.desc != null ? this.desc.toString() : "Please wait"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.radiation),
                title: Text('Humidity'),
                trailing: Text(this.humidity != null
                    ? this.humidity.toString()
                    : "Please wait"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.wind),
                title: Text('Wind Speed'),
                trailing: Text(this.windSpeed != null
                    ? this.windSpeed.toString()
                    : "Please wait"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.yarn),
                title: Text('Pressure'),
                trailing: Text(this.pressure != null
                    ? this.pressure.toString()
                    : "Please wait"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
