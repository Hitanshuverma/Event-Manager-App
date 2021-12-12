import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/db/dbhelper.dart';
import 'package:get/get.dart';
import 'package:untitled/model/controllers/task_controller.dart';
import 'home_page.dart';
import 'add_event.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'ID.dart';
import 'package:get/get.dart';
// import 'files_page.dart';
// import 'upload_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  //await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    // );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> pages = [
    const Homepage(),
    const Homepage(),
    // MyApp(),
    // const Uploadpage()
  ];

  final List<String> pagename = [
    'Home',
    'Files',
    'Upload',
    'Upload File',
  ];

  // final List<String> bottomlistname = [
  //   'Home',
  //   'Files',
  //   'Upload',
  //   'Upload File',
  // ];
  int pageindex = 0;
  void _onTap(int index) {
    setState(() {
      pageindex = index;
    });
  }

  final _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.grey[850],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
              child: const CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage('images/hippo.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child:  Text(
                'Hello!!  User',
                style: GoogleFonts.lato(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                ),
                // style: TextStyle(
                //   fontStyle: FontStyle.italic,
                //   fontWeight: FontWeight.w400,
                //   fontSize: 30,
                // ),
              ),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromRadius(50),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Container(
              //   color: Colors.white,
              //   child: const Text(
              //     'hello user',
              //   ),
              // ),
              // const Divider(
              //   height: 10,
              //   color: Colors.transparent,
              // ),
              // Container(
              //   color: Colors.white,
              //   child: const Text('where is this'),
              // ),
              // const Divider(
              //   height: 10,
              //   color: Colors.transparent,
              // ),
            ],
          ),
        ),
        // title: Text(pagename[pageindex]),
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.blueGrey,
      ),
      body: pages[pageindex],
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFF6364A7),
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => Add()));
          _taskController.getTask();
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        elevation: 20,
        onTap: _onTap,
        currentIndex: pageindex,
        backgroundColor: Colors.grey[800],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              size: 25,
            ),
            label: 'Uploaded',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF6364A7),
        unselectedItemColor: const Color(0xFFA7A7A7),
        // onTap: _onItemTapped,
      ),
    );
  }
}
