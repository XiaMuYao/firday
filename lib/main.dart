import 'package:firday/login/page/login_page.dart';
import 'package:firday/routers/not_found_page.dart';
import 'package:firday/routers/routers.dart';
import 'package:firday/setting/provider/locale_provider.dart';
import 'package:firday/setting/provider/theme_provider.dart';
import 'package:firday/util/device_utils.dart';
import 'package:firday/util/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/firDay_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.home, this.theme}) {
    Routes.initRoutes();
  }
  final ThemeData? theme;
  final Widget? home;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider())
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (_, ThemeProvider provider, LocaleProvider localeProvider, __) {
          return _buildMaterialApp(provider, localeProvider);
        },
      ),
    );

    /// Toast 配置
    return OKToast(
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: app);
  }

  Widget _buildMaterialApp(ThemeProvider provider, LocaleProvider localeProvider) {
    return MaterialApp(
      title: 'Flutter Deer',
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染

      theme: theme ?? provider.getTheme(),
      darkTheme: provider.getTheme(isDarkMode: true),
      themeMode: provider.getThemeMode(),
      home: home ?? const LoginPage(),
      onGenerateRoute: Routes.router.generator,
      localizationsDelegates: FirDayLocalizations.localizationsDelegates,
      supportedLocales: FirDayLocalizations.supportedLocales,
      locale: localeProvider.locale,
      navigatorKey: navigatorKey,
      builder: (BuildContext context, Widget? child) {
        /// 仅针对安卓
        if (Device.isAndroid) {
          /// 切换深色模式会触发此方法，这里设置导航栏颜色
          ThemeUtils.setSystemNavigationBar(provider.getThemeMode());
        }

        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },

      /// 因为使用了fluro，这里设置主要针对Web
      onUnknownRoute: (_) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const NotFoundPage(),
        );
      },
      restorationScopeId: 'app',
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
