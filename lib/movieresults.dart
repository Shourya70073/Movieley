import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'loadingresult.dart';

class results extends StatefulWidget {
  var re;
  results({@required this.re});

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
  List p = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    p = widget.re;
    
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies",
      home: Scaffold(
        appBar: AppBar(
          title: Text('RELATED MOVIES'),
          elevation: 3,
          backgroundColor: Color(0xFFFe50914),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://assets.nflxext.com/ffe/siteui/vlv3/c732cb00-be61-4d64-b8c3-99f022e7a123/eceef24d-4920-430f-988b-d2f48f8ad060/IN-en-20220620-popsignuptwoweeks-perspective_alpha_website_medium.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: p.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: (Container(
                          padding: EdgeInsets.all(20),
                          height: 500,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                p[index]["title"] +
                                    " " +
                                    p[index]["description"],
                                style: TextStyle(
                                    color: Color(0xFFFe50914),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 300,
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(p[index]["image"]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return loadingresult(id:p[index]["id"]);
                                    }),
                                  );
                                },
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                color: Color(0xFFFe50914),
                                child: Text(
                                  "Details",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                height: 10,
              )
            ],
          ),
        )),
      ),
    ));
  }
}
