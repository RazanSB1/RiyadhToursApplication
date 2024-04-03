// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../mainpagesAR/plans_ar.dart';
import '../widgets/list_item.dart';
import 'plans.dart';

class PlanList extends StatelessWidget {
  PlanList({super.key});

  final List _page = [Plan1(), Plan2(), Plan3(), Plan4(), Plan5(), Plan6()];
  final List _title = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: ListView.builder(
          itemCount: _title.length,
          itemBuilder: (context, index) {
            return ListItem(
              page: _page[index],
              title: _title[index],
            );
          }),
    );
  }
}

class PlanListAR extends StatelessWidget {
  PlanListAR({super.key});

  final List _page = [
    Plan1AR(),
    Plan2AR(),
    Plan3AR(),
    Plan4AR(),
    Plan5AR(),
    Plan6AR()
  ];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
    "اليوم الثالث",
    "اليوم الرابع",
    "اليوم الخامس",
    "اليوم السادس"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _title.length,
        itemBuilder: (context, index) {
          return ListItemAR(
            page: _page[index],
            title: _title[index],
          );
        },
      ),
    );
  }
}

class PlanList1 extends StatelessWidget {
  PlanList1({super.key});

  final List _page = [Plan1()];
  final List _title = ["Day 1"];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '1',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList1AR extends StatelessWidget {
  PlanList1AR({super.key});

  final List _page = [
    Plan1AR(),
  ];
  final List _title = [
    "اليوم الأول",
  ];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '1',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList2 extends StatelessWidget {
  PlanList2({super.key});

  final List _page = [Plan1(), Plan2()];
  final List _title = ["Day 1", "Day 2"];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '2',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList2AR extends StatelessWidget {
  PlanList2AR({super.key});

  final List _page = [
    Plan1AR(),
    Plan2AR(),
  ];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
  ];


  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '2',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList3 extends StatelessWidget {
  PlanList3({super.key});

  final List _page = [Plan1(), Plan2(), Plan3()];
  final List _title = ["Day 1", "Day 2", "Day 3"];


  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '3',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList3AR extends StatelessWidget {
  PlanList3AR({super.key});

  final List _page = [
    Plan1AR(),
    Plan2AR(),
    Plan3AR(),
  ];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
    "اليوم الثالث",
  ];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '3',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList4 extends StatelessWidget {
  PlanList4({super.key});

  final List _page = [Plan1(), Plan2(), Plan3(), Plan4()];
  final List _title = ["Day 1", "Day 2", "Day 3", "Day 4"];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '4',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList4AR extends StatelessWidget {
  PlanList4AR({super.key});

  final List _page = [
    Plan1AR(),
    Plan2AR(),
    Plan3AR(),
    Plan4AR(),
  ];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
    "اليوم الثالث",
    "اليوم الرابع",
  ];


  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '4',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList5 extends StatelessWidget {
  PlanList5({super.key});

  final List _page = [Plan1(), Plan2(), Plan3(), Plan4(), Plan5()];
  final List _title = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5"];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '5',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList5AR extends StatelessWidget {
  PlanList5AR({super.key});

  final List _page = [Plan1AR(), Plan2AR(), Plan3AR(), Plan4AR(), Plan5AR()];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
    "اليوم الثالث",
    "اليوم الرابع",
    "اليوم الخامس"
  ];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '5',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList6 extends StatelessWidget {
  PlanList6({super.key});

  final List _page = [Plan1(), Plan2(), Plan3(), Plan4(), Plan5(), Plan6()];
  final List _title = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '6',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList6AR extends StatelessWidget {
  PlanList6AR({super.key});

  final List _page = [
    Plan1AR(),
    Plan2AR(),
    Plan3AR(),
    Plan4AR(),
    Plan5AR(),
    Plan6AR()
  ];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
    "اليوم الثالث",
    "اليوم الرابع",
    "اليوم الخامس",
    "اليوم السادس"
  ];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '6',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList7 extends StatelessWidget {
  PlanList7({super.key});

  final List _page = [
    Plan1(),
    Plan2(),
    Plan3(),
    Plan4(),
    Plan5(),
    Plan6(),
    Plan7()
  ];
  final List _title = [
    "Day 1",
    "Day 2",
    "Day 3",
    "Day 4",
    "Day 5",
    "Day 6",
    "Day7"
  ];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Plan'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "Enter Name For Plan"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '7',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Your Trip",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Save Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanList7AR extends StatelessWidget {
  PlanList7AR({super.key});

  final List _page = [
    Plan1AR(),
    Plan2AR(),
    Plan3AR(),
    Plan4AR(),
    Plan5AR(),
    Plan6AR(),
    Plan7AR()
  ];
  final List _title = [
    "اليوم الأول",
    "اليوم الثاني",
    "اليوم الثالث",
    "اليوم الرابع",
    "اليوم الخامس",
    "اليوم السادس",
    "اليوم السابع"
  ];

  void _savePlan(BuildContext context) async {
    TextEditingController _planNameController = TextEditingController();
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('حفظ الخطة'),
          content: TextField(
            controller: _planNameController,
            decoration: InputDecoration(hintText: "أدخل اسم الخطة"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('حفظ'),
              onPressed: () async {
                if (userId != null && _planNameController.text.isNotEmpty) {
                  await FirebaseFirestore.instance.collection('plans').add({
                    'day': '7',
                    'nameplan': _planNameController.text,
                    'userId': userId,
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 87, 69, 1),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "رحلتك",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _title.length,
            itemBuilder: (context, index) {
              return ListItemAR(
                page: _page[index],
                title: _title[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () => _savePlan(context),
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ الخطة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
