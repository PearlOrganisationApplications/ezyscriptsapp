import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_picker/country_picker.dart';
import 'package:ezyscripts/constant/colors.dart';
import 'package:ezyscripts/controller/totalprice%20controller.dart';
import 'package:ezyscripts/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';



import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controller/dependency.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   Stripe.publishableKey='pk_test_51O504PABp6SRG1tAcGFKIMPgtAMXEjD7VgeYlO0uAo5J39HIgi2l8OytyIblElqr7Be0ZKIgtWvvx9yoG03HZYEW00nQnSnLQe';
     // await dotenv.load(fileName: 'assets/.env');
  DependencyInjection.init();
  runApp(const MyApp());
}

late Size screenSize;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isDeviceConnected = false;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RequestController()),
        ChangeNotifierProvider(create: (context) => TotalPriceCalculate()),
        // Add more providers as needed
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
          const Locale('es'),
          const Locale('de'),
          const Locale('fr'),
          const Locale('el'),
          const Locale('et'),
          const Locale('nb'),
          const Locale('nn'),
          const Locale('pl'),
          const Locale('pt'),
          const Locale('ru'),
          const Locale('hi'),
          const Locale('ne'),
          const Locale('uk'),
          const Locale('hr'),
          const Locale('tr'),
          const Locale('lv'),
          const Locale('lt'),
          const Locale('ku'),
          const Locale('nl'),
          const Locale('it'),
          const Locale('ko'),
          const Locale('ja'),
          const Locale('id'),
          const Locale('cs'),
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
        ],
        localizationsDelegates: [
          CountryLocalizations.delegate,
        ],
        home: SplashScreen(),
      ),
    );
  }
}
