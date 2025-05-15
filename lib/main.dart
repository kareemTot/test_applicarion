import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/theme/app_theme.dart';
import 'package:test_applicarion/di.dart';
import 'package:test_applicarion/feature/login/presentation/views/login_screen.dart';
import 'core/cache/app_shared_pref.dart';
import 'core/constant/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();

  final token = await SharedPref().get(tokenValue);
  log("token: $token");
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      graphQlUrl,
      defaultHeaders: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: httpLink, cache: GraphQLCache()),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        theme: AppTheme.themeData(context),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
