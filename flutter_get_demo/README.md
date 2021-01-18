# flutter_get_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# 源码阅读总结

## 状态管理 - 响应式状态管理

- 使用的步骤：

```
// 在需要观察的对象后面加上".obs"
var count = 0.obs;

// 在UI中需要使用的地方使用
Obx(() => Text('${controller.count}'))
```

从.obs进入查看,是一个针对int的IntExtension的扩展
从源码中可以看到还有其他的扩展
StringExtension、DoubleExtension、BoolExtension、ListExtension、MapExtension、SetExtension、RxT<T> on T(泛型)

```
extension IntExtension on int {
  /// Returns a `RxInt` with [this] `int` as initial value.
  RxInt get obs => RxInt(this);
}
```

- 查看RxInt
- 继承_BaseRxNum<T extends num>,主要是对num数字操作符的实现，继承自_RxImpl<T>
- 而其又是继承自RxNotifier<T>实现RxObjectMiXin<T>
- RxNotifier<T>是RxInterface<T>并实现NotifyMananger<T>协议
- NotifyMananger<T>协议包含属性subject(类型为GetStream<T>)，在改变时发送通知
- RxObjectMixin<T>是一个协议，在NotifyMananger<T>中使用，主要包含_value属性（类型为泛型T）

- 查看Obx(),继承自ObxWidget

```
typedef WidgetCallback = Widget Function();

class Obx extends ObxWidget {
  final WidgetCallback builder; 

  const Obx(this.builder);

  @override
  Widget build() => builder();
}
```

- ObxWidget是一个可继承类，其自身继承自StatefulWidget

```
abstract class ObxWidget extends StatefulWidget {
  const ObxWidget({Key key}) : super(key: key);

  @override
  _ObxState createState() => _ObxState();

  @protected
  Widget build();
}
```

- _ObxState

```
class _ObxState extends State<ObxWidget> {
  RxInterface _observer;
  StreamSubscription subs;

  _ObxState() {
    _observer = RxNotifier();
  }
  // 这里对RxInterface进行监听并刷新值
  @override
  void initState() {
    subs = _observer.listen(_updateTree);
    super.initState();
  }
  
  void _updateTree(_) {
    if (mounted) {
      setState(() {});
    }
  }
  
  ···
}
```

## 路由管理

### get_navigation

#### extension_navigation.dart

对GetInterface类提供接口，有以下的的扩展

- GetNavigation 对路由切换的封装,路由使用的是GetPageRoute

```
Future<T> to<T> 调用的push
Future<T> toNamed<T> 调用的pushNamed
Future<T> offNamed<T> 调用的pushReplacementNamed
void until(RoutePredicate predicate, {int id}) 调用的popUntil
Future<T> offUntil<T>(Route<T> page, RoutePredicate predicate, {int id}) 调用的pushAndRemoveUntil
Future<T> offNamedUntil<T> 调用的pushNamedAndRemoveUntil
Future<T> offAndToNamed<T> 调用的popAndPushNamed
void removeRoute(Route<dynamic> route, {int id}) 调用的removeRoute
Future<T> offAllNamed<T> 调用的pushNamedAndRemoveUntil
void back<T> 内部处理放回上一级，如果有浮窗或者其他的提示会先关闭后在返回
void close(int times, [int id]) 调用的popUntil，往上返回多少次
Future<T> off<T> (Widget page) 调用的pushReplacement
Future<T> offAll<T> (Widget page) 调用的pushAndRemoveUntil
```

- ExtensionSnackbar

```
Future<T> showSnackbar<T>(GetBar snackbar)
void snackbar<T> 创建一个GetBar并调用showSnackbar
```

- ExtensionDialog

```
Future<T> dialog<T>
Future<T> generalDialog<T>
Future<T> defaultDialog<T> 自定义提示框
```

- ExtensionBottomSheet

```
Future<T> bottomSheet<T>
```

#### default_route.dart
- GetPageRoute 继承PageRoute，有以下属性：

