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

## 状态管理

## 路由管理

## 依赖管理

## 网络请求(get_connect)

## 国际化

## 改变主题

## 实用工具(get_utils)
### extensions
#### context_extensions
- ContextExtensionss 是对 BuildContext的扩展，可以获得布局的设置信息、设备的方向等

#### double_extensions
- Precison 是对 double的扩展，只有一个方法toPrecision 参数int 是根据四舍五入保留小数点后多少位

#### duration_extensions
- GetDurationUtils 是对Duration的扩展，只有一个方法，delay 延时执行回调callback()

#### dynamic_extensions
- GetDynamicUtils 是对T泛型的扩展，添加判空的方法及打印

#### event_loop_extensions
- LoopEventsExt 是对GetInterface的扩展，异步任务执行前的条件判断

#### internacionalization
- Trans 是对String的扩展，根据设置获取国际化文件中设置的内容

#### num_extensions
- GetNumUtils 是对num 的扩展，num包括int和double
- 添加与另外一个num 的对比大小、相等的方法
- 添加延时执行的方法delay
- 添加对时间的转发方法

#### string_extensions
- GetStringUtils 对String的扩展，对String的一些判断和操作，例如判空、文件格式等
- 主要的实现文件在GetUtils中

#### widget_extensions
- WidgetPaddingX 对Widget的扩展，主要是针对Padding组件的扩展
- WidgetMarginX 对Widget的扩展，主要是在Container组件中增加Margin
- WidgetSliverBoxX 对Widget的扩展，主要是在SliverScrollView中使用Widget组件时，直接将child包裹起来

### getUtils
- 全局静态方法对dynamic值的一些判断或处理，例如文件格式的判断等

### platform
- 对运行在的当前设备的判断，例如是否是MacOS、Windows，是否是Web、iOS、Android等

### queue
#### get_queue
- GetQueue 是一个异步执行任务队列，创建后可手动添加任务_Item
- _Item是单个任务，由两个动态任意类型组成，complter是等待job完成后的执行，job是当前需要执行的
- GetMicrotask 是对scheduleMicrotask的封装，其内部有两个属性，_version和_microtask,我觉得这个与iOS中的dispatch_single的信号量类似，只有当两个值相等的时候才会执行任务


