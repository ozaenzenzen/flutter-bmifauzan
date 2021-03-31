import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
    title: "BMI Calculator",
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final tinggiController = TextEditingController();
final beratController = TextEditingController();
String hitungBMI() {
  double tinggi = double.parse(tinggiController.text);
  double berat = double.parse(beratController.text);
<<<<<<< HEAD
=======
  if(tinggi>100){
    tinggi=tinggi/100;
  }
>>>>>>> ef6fcef5dffbc2fcc2e2fa7ca7542ccb8c762ab2
  double bmi = berat / (tinggi * tinggi);
  return bmi.toString();
}

String kategoriBMI(double hasilbmi) {
  double hasilbmi = double.parse(hitungBMI());
  String textbmi = "";
  if (hasilbmi < 18.5) {
    textbmi = "Kamu Termasuk Kurus";
  } else if (hasilbmi < 24.9) {
    textbmi = "Kamu Termasuk Ideal";
  } else if (hasilbmi < 29.9) {
    textbmi = "Kamu Termasuk Gemuk";
  } else {
    textbmi = "Kamu Termasuk Obesitas";
  }
  return textbmi;
}

class _HomeState extends State<Home> {
  String bmi = "";
  String kategori = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          "BMI Calculator by FAM",
          style: new TextStyle(
            color: Colors.white,
            fontFamily: "SF",
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.orange[400],
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              //margin: new EdgeInsets.symmetric(horizontal: 20),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Tinggi(),
                  new Berat(),
                  new Container(
                    margin:
                        new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: new ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[400],
                        minimumSize: Size(150, 40),
                      ),
                      child: new Text(
                        "Hitung",
                        style: new TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          bmi = hitungBMI();
                          kategori = kategoriBMI(double.parse(hitungBMI()));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  new Text("Hasil BMI kamu adalah : " + bmi),
                  new Text(kategori),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tinggi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          alignment: Alignment.centerLeft,
          margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: new Text(
            "Tinggi (meter):",
            style: new TextStyle(fontSize: 18),
          ),
        ),
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.orange[400], width: 3.0),
          ),
          child: new TextField(
            keyboardType: TextInputType.number,
            controller: tinggiController,
            decoration: InputDecoration(
              prefix: new Padding(
                padding: new EdgeInsets.only(left: 15),
              ),
              hintText: "Masukan Tinggi Anda (contoh: 1.75)",
              hintStyle: new TextStyle(
                fontSize: 18,
                fontFamily: "SF",
                color: Colors.black26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Berat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          alignment: Alignment.centerLeft,
          margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: new Text(
            "Berat (Kg):",
            style: new TextStyle(fontSize: 18),
          ),
        ),
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.orange[400], width: 3.0),
          ),
          child: new TextField(
            keyboardType: TextInputType.number,
            controller: beratController,
            decoration: InputDecoration(
              prefix: new Padding(
                padding: new EdgeInsets.only(left: 15),
              ),
              hintText: "Masukan Berat Anda",
              hintStyle: new TextStyle(
                fontSize: 18,
                fontFamily: "SF",
                color: Colors.black26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
