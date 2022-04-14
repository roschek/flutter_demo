import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather', style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: ()=>{},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: ()=>{},
          )
        ],
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: const _buildBody(),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _headerImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _temperature(),
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                    child: _temperatureForecast(),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _footerRatings(),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}


Image _headerImage() {
  return const Image(
    image: NetworkImage('https://avatars.mds.yandex.net/get-zen_doc/1705212/pub_5e8b00e88346f1146a1cbad4_5e8b01076d65037223408b6d/scale_1200'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        'Tuesday - 14 april 2022', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
          " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi", style: TextStyle(color: Colors.black54, fontSize: 20))
   ],
  );
}

Row _temperature() {
  return Row (
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: const [
          Icon(Icons.wb_sunny, color: Colors.yellow)
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        children: [
          Row(
            children: const [
              Text('15°, Clear', style: TextStyle(color: Colors.deepPurple),)
            ],
          ),
          Row(
            children: const [
              Text('St-Petersburg, Russia', style: TextStyle(color: Colors.grey),)
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 15.0,
    children:
      List.generate(8, (int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            label: Text('${index + 20} °C', style: const TextStyle(fontSize:20),),
            avatar: Icon(
              Icons.wb_cloudy,
              color: Colors.blue.shade300
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color:Colors.grey)
            ),
            backgroundColor: Colors.grey.shade100,
          ),
        );
      })    ,
  );
}

Row _footerRatings() {
  var stars = Row(
    children: const [
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.yellow),
      Icon(Icons.star, size: 15, color: Colors.black)
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:  [
      const Text('Info  from openweathermap.org',
      style: TextStyle(fontSize: 15),
      ),
      stars
    ],
  );
}