import 'dart:async';
import 'dart:io';

import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constant/constant.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  ///地图通信中心
  AMapController? mapController;

  /// 定位插件
  AMapFlutterLocation? location;

  /// 权限状态
  PermissionStatus? permissionStatus;

  /// 相机位置
  CameraPosition? currentLocation;

  /// 地图类型
  late MapType _mapType;

  /// 周边数据
  List poisData = [];

  var markerLatitude;
  var markerLongitude;

  double? meLatitude;
  double? meLongitude;
  

  @override
  void initState() {
    super.initState();
    _mapType = MapType.normal;

    /// 设置Android和iOS的apikey，
    AMapFlutterLocation.setApiKey(Constant.androidKey, Constant.iosKey);

    /// 设置是否已经取得用户同意，如果未取得用户同意，高德定位SDK将不会工作,这里传true
    AMapFlutterLocation.updatePrivacyAgree(true);

    /// 设置是否已经包含高德隐私政策并弹窗展示显示用户查看，如果未包含或者没有弹窗展示，高德定位SDK将不会工作,这里传true
    AMapFlutterLocation.updatePrivacyShow(true, true);
    requestPermission();
  }

  Future<void> requestPermission() async {
    final status = await Permission.location.request();
    permissionStatus = status;
    switch (status) {
      case PermissionStatus.denied:
        print("拒绝");
        break;
      case PermissionStatus.granted:
        print("同意");
        requestLocation();
        break;
      case PermissionStatus.limited:
        print("限制");
        break;
      default:
        print("其他状态");
        requestLocation();
        break;
    }
  }

  /// 请求位置
  void requestLocation() {
    location = AMapFlutterLocation()
      ..setLocationOption(AMapLocationOption())
      ..onLocationChanged().listen((event) {
        print('获取位置信息的event是:$event');
        double? latitude = double.tryParse(event['latitude'].toString());
        double? longitude = double.tryParse(event['longitude'].toString());
        markerLatitude = latitude.toString();
        markerLongitude = longitude.toString();
        meLatitude = latitude;
        meLongitude = longitude;
        if (latitude != null && longitude != null) {
          print('LatLng的值是: ${LatLng(latitude, longitude)}');
          setState(() {
            currentLocation = CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 15,
            );
          });
          print('currentLocation的值是$currentLocation');
        }
      })
      ..startLocation();
  }

  void _onMapPoiTouched(AMapPoi poi) async {
    if (null == poi) {
      return;
    }
    print('_onMapPoiTouched===> ${poi.toJson()}');
    var xx = poi.toJson();
    print(xx['latLng']);
    markerLatitude = xx['latLng'][1];
    markerLongitude = xx['latLng'][0];
    print(markerLatitude);
    print(markerLatitude);
    setState(() {
      _addMarker(poi.latLng!);
    });
  }

  //需要先设置一个空的map赋值给AMapWidget的markers，否则后续无法添加marker
  final Map<String, Marker> _markers = <String, Marker>{};
  //添加一个marker
  void _addMarker(LatLng markPostion) async {
    _removeAll();
    final Marker marker = Marker(
      position: markPostion,
      //使用默认hue的方式设置Marker的图标
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    //调用setState触发AMapWidget的更新，从而完成marker的添加
    setState(() {
      //将新的marker添加到map里
      _markers[marker.id] = marker;
    });
    _changeCameraPosition(markPostion);
  }

  /// 改变中心点
  void _changeCameraPosition(LatLng markPostion, {double zoom = 13}) {
    mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          //中心点
            target: markPostion,
            //缩放级别
            zoom: zoom,
            //俯仰角0°~45°（垂直与地图时为0）
            tilt: 30,
            //偏航角 0~360° (正北方为0)
            bearing: 0),
      ),
      animated: true,
    );
  }

  /// 清除marker
  void _removeAll() {
    if (_markers.isNotEmpty) {
      setState(() {
        _markers.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "地图天气",
          style: TextStyle(),
        ),
      ),
      body: currentLocation == null
          ? Container(
            child: Text('正在获取地理位置信息', style: TextStyle(fontSize: 30, color: Colors.blue),),
          )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
              child: Container(
                width: double.infinity,
                  height: MediaQuery.of(context).size.height - 80,
                  child: SizedBox(
                    child: AMapWidget(
                      // 隐私政策包含高德 必须填写
                      privacyStatement: Constant.amapPrivacyStatement,
                      apiKey: Constant.amapApiKeys,
                      // 初始化地图中心点
                      initialCameraPosition: currentLocation!,
                      //定位小蓝点
                      myLocationStyleOptions: MyLocationStyleOptions(
                        true,
                      ),
                      // 普通地图normal,卫星地图satellite,夜间视图night,导航视图 navi,公交视图bus,
                      mapType: _mapType,
                      // 缩放级别范围
                      minMaxZoomPreference: const MinMaxZoomPreference(3, 20),
                      onPoiTouched: _onMapPoiTouched,
                      markers: Set<Marker>.of(_markers.values),
                      // 地图创建成功时返回AMapController
                      onMapCreated: (AMapController controller) {
                        mapController = controller;
                      },

                    ),
                  ),
                ),
          )


        ],
      ),

    );
  }

  @override
  void dispose() {
    location?.destroy();
    super.dispose();
  }

}
