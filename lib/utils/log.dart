import 'package:logger/logger.dart';

/// 该类是简单的封装一下logger，方便在全局调用
/// logger 使用参考：https://juejin.cn/post/6963128547837739015#heading-4
class Log {
  static final Logger _logger = Logger(
    level: Level.debug, //日志输出等级
    printer: PrefixPrinter(PrettyPrinter()), //自定义打印器
    // filter:  //过滤器
    // output: //输出器 logger 充分考虑到了用户的使用场景，支持日志打印在控制台、文件、内存。
  );

  static void v(dynamic message) {
    _logger.v(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }

  static void wtf(dynamic message) {
    _logger.wtf(message);
  }
}
