import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 0,
          shadowColor: Colors.transparent,
        ),
        body: HomePage(),
      ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(builder: (context, model, child) {
       return Column(
        children: [
          Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.clear, size: 40,color: Colors.grey,),
              SizedBox(width: 20),
              SizedBox(
                width: 270,
                height: 10,
                child: LinearProgressIndicator(
                  value: 0.05,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              SizedBox(width: 15),
              Icon(Icons.favorite, color: Colors.red),
              SizedBox(width: 5),
              Text('5',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 6,),
          Row(
            children: [
              SizedBox(width: 8),
              Icon(Icons.stars, color: Colors.purple[400], size: 35,),
              SizedBox(width: 5),
              Text('NEW WORD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[400],
                ),)
            ],
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Which of these is "coffee"?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 510,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(13),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(8),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      ),
                      color: model.buttonColor4,
                      onPressed: () {
                        model.changeButtonColor4();
                      },
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 40),
                          Image.asset('images/milk.jpg', cacheHeight: 110, cacheWidth: 100,),
                          SizedBox(height: 40),
                          Text('Milch',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      ),
                      color: model.buttonColor3,
                      onPressed: () {
                        model.changeButtonColor3();
                      },
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 40),
                          Image.asset('images/bread.jpg', cacheHeight: 110, cacheWidth: 100,),
                          SizedBox(height: 40),
                          Text('Brot',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      ),
                      color: model.buttonColor2,
                      onPressed: () {
                        model.changeButtonColor2();
                      },
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 40),
                          Image.asset('images/water.png', cacheHeight: 110, cacheWidth: 100,),
                          SizedBox(height: 40),
                          Text('Wasser',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )
                      ),
                      color: model.buttonColor1,
                      onPressed: () {
                        model.changeButtonColor1();
                      },
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 40),
                          Image.asset('images/coffee.png', cacheHeight: 110, cacheWidth: 100,),
                          SizedBox(height: 40),
                          Text('Kaffee',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.grey[400],
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )
                  )
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        height: 150,
                        color: Colors.lightGreen[200],
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Nicely done!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[700],
                                      ),),
                                  ),
                                ),
                                SizedBox(width: 230),
                                Icon(Icons.outlined_flag, color: Colors.green[700],)
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 40,
                              width: 350,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green[400],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: Text('CONTINUE'),
                              ),
                            )
                          ],
                        )
                    );
                  },
                );
              },
              child: Text('CHECK',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                    fontSize: 15
                ),
              ),
            ),
          ),
        ],
      );
    }
    );
  }
}