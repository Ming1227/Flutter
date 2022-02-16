# Flutter
learnDemo

# 组件学习Demo + 改变主题
flutter _change _theme

# GetX 学习Demo
flutter _get _demo

## StatefulWidget 生命周期

![生命周期](/Users/chenming/Desktop/LearnFlutter/iamges/StatefulWidget 生命周期.png)

- 首先执行**构造函数**（如果没有显示的构造函数，就会调用默认的无参构造函数）
- 1、createState，执行完成后当前组件已经在组件树中，此时mounted属性会返回为true
- 2、initState，此函数只会被调用一次，在插入树中调用，可用来订阅通知，初始化一些属性
- 3、didChangeDependencies，在initState之后立即调用，此外依赖项更改时也会调用，此方法调用后组件的状态变为dirty(脏状态)；此外还有一个clean状态，此状态下不会刷新组件；
- 4、立即调用build。此外会在以下情况调用此方法：
	- 4.1 调用 initState 方法后
	- 4.2 调用 didUpdateWidget 方法后
	- 4.3 收到对 setState 的调用后
	- 4.4 此 State 对象的依存关系发生更改后（例如，依赖的 InheritedWidget 发生了更改）
	- 4.5 调用 deactivate 之后，然后将 State 对象重新插入树的另一个位置
	
	**此方法可以在每一帧中调用，此方法中应该只包含构建组件的代码，不应该包含其他额外的功能，尤其是耗时任务**
	
- 5、didUpdateWidget
	当组件的 configuration 发生变化时调用此函数，当父组件使用相同的 runtimeType 和 Widget.key 重新构建一个新的组件时，Framework 将更新此 State 对象的组件属性以引用新的组件，然后使用先前的组件作为参数调用此方法

- 6、deactivate,从组件树中移除此 State 对象时将会调用此方法
- 7、dispose,从组件树中永久移除此 State 对象时将会调用此方法，与deactivate的区别时，deactivate还可以重新插入到组件树中，而dispose表示永远不会build，mounted属性会被设置为false，也代表组件生命周期结束，再调用setState会抛出异常

# 测试access tokens

