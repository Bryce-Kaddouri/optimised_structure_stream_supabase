import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:structure_opti_test_1/src/features/auth/business/usecase/auth_sign_in_usecase.dart';
import 'package:structure_opti_test_1/src/features/auth/data/datasource/auth_datasource.dart';
import 'package:structure_opti_test_1/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:structure_opti_test_1/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:structure_opti_test_1/src/features/home/presentation/screen/home_screen.dart';
import 'package:structure_opti_test_1/src/features/product/business/usecase/product_get_all_product_usecase.dart';
import 'package:structure_opti_test_1/src/features/product/business/usecase/product_stream_all_product_usecase.dart';
import 'package:structure_opti_test_1/src/features/product/data/datasource/product_datasource.dart';
import 'package:structure_opti_test_1/src/features/product/data/repository/product_repository_impl.dart';
import 'package:structure_opti_test_1/src/features/product/presentation/provider/product_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://ncujaaasxfopcbydvyar.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jdWphYWFzeGZvcGNieWR2eWFyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2MTgzMjMsImV4cCI6MjAyNzE5NDMyM30.-y7rajO8DvmOUcZvI04upHIHG6YsfAuhkQBIlTaLjvU',
  );
  AuthRepositoryImpl authRepository = AuthRepositoryImpl(dataSource: AuthDataSource());
  ProductRepositoryImpl productRepository = ProductRepositoryImpl(dataSource: ProductDataSource());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(signInUsecase: AuthSignInUsecase(repository: authRepository)),
      ),
      ChangeNotifierProvider<ProductProvider>(
        create: (context) => ProductProvider(
          getAllProductUsecase: ProductGetAllProductUsecase(repository: productRepository),
          productStreamAllProductUsecase: ProductStreamAllProductUsecase(repository: productRepository),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
