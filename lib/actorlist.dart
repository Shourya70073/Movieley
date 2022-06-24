import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActorList extends StatefulWidget {
  var actor;
  ActorList({@required var ac}) {
    actor = ac;
  }

  @override
  State<ActorList> createState() => _ActorListState();
}

class _ActorListState extends State<ActorList> {
  List actor = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actor = widget.actor;
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ACTOR LIST",
      home: Scaffold(
        appBar: AppBar(
          title: Text('A C T O R S'),
          elevation: 3,
          backgroundColor: Color(0xFFFe50914),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://assets.nflxext.com/ffe/siteui/vlv3/c732cb00-be61-4d64-b8c3-99f022e7a123/eceef24d-4920-430f-988b-d2f48f8ad060/IN-en-20220620-popsignuptwoweeks-perspective_alpha_website_medium.jpg"),
                  fit: BoxFit.cover)),
          child: ListView.builder(
              itemCount: actor.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: (Container(
                    padding: EdgeInsets.all(12),
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name- " + actor[index]["name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Character- " + actor[index]["asCharacter"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.network(actor[index]["image"])),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
                );
              })),
        ),
      ),
    ));
  }
}
