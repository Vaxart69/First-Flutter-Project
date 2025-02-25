// Velasco, Ron Russell C. 
// 2023-03937
// CMSC 23 - Mobile Computing

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Initializing the images to be used in a list string.
  List<String> imageList = [
    'assets/gojo1.jpg',
    'assets/gojo2.jpg',
    'assets/gojo3.jpg',
    'assets/gojo4.jpg',
    'assets/gojo5.jpg',
    'assets/gojo6.jpg',
    'assets/gojo7.jpg',
    'assets/gojo8.jpg',
  ];

  int gridCount = 4; // initializing the grid count to 4
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // I disabled the debug banner
      home: Scaffold(

        // I set the bg for the scaffold
        backgroundColor: const Color(0xFFe6e5e7),

        // I created column that will serve as the main column that will contain the other widgets inside
        body: Column(
          children: [

            // Container child that will serve as the header of the profile
            Container(
              height: 150,
              color: Color(0xFFe6e5e7),

              // Put a padding to squeeze the contents in the container.
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),

                // Make the header 
                child: Row(
                  children: [

                    // Insert profile picture
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/gojodp.jpg"),
                    ),
                    SizedBox(width: 15), // Space 
                    Expanded( //make an expanded that will occupy the rest of the horizontal
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(top: 30),
                                child: Column(
                                  children: [
                                    Row( // I split the rows into smaller rows
                                      children: [
                                        Text(
                                          "Satoru Gojo",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(Icons.person_add),
                                        Spacer(),
                                        Text(
                                          "Edit Bio",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),

                            // set another row below for the posts, following, and followers.
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("$gridCount Posts", style: TextStyle(fontSize: 12)),
                                Text("123 Following", style: TextStyle(fontSize: 12)),
                                Text("999 Followers", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            Row(
                              children: [
                                //Icon(Icons.speech),
                                Text(
                                  "I am the chosen one.",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container( // Create another container below to place the icons 
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 2)),
                color: Color(0xFFe6e5e7),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Material(
                  color: Color.fromARGB(255, 229, 228, 231),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(children: [
                          Icon(
                            Icons.photo,
                            size: 30,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text("Posts",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                        ]),
                      ),
                      Expanded( //I used expanded on each to equally distribute them while making stretch dynamically
                        child: Column(children: [
                          Icon(
                            Icons.video_call,
                            size: 30,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text("Reels",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          Icon(
                            Icons.bookmark,
                            size: 30,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text("Saved",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          Icon(
                            Icons.grid_3x3,
                            size: 30,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text("Tagged",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              )),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded( 

              // I used an expanded to contain the gridview to make it fit the screen and allow scrolling.
              child: GridView.builder( // make the gridview builder to create the grids 
                  itemCount: gridCount,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      
                      
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 7, 89, 156),
                          image: DecorationImage(
                              image: AssetImage(
                                // Here I wrapped the index of the image to the current length to loop it 
                                  imageList[index % imageList.length]),
                              fit: BoxFit.cover),
                          
                        ),
                      
                    );
                  }),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            "@satorugojo",
            style: TextStyle(
              color: Color(0xFFDEFAFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF382B58),
          elevation: 0,
        ),

        //set the button and set state. the grid count is incremented by 4 everytime the plus sign is pressed.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              gridCount += 4;
            });
          },
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
