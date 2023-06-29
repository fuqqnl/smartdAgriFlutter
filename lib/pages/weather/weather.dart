/**
 * @file 天气详情页，由上面的webview和下面的具体数据体现组成
 * */
import 'package:flutter/material.dart';
import './rain_charts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'developerSeries.dart';
import 'weather_now_card.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  static const String routePath = 'weather';
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late final WebViewController _controller;
  double _opacity = 0.0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    final WebViewController controller = WebViewController();
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse('https://m.baidu.com'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  void _handleScroll() {
    setState(() {
      // 根据滚动位置更新透明度
      _opacity = (_scrollController.offset / 300).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mock柱状图数
    final List<DeveloperSeries> data = [
      DeveloperSeries(
        time: "12:00",
        developers: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "12:10",
        developers: 14,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "12:20",
        developers: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "12:30",
        developers: 40,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "12:40",
        developers: 30,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "12:50",
        developers: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "13:00",
        developers: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "13:10",
        developers: 1,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "13:20",
        developers: 4,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "13:30",
        developers: 0,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        time: "13:40",
        developers: 0,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "地图天气",
          style: TextStyle(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: WebViewWidget(controller: _controller),
          ),
          Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: _opacity,
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                ),
              )),
          ListView.builder(
              controller: _scrollController,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                // TODO 先简单些，这里合适的写法应该是返回数据，根据数据类型不同，渲染不同的组件，我这里就先偷懒,先用索引做区分了
                // TODO 还缺一个5天内的天气预报情况没有实现
                if (index == 0) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 450),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              '两小时内分钟级降水',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 250,
                            child: RainCharts(data),
                          )
                        ],
                      ));
                } else {
                  return Container(
                    child: WeatherNowCard(),
                  );
                }
              })
        ],
      ),
    );
  }
}
