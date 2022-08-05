import 'package:chat/src/feature/app/chat_app.dart';
import 'package:chat/src/feature/app/logic/main_runner.dart';

void sharedRun(InitializationHooks initializationHooks) => MainRunner.run(
      appBuilder: (initializationData) => ChatApp(
        initializationData: initializationData,
      ),
      hooks: initializationHooks,
    );
