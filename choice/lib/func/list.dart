import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var titleList = [
    '슬기짜기',
    '팔레트',
    '하향',
    '소울',
    '한검',
    'CCC',
    'DFC',
    'H-Millan',
    '오케스트라'
  ];

  var description = [
    '# 동아리',
    '# 동아리',
    '# 동아리',
    '# 동아리',
    '# 동아리',
    '# 동아리',
    '# 동아리',
    '# 동아리',
    '# 동아리'
  ];

  var imageList = ['assets/images/1.png'];

  var likeList = [];

  get trailing => null;


  void showPopup(context, title, image, description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                    height: 30
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    Icon first_icon = Icon(Icons.favorite_border);
    Icon second_icon = Icon(Icons.favorite);
    final deviceHeight = MediaQuery.of(context).size.height;
    final standardDeviceHeight = 900;
    final deviceWidth = MediaQuery.of(context).size.width;
    final standardDeviceWidth = 400;
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: TextField(
                  onChanged: (value) {},
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'search',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: titleList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        debugPrint(titleList[index]);
                        showPopup(context, titleList[index], imageList[index],
                            description[index]);
                      },
                      child: Card(
                        color: Color(0xffF5F5F5),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                height:
                                    50 * (deviceHeight / standardDeviceHeight),
                                width:
                                    30 * (deviceWidth / standardDeviceWidth)),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 10 *
                                          (deviceHeight /
                                              standardDeviceHeight)),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 120 *
                                            (deviceWidth / standardDeviceWidth),
                                        child: Text(
                                          titleList[index],
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),

                                      SizedBox(
                                        width: 70 *
                                            (deviceWidth / standardDeviceWidth),
                                        child: Container(
                                          child: Text(
                                            description[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xffF28220)),
                                          ),
                                          //margin: const EdgeInsets.all(10.0),
                                          width: 100.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFEF0E3),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70 *
                                            (deviceWidth / standardDeviceWidth),
                                        child: Container(
                                          child: Text(
                                            description[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff3FD69F)),
                                          ),
                                          //margin: const EdgeInsets.all(10.0),
                                          width: 100.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xffE7FAF7),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),

                                      // color: Color(0xffFEF0E3) //주황 배경
                                      // color: Color(0xffE7FAF7) //초록 배경
                                      SizedBox(
                                        width: 35 *
                                            (deviceWidth / standardDeviceWidth),
                                      ),
                                      IconButton(
                                          icon: selected
                                              ? first_icon
                                              : second_icon,
                                          onPressed: () {
                                            try {
                                              // your code that you want this IconButton do
                                              setState(() {
                                                selected  = !selected;
                                              });
                                            } catch(e) {
                                              print(e);
                                            }
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 10 *
                                          (deviceHeight /
                                              standardDeviceHeight)),
                                ], //children
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '리스트',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '찜',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;

  Search(this.listExample);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
