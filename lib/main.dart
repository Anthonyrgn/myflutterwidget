import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size : $size");
    print("plateform: $platform");
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon App basic"),
        leading: Icon(
            Icons.favorite),
        actions: [
          Icon(Icons.handyman),
          Icon(Icons.border_color),
        ],
        centerTitle: true,
        elevation: 7.5,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.cyan,
        // margin: EdgeInsets.all(10),
        // padding: EdgeInsets.only(top: 100, left: 30),
        child: Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(3),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Nom de l'image"),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        fromAsset(height: 200, width: size.width),
                        Padding(
                          padding: EdgeInsets.only(top: 150),
                          child: profilePicture(radius: 50),
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            Icon(Icons.verified_user),
                            Spacer(),
                            Text("Un autre element"),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.teal,
                      height: 10,
                      thickness: 1,
                    ),
                    Container(
                      color: Colors.teal,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          profilePicture(radius: 40),
                          // fromAsset(height: 90, width: 90),
                          Expanded(child: simpleText("Anthony Ringeisen")),
                        ],
                      ),
                    ),
                    fromNetwork(),
                    spanDemo(),
                    fromNetwork(),
                  ],
                ),
              ),
            ),
            elevation: 7,
            margin: EdgeInsets.all(10),
          )
        ),
      ),
    );
  }

  CircleAvatar profilePicture({double? radius}){
    return  CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      foregroundImage: AssetImage("images/beach.jpg"),
    );
  }

  Image fromNetwork(){
    return Image.network(
      "https://images.pexels.com/photos/1756086/pexels-photo-1756086.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      height: 200,
    );
  }

  Image fromAsset({double? height, double? width}){
    return Image.asset(
      "images/beach.jpg",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  Text simpleText(String text){
    return Text(
      text,
      style: TextStyle(
        color: Colors.red,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text spanDemo(){
    return Text.rich(
      TextSpan(
          text: "Salut",
          style: TextStyle(color: Colors.red),
          children: [
            TextSpan(
              text: "seconde style",
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            TextSpan(
                text: "A l'infini",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
            )
          ]
      ),
    );
  }
}


