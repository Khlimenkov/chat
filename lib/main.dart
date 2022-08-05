// ignore: unused_import
import 'package:chat/runner_stub.dart'
    if (dart.library.io) 'package:chat/runner_io.dart'
    if (dart.library.html) 'package:chat/runner_web.dart' as runner;

void main() => runner.run();
