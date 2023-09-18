import 'package:auto_route/auto_route.dart';
import 'package:example_architecture/presentation/destinations/home/home_example_page_body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeExamplePage extends StatelessWidget {
  const HomeExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: const HomeExamplePageBody(),
    );
  }
}
