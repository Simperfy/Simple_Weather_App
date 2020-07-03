import 'package:Flutter_Weather_App/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  final url =
      'https://api.openweathermap.org/data/2.5/weather?id=1726280&appid=b740127616f5776b6a6c233715b9b8ae';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var desc;
  var humidity;
  var windSpeed;
  var pressure;
  var main; 
  Future getWeather() async {
    print("Getting data from " + widget.url);
    http.Response response = await http.get(widget.url);

    if (response.statusCode == 200) {
      print("API Request Success");
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        this.temp = jsonResponse['main']['temp'];
        this.desc = jsonResponse['weather'][0]['description'];
        this.humidity = jsonResponse['main']['humidity'];
        this.windSpeed = jsonResponse['wind']['speed'];
        this.pressure = jsonResponse['main']['pressure'];
        this.main = jsonResponse['weather'][0]['main'];
      });
    } else {
      print('API Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.deepOrange,
      ),
      body: HomeView(temp, desc, humidity, windSpeed, pressure, main),
    );
  }
}
