import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  static const colorCodes = (
    body: Color(0xFFF8E287),
    navigation: Color(0xFFC5ECCE),
    pane: Color(0xFFF0E8BC),
  );

  static const TextStyle textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const bodyWidget = Center(
    child: Text('Body', style: textStyle),
  );

  static const navigationWidget = Center(
    child: Text('Navigation', style: textStyle),
  );

  static const paneWidget = Center(
    child: Text('Pane', style: textStyle),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: () {
          if (screenWidth < 600) {
            return const Text('Responsive UI - Phone');
          } else if (screenWidth < 840) {
            return const Text('Responsive UI - Tablet');
          } else if (screenWidth < 1200) {
            return const Text('Responsive UI - Landscape');
          } else {
            return const Text('Responsive UI - Large Desktop');
          }
        }(),
      ),
      body: () {
        if (screenWidth < 600) {
          return buildCompactScreen();
        } else if (screenWidth < 840) {
          return buildMediumScreen();
        } else if (screenWidth < 1200) {
          return buildExpandedScreen();
        } else {
          return buildLargeScreen();
        }
      }(),
    );
  }

  Widget buildCompactScreen() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: colorCodes.body,
            child: bodyWidget,
          ),
        ),
        Container(
          height: 80,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
      ],
    );
  }

  Widget buildMediumScreen() {
    return Row(
      children: [
        Container(
          width: 80,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
        Expanded(
          child: Container(
            color: colorCodes.body,
            child: bodyWidget,
          ),
        ),
      ],
    );
  }

  Widget buildExpandedScreen() {
    return Row(
      children: [
        Container(
          width: 80,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
        Container(
          width: 300,
          color: colorCodes.body,
          child: bodyWidget,
        ),
        Expanded(
          child: Container(
            color: colorCodes.pane,
            child: paneWidget,
          ),
        ),
      ],
    );
  }

  Widget buildLargeScreen() {
    return Row(
      children: [
        Container(
          width: 250,
          color: colorCodes.navigation,
          child: navigationWidget,
        ),
        Container(
          width: 350,
          color: colorCodes.body,
          child: bodyWidget,
        ),
        Expanded(
          child: Container(
            color: colorCodes.pane,
            child: paneWidget,
          ),
        ),
      ],
    );
  }
}