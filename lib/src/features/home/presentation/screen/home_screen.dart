import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:structure_opti_test_1/src/features/product/presentation/provider/product_provider.dart';
import 'package:structure_opti_test_1/src/features/product/presentation/screen/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home Screen'),
            SizedBox(
              height: 20,
            ),
            Text('number of products: ${context.watch<ProductProvider>().productList.length}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProductScreen()));
        },
        tooltip: 'Get All Product',
        child: const Icon(Icons.add),
      ),
    );
  }
}
