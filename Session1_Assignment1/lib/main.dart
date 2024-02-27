import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int bIndex=0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF05986A),
        leading: Icon(Icons.arrow_back),
        elevation: 0.0,
        actions: [
          Icon(Icons.menu)
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF05986A),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(200, 100),
                  bottomLeft: Radius.elliptical(200, 100)),
            ),
            child: Column(
              children: [
                boldText("Our Plants ", fontSize: 25),
                buildSizedBox10(),
                boldText("Hi! Saqlain let's do Assignment 1",
                    fontSize: 18),
                buildSizedBox10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    boldText("Price : \$77 ", fontSize: 14),
                    boldText("Size : Medium ", fontSize: 14),
                    boldText("Plant : Gimam ", fontSize: 14),
                  ],
                ),
                buildSizedBox10(),

                 Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     const CircleAvatar(
                       backgroundColor: Color(0xFF035B40),
                       child: Icon(Icons.arrow_back),
                     ),
                     Container(
                       height: 200,
                       width: 200,
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         borderRadius: BorderRadius.circular(15),
                         image: const DecorationImage(
                           fit: BoxFit.cover,
                           image: AssetImage(
                               "assets/images/plant.jpg"
                           ),
                         ),
                       ),
                     ),
                     const CircleAvatar(
                       backgroundColor: Color(0xFF035B40),
                       child: Icon(Icons.arrow_forward),
                     ),
                   ],
                 ),
              ],
            ),
          ),
          buildSizedBox10(),
          boldText("Explore More", fontSize: 30,color: Colors.black),
          buildSizedBox10(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15.0, right: 10),
                border:  OutlineInputBorder(borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: const Color(0xFFE9E9E9),
                suffixIcon: const Icon(Icons.search,color: Color(0xFF05986A),),
                hintText: "Search",
                hintStyle: const TextStyle(color: Color(0xFF05986A),)
              ),

            ),
          ),
          buildSizedBox10(),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));
            },
            child: Container(
              height: 250,
              margin: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context,index){
                return Container(
                  height: 200,
                  width: 150,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage(
                          "assets/images/plant.jpg"
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      boldText("Plant Name",color: Colors.black),
                      boldText("\$55",color: Colors.black)
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              bIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          currentIndex: bIndex,
          backgroundColor: const Color(0xFF05986A),
          items:  const [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                activeIcon: Icon(Icons.favorite),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store),
                activeIcon: Icon(Icons.location_on),
                label: " "),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.add_circle),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person),
                label: ""),
          ]),
    );
  }

  SizedBox buildSizedBox10() => const SizedBox(
        height: 10,
      );
}

Text boldText(String text, {double fontSize = 16, Color color = Colors.white}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
  );
}

Text labelText(String text, {double}) {
  return Text(
    text,
    style: const TextStyle(fontSize: 15),
  );
}

/// Screen 2


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF05986A),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        actions: [
          Icon(Icons.menu)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10,bottom: 30),
            decoration: const BoxDecoration(
              color: Color(0xFF05986A),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(300, 100),
                  bottomLeft: Radius.elliptical(300, 100)),
            ),
            child: Center(
              child: boldText("Details",fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText("Reviews",color: Colors.black),
                      const Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,size: 15,),
                          Icon(Icons.star,color: Colors.yellow,size: 15),
                          Icon(Icons.star,color: Colors.yellow,size: 15),
                          Icon(Icons.star,color: Colors.yellow,size: 15),
                          Icon(Icons.star,color: Colors.yellow,size: 15)
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText("Family",color: Colors.black),
                      boldText("Glimbarg",color:Colors.green),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText("Size",color: Colors.black),
                      boldText("Height: 62 Inc",color:Colors.green),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText("Category",color: Colors.black),
                      boldText("Indor",color:Colors.green),

                    ],
                  )
                ],
              ),
          ),
          Stack(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(200),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/plant.jpg"
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 250,
                bottom: 50,
                child: Container(
                height: 60,
                width: 300,
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: const Color(0xFF05986A),
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: boldText("Price: \$50",fontSize: 20),
              ),)
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: boldText("Details",color: Colors.black,fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 3.0),
            child: labelText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna"),
          )



          

        ],
      ),

      bottomNavigationBar: Container(
       height: 70,
        width: 20,
        color:Color(0xFF05986A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: boldText("Buy it Now",fontSize: 25,),
            ),
            Container(
              width: 100,
              height: 70,
              color: Color(0xFF035B40),
              child: Icon(Icons.favorite_outline_sharp,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
/*
* BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          backgroundColor: const Color(0xFF05986A),
          items:   [
            BottomNavigationBarItem(
                icon: boldText("Buy it Now",fontSize: 20),
                activeIcon: boldText("Buy it Now",fontSize: 20),
                label: " "),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF035B40),
                icon: Icon(Icons.favorite),
                activeIcon: Icon(Icons.favorite),
                label: ""),

          ]),*/