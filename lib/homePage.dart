import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m_weather/weatherData.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  var client = WeatherData();
  var data;

  info() async {
    var formattedDate = formatter.format(now);
    data = await client.getData(formattedDate);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: (context, snapshot) {
          return Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.75,
                  width: size.width,
                  padding: EdgeInsets.only(top: 50),
                  margin: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(33, 47, 61, 1),
                        Color.fromRGBO(174, 214, 241, 1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.35, 0.60],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${data?.cityname}",
                        style: TextStyle(
                          color: Color.fromRGBO(192, 57, 43, 1),
                          fontSize: 35,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${data?.date}',
                        style: TextStyle(
                          color: Color.fromRGBO(192, 57, 43, 1),
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/${data?.icon}.png',
                        width: size.width * 0.4,
                        fit: BoxFit.fitHeight,
                      ),
                      /*Image.network('https:${data?.icon}'),*/
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${data?.condition}',
                        style: TextStyle(
                          color: Color.fromRGBO(192, 57, 43, 1),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Hubballi',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${data?.temp}°',
                        style: TextStyle(
                          color: Color.fromRGBO(192, 57, 43, 1),
                          fontSize: 75,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Hubballi',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/wind.png',
                                  width: size.width * 0.15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${data?.wind} km/h',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/humidity.png',
                                  width: size.width * 0.15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${data?.humidity}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Gust',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.gust} kp/h',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Pressure',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.pressure} hpa',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'UV',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.uv}',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Preciptation',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.pricipe} mm',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Sunrise',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.sunrise}',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'MavenPro',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Sunset',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'MavenPro',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.sunset}',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'MavenPro',
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
