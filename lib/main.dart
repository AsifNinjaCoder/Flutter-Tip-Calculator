import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tip Calculator",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  num billAmount = 0,
      people = 1,
      tipPercentage = 0,
      tipAmount = 0,
      totalAmount = 0;

  void tipDecerement() {
    if (tipPercentage > 0) {
      setState(() {
        tipPercentage--;
      });
    }
  }

  void tipIncerement() {
    setState(() {
      tipPercentage++;
    });
  }

  void peopleDecerement() {
    if (people > 1) {
      setState(() {
        people--;
      });
    }
  }

  void peopleIncerement() {
    setState(() {
      people++;
    });
  }

  void calculate() {
    if (people == 1) {
      setState(() {
        tipAmount =
            num.parse((billAmount * (tipPercentage / 100)).toStringAsFixed(2));
        totalAmount = num.parse((billAmount + tipAmount).toStringAsFixed(2));
      });
    } else {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        tipAmount = num.parse((tipAmount / people).toStringAsFixed(2));
        totalAmount =
            num.parse((billAmount + tipAmount * people).toStringAsFixed(2));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 134, 249),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "tip.jpg",
                height: 200,
                width: 200,
              ),
              Text(
                "Tip Calculator",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 239, 240, 244),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (val) {
                  billAmount = double.parse(val);
                },
                decoration: InputDecoration(hintText: "Enter Your Bill Amount"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Tip",
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 240, 244),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        tipDecerement();
                      },
                      child: Icon(Icons.remove_circle)),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${tipPercentage} %",
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 240, 244),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        tipIncerement();
                      },
                      child: Icon(Icons.add_circle)),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "People",
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 240, 244),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        peopleDecerement();
                      },
                      child: Icon(Icons.remove_circle)),
                  SizedBox(
                    width: 8,
                  ),
                  Text("${people}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 239, 240, 244),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        peopleIncerement();
                      },
                      child: Icon(Icons.add_circle)),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (billAmount > 0) {
                    calculate();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(171, 19, 0, 115),
                      borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 239, 240, 244),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              tipAmount != 0
                  ? Text(
                      "Tip: ${tipAmount} per person",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 239, 240, 244),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              totalAmount != 0
                  ? Text(
                      "Total Amount: ${totalAmount}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 239, 240, 244),
                      ),
                    )
                  : Container(),
            ],
          )),
    );
  }
}
