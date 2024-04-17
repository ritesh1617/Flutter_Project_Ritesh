import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    showToast('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showToast('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    showToast('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    showToast('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    showToast('dispose');
  }

  @override
  Widget build(BuildContext context) {
    showToast('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Lifecycle Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // No action needed for the button
          },
          child: Text('Button'),
        ),
      ),
    );
  }

  void showToast(String message) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ));
    });
  }
}