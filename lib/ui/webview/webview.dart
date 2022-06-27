// ignore_for_file: implementation_imports
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webviewx/webviewx.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late WebViewXController webviewController;
  String baseUrl = '';
  String token = '';
  String email = '';
  String idowner = '';
  String url = '';

  Future<String> _setInitialUrl() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    email = prefs.getString('email')!;
    idowner = prefs.getString('idowner')!;
    baseUrl = prefs.getString('baseUrl')!;
    var rawUrl = '$baseUrl?token=$token&email=$email&idowner=$idowner';
    return rawUrl.toString();
  }

  _goTo(String content) {
    webviewController.loadContent(baseUrl + content, SourceType.url);
  }

  Size get screenSize => MediaQuery.of(context).size;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Karyawan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settigs',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          if (index == 0) {
            _scaffoldKey.currentState?.openDrawer();
          }
          if (index == 1) {
            _goTo('/karyawan');
          }
        },
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _setInitialUrl(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return _buildWebViewX(snapshot.data ?? 'www.google.com');
            }

            return Container();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget> [
            ExpansionTile(
              
              title: Text("Expansion Title"),
              children: [
                ListTile(title: Text('data1')),
                ListTile(title: Text('data1'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebViewX(String initialUrl) {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: initialUrl,
      initialSourceType: SourceType.url,
      onWebViewCreated: (controller) => webviewController = controller,
      height: screenSize.height,
      width: screenSize.width,
    );
  }
}
