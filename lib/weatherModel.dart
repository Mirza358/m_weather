class Weather {
  var cityname;
  var date;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var sunrise;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var sunset;

   Weather(
      {required this.cityname,
      required this.date,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.sunrise,
      required this.gust,
      required this.uv,
      required this.pressure,
      required this.pricipe,
      required this.sunset}
      );

   Weather.fromJson(Map<String, dynamic> json) {
      cityname = json["address"];
      date = json["days"][0]["datetime"];
      icon = json["days"][0]['icon'];
      condition = json["days"][0]['conditions'];
      temp = json["days"][0]['temp'];
      wind = json["days"][0]['windspeed'];
      humidity = json["days"][0]['humidity'];
      sunrise = json["days"][0]['sunrise'];
      gust = json["days"][0]['windgust'];
      uv = json["days"][0]['uvindex'];
      pressure = json["days"][0]['pressure'];
      pricipe = json["days"][0]['precip'];
      sunset = json["days"][0]['sunset'];

  }
}
