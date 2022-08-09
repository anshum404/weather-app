import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String city="Indore";
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;

  void startApp(String city) async {
    worker instance = worker(location:city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon= instance.icon;

    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temp,
      "hum_value": hum,
      "air_speed_value": air_speed,
      "des_value": des,
      "main_value": main,
      "icon_value":icon,
      "city_value":city,
    });
    });

   
  }

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? search =
    ModalRoute.of(context)!.settings.arguments as Map;
 
 if(search?.isNotEmpty?? false)
 {
 city=search['searchText'];
 }
    
startApp(city);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("images/mlogo.png", height: 240, width: 240),
        Text(
          " Weather App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white     
            
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Made By Anshum Mittal",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white 
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SpinKitWave(
          color: Colors.orange[300],
          size: 50.0,
        ),
      ],
    )
    ),
    backgroundColor: Colors.blue[400],
    );
  }
}
