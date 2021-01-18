import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'Clicks': '点击',
          'Go to Other': '去其他',
          'Other': '其他',
          'count': '数量',
          'changeLocale': '改变语言',
          'changeTheme': '改变主题',
        },
        'en_US': {
          'Clicks': 'Clicks',
          'Go to Other': 'Go to Other',
          'Other': 'Other',
          'count': 'count',
          'changeLocale': 'changeLocale',
          'changeTheme': 'changeTheme',
        }
      };
}
