import 'package:assignment/pages/ToDo.dart';
import 'package:assignment/pages/journal.dart';
import 'package:assignment/pages/settings.dart';
import 'package:assignment/welcomepages/auth/loginScreen.dart';
import 'package:assignment/widgets/ThemeDemo/AppTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  var notesBox = await Hive.openBox('notesBox');
  var todoBox = await Hive.openBox('todoBox');

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.black45,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              label: tabItem.title,
            )
        ],
      ),
    );
  }
}

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: const HomePage(),
      icon: const Icon(Icons.home),
      title: "Home",
    ),
    TabNavigationItem(
      page: const JournalPage(),
      icon: const Icon(Icons.book),
      title: "Journal",
    ),
    TabNavigationItem(
      page: const ToDoPage(),
      icon: const Icon(Icons.task_alt),
      title: "ToDo",
    ),
    TabNavigationItem(
      page: const SettingsPage(),
      icon: const Icon(Icons.settings),
      title: "Settins",
    ),
  ];
}
