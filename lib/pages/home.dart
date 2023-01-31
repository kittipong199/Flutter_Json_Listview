import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/pages/model/cityweather.dart';
import 'package:weather/pages/services/city.dart';

class HomePate extends StatefulWidget {
  const HomePate({super.key});

  @override
  State<HomePate> createState() => _HomePateState();
}

class _HomePateState extends State<HomePate> {
  @override
  Widget build(BuildContext context) {
    getCityWeather();
    return Scaffold(
      appBar: AppBar(),

      body: FutureBuilder(
        future: getCityWeather(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // has error

          if (snapshot.hasError) {
            return Text("Error");
          }

          if (snapshot.hasData) {
            final json = snapshot.data!.body;

            final cityweather = cityweatherFromJson(json);

            return ListView(
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cityweather.name,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //image
                CircleAvatar(
                  foregroundImage: NetworkImage(
                      "https://openweathermap.org/img/wn/${cityweather.weather.first.icon}@2x.png"),
                ),
                Card(
                  shadowColor: Color.fromARGB(220, 6, 6, 6),
                  color: Color(0xFFFFB200),
                  child: Padding(
                    padding: const EdgeInsets.all(20.6),
                    child: Column(
                      children: [
                        Text("Clear"),
                        Text(cityweather.weather.first.description),
                        Text('${cityweather.main.temp}'),
                        Text('${cityweather.main.tempMin}'),
                        Text('${cityweather.main.tempMax}'),
                      ],
                    ),
                  ),
                ),

                //text

                //text
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),

      // body:
    );
  }
}
