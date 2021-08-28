import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DuoLing(),
    );
  }
}

class DuoLing extends StatefulWidget {
  DuoLing({Key? key}) : super(key: key);

  @override
  _DuoLingState createState() => _DuoLingState();
}

class _DuoLingState extends State<DuoLing> {
  int chooseNumber = 0;

  Widget GridTileView (String pictureurl, String text, int itemNumber) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          chooseNumber = itemNumber;
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: (() {
              if (chooseNumber == itemNumber) {
                return Colors.lightBlue.withOpacity(0.2);
              } else {
                return Colors.white;
              }
            })(),
            borderRadius: BorderRadius.circular(10),
            border: (() {
              if (chooseNumber == itemNumber) {
                return Border.all(width: 1.5, color: Colors.lightBlue.withOpacity(0.3));
              } else {
                return Border.all(color: Colors.grey, width: 1.5);
              }
            })(),
          ),
          child: Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Image.asset(pictureurl)),
              Expanded(child: Container()),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(text),),
            ],
          ),
        ),
      ),
    );
  }

  Widget modal1() {
    return Container(
      color: Colors.lightGreen[200],
      height: 150,
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.all(8),
              child: Text('Nicely done!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
              ),
              ),
              Expanded(child: Container()),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.flag_outlined, color: Colors.green, size: 20,
                  ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CONTINUE'),
                ),
              ),
          ),
        ],
      ),
    );
  }
  Widget modal2() {
    return Container(
      color: Colors.redAccent,
      height: 150,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('one more try!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                  ),
              Expanded(child: Container()),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.flag_outlined, color: Colors.black, size: 20,
                  ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CONTINUE'),
                ),
              )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: (){},
                      child: Icon(Icons.close, color: Colors.grey, size: 40,)),
                ),
                Expanded(
                    child: Container(
                      height: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: (() {
                          if (chooseNumber == 4) {
                            return LinearProgressIndicator(
                              value: 0.1,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                            );
                          } else {
                            return LinearProgressIndicator(
                              value: 0.05,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                            );
                          }
                        })(),
                      ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(onTap: (){}, child: Icon(Icons.favorite, color: Colors.pink, size: 30,),
                    ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.stars, color: Colors.purple,),
                Text('NEW WORD',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Which of these is "coffee"?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(child: GridTileView('images/milk.jpg', 'Milch', 1)),
                    Expanded(child: GridTileView('images/bread.jpg', 'Brot', 2)),
                  ],
                ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(child: GridTileView('images/water.png', 'Wasser', 3)),
                    Expanded(child: GridTileView('images/coffee.png', 'Kaffee', 4)),
                  ],
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                        child: (() {
                          if (chooseNumber == 0) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                  )
                                )
                              ),
                                onPressed: null,
                                child: Text('CHECK',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                            );
                          } else if (chooseNumber == 1) {
                            return ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    enableDrag: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                      return modal2();
                                      }
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text('CHECK'),
                            );
                          } else if (chooseNumber == 2) {
                            return ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return modal2();
                                    }
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('CHECK'),
                            );
                          } else if (chooseNumber == 3) {
                            return ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return modal2();
                                    }
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('CHECK'),
                            );
                          } else {
                            return ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return modal1();
                                    }
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('CHECK'),
                            );
                          }
                        })(),
                    ),
                  ],
                ),
            ),
            SizedBox(height: 30),
          ],),
      ),
    );
  }
}