````
GetPageRoute({
    RouteSettings settings,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.parameter,
    this.curve,
    this.alignment,
    this.transition,
    this.popGesture,
    this.customTransition,
    this.barrierDismissible = false,
    this.barrierColor,
    this.binding,
    this.bindings,
    this.routeName,
    this.page,
    this.barrierLabel,
    this.maintainState = true,
    bool fullscreenDialog = false,
    this.middlewares,
  })  : assert(opaque != null),
        assert(barrierDismissible != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        reference = "$routeName: ${page.hashCode}",
        super(settings: settings, fullscreenDialog: fullscreenDialog);
````

## 依赖管理

### get_instance

#### src/get_instance.dart

- GetInstance 此类主要是管理依赖类，主要是有两个map属性保存绑定的依赖类
- 再需要的时候通过Get.find()返回

```
// 工厂方法推入的类
static final Map<String, _InstanceBuilderFactory> _singl = {};
/// 直接根据路由名推入的类
static final Map<String, String> _routesKey = {};
```
- 有一下的存入map方式

```
void lazyPut<S>
void injector<S>
Future<S> putAsync<S>
S put<S>
void create<S>
void _insert<S>
```

#### bingdings_interface.dart
- 此类继承Bindings,主要是将被依赖的类注入到GetInstance的map中

#### extension_instance.dart
- Inst类 是仅对GetInterface的类或继承类提供接口，暴露部分GetInstance中的方法来通过（Get.）来使用

## 网络请求(get_connect)

### http

#### http.dart
GetHttpClient 类是对http请求的具体实现，例如get请求

```
Future<Response<T>> get<T>(
    String url, {
    Map<String, String> headers,
    String contentType,
    Map<String, dynamic> query,
    Decoder<T> decoder,
  }) async {
    try {
      var response = await _performRequest<T>(
        () => _get<T>(url, contentType, query, decoder),
        headers: headers,
      );
      return response;
    } on Exception catch (e) {
      if (!errorSafety) {
        throw GetHttpException(e.toString());
      }
      return Future.value(Response<T>(
        statusText: 'Can not connect to server. Reason: $e',
      ));
    }
  }
  
  Future<Request<T>> _get<T>(
    String url,
    String contentType,
    Map<String, dynamic> query,
    Decoder<T> decoder,
  ) {
    final headers = <String, String>{};
    _setSimpleHeaders(headers, contentType);
    final uri = _createUri(url, query);

    return Future.value(Request<T>(
      method: 'get',
      url: uri,
      headers: headers,
      decoder: decoder ?? (defaultDecoder as Decoder<T>),
    ));
  }
```

### sockets

#### sockets.dart
- GetSocket 是对BaseWebSocket的扩展

```
GetSocket(String url,
      {Duration ping = const Duration(seconds: 5), bool allowSelfSigned = true})
      : super(url, ping: ping, allowSelfSigned: allowSelfSigned);
```

- BaseWebSocket 是对WebSocket的封装

```
String url;
WebSocket socket;
SocketNotifier socketNotifier = SocketNotifier();
bool isDisposed = false;
BaseWebSocket(
this.url, {
this.ping = const Duration(seconds: 5),
this.allowSelfSigned = true,
});
Duration ping;
bool allowSelfSigned;

ConnectionStatus connectionStatus;
```

- 通过SocketNotifier把状态的改变发送出去供外部处理

### connect
- GetConnect 是对GetConnectInterface的扩展

```
GetConnect({
    this.userAgent = 'getx-client',
    this.timeout = const Duration(seconds: 5),
    this.followRedirects = true,
    this.maxRedirects = 5,
    this.maxAuthRetries = 1,
    this.allowAutoSignedCert = false,
  }) {
    $configureLifeCycle();
  }

  bool allowAutoSignedCert; //是否自动配置证书
  String userAgent;
  String baseUrl; // 基本Url
  String defaultContentType = 'application/json; charset=utf-8';
  bool followRedirects;
  int maxRedirects; // 最大的重定向数
  int maxAuthRetries; // 最大的重试次数
  Decoder defaultDecoder;// 默认的编码格式
  Duration timeout; // 超时时间
  List<TrustedCertificate> trustedCertificates; // 可配置信任的证书
  GetHttpClient _httpClient; // http请求
  List<GetSocket> _sockets; // sockets连接
```

GetConnectInterface 是一个协议类,定义了两个属性和一些请求的协议
- 属性：sockets、httpClient
- 协议：http请求（get、request、post、put、delete、patch、query、mutation）
- 协议：socket

```
GetSocket socket(
    String url, { // socket的地址
    Duration ping = const Duration(seconds: 5), // ping地址保持心跳间隔
  });
```

## 国际化
- 定义了接口Translations供外部实现，使用时外部需实现Translations
- 在main()启动时需要设置locale以及默认的fallbackLocale
- 在使用具体的值的时候，只需要在key值的后面加上.tr即可

## 改变主题
- GetX 改变主题只需要执行

```
Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark())
```

内部实现代码,主要是通过依赖的管理GetXController去设置主题

```
void changeTheme(ThemeData theme) {
	getxController.setTheme(theme);
}
```

## 实用工具(get_utils)
### extensions
#### context_extensions.dart
- ContextExtensionss 是对 BuildContext的扩展，可以获得布局的设置信息、设备的方向等

#### double_extensions.dart
- Precison 是对 double的扩展，只有一个方法toPrecision 参数int 是根据四舍五入保留小数点后多少位

#### duration_extensions.dart
- GetDurationUtils 是对Duration的扩展，只有一个方法，delay 延时执行回调callback()

#### dynamic_extensions.dart
- GetDynamicUtils 是对T泛型的扩展，添加判空的方法及打印

#### event_loop_extensions.dart
- LoopEventsExt 是对GetInterface的扩展，异步任务执行前的条件判断

#### internacionalization.dart
- Trans 是对String的扩展，根据设置获取国际化文件中设置的内容

#### num_extensions.dart
- GetNumUtils 是对num 的扩展，num包括int和double
- 添加与另外一个num 的对比大小、相等的方法
- 添加延时执行的方法delay
- 添加对时间的转发方法

#### string_extensions.dart
- GetStringUtils 对String的扩展，对String的一些判断和操作，例如判空、文件格式等
- 主要的实现文件在GetUtils中

#### widget_extensions.dart
- WidgetPaddingX 对Widget的扩展，主要是针对Padding组件的扩展
- WidgetMarginX 对Widget的扩展，主要是在Container组件中增加Margin
- WidgetSliverBoxX 对Widget的扩展，主要是在SliverScrollView中使用Widget组件时，直接将child包裹起来

### getUtils
- 全局静态方法对dynamic值的一些判断或处理，例如文件格式的判断等

### platform
- 对运行在的当前设备的判断，例如是否是MacOS、Windows，是否是Web、iOS、Android等

### queue
#### get_queue.dart
- GetQueue 是一个异步执行任务队列，创建后可手动添加任务_Item
- _Item是单个任务，由两个动态任意类型组成，complter是等待job完成后的执行，job是当前需要执行的
- GetMicrotask 是对scheduleMicrotask的封装，其内部有两个属性，_version和_microtask,我觉得这个与iOS中的dispatch_single的信号量类似，只有当两个值相等的时候才会执行任务


