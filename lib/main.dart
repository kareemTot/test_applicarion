import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/category/views/category_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      "https://dev.alkhbaz.totplatform.net/graphql",
      defaultHeaders: {"Content-Type": "application/json"},
    );
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: httpLink, cache: GraphQLCache()),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoryScreen(),
      ),
    );
  }
}
