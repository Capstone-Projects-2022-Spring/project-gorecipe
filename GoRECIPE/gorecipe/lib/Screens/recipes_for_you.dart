import 'package:flutter/material.dart';

//linked to the finish scan button on scan page

class RecipesYou extends StatefulWidget {
  const RecipesYou({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<RecipesYou> createState() => _RecipesYou();
}

class _RecipesYou extends State<RecipesYou> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  List<bool> selected = <bool>[];

  List<String> recipes = [
    "test",
    "test2",
    "test",
    "test2",
    "test",
    "test2",
    "test",
    "test2"
  ];

  @override
  initState() {
    for (var i = 0; i < recipes.length; i++) {
      selected.add(false);
    }
    super.initState();
  }

  ImageIcon firstIcon = const ImageIcon(
    AssetImage('images/star.png'),
    size: 20,
  );

  ImageIcon secondIcon = const ImageIcon(
    AssetImage('images/unstar.png'),
    size: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes For You'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: recipes.length,
          // The list items
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: index == 0
                      ? const Border() // This will create no border for the first item
                      : Border(
                          top: BorderSide(
                              width: 1,
                              color: Theme.of(context)
                                  .primaryColor)), // This will create top borders for the rest
                ),
                child: ListTile(
                    title: Text(recipes[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: selected.elementAt(index)
                              ? firstIcon
                              : secondIcon,
                          iconSize: 200,
                          onPressed: () {
                            //send to My Cookbook
                            setState(() {
                              selected[index] = !selected.elementAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RecipesYou()), //change to recipe info
                        )));
          },
        ),
      ),
    );
  }
}
