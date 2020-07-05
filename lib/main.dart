import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project2/Constants.dart';
import 'package:project2/Places.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      customBorder: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/profile.jpg'),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Hey James',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 17, color: kGrey),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Where would you like to travel today',
                  style: kGreetingsStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CategoryButton(
                        icon: Icons.flight,
                        color: kGreen,
                        onPressed: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        isSelected: currentIndex == 1),
                    CategoryButton(
                        icon: Icons.train,
                        color: kBlue,
                        onPressed: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        isSelected: currentIndex == 2),
                    CategoryButton(
                        icon: Icons.directions_boat,
                        color: kOrange,
                        onPressed: () {
                          setState(() {
                            currentIndex = 3;
                          });
                        },
                        isSelected: currentIndex == 3),
                    CategoryButton(
                        icon: Icons.directions_bus,
                        color: kYellow,
                        onPressed: () {
                          setState(() {
                            currentIndex = 4;
                          });
                        },
                        isSelected: currentIndex == 4),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Top Destinations',
                  style: kTopHeadingStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                      itemCount: places.length,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      crossAxisCount: 4,
                      itemBuilder: (context, index) {
                        return PlaceContainer(
                          index: index,
                        );
                      },
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.count(2, index.isEven ? 3 : 2);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceContainer extends StatelessWidget {
  final int index;

  PlaceContainer({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
              places[index].imgPath,
            ),
            fit: BoxFit.cover,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            places[index].name,
            style: kPlaceStyle,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.pin_drop,
                color: Colors.white,
                size: 20,
              ),
              Expanded(
                child: Text(
                  places[index].place,
                  style: kPlaceStyle,
                ),
              )
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: kGrey,
                  size: 20,
                ),
                Text(
                  places[index].rating.toString(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function onPressed;
  final bool isSelected;

  CategoryButton({this.icon, this.color, this.onPressed, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      fillColor: isSelected ? color.withAlpha(100) : kLightGrey,
      constraints: BoxConstraints.tightFor(
        width: 70,
        height: 75,
      ),
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
    );
  }
}
