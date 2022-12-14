import 'package:flutter/material.dart';
import 'package:pure/pure.dart';
import 'package:chat/src/core/model/dependencies_storage.dart';
import 'package:chat/src/core/model/repository_storage.dart';
import 'package:chat/src/core/widget/dependencies_scope.dart';
import 'package:chat/src/core/widget/environment_scope.dart';
import 'package:chat/src/core/widget/repository_scope.dart';
import 'package:chat/src/feature/app/bloc/initialization_bloc.dart';
import 'package:chat/src/feature/app/widget/app_configuration.dart';
import 'package:chat/src/feature/app/widget/app_lifecycle_scope.dart';
import 'package:chat/src/feature/settings/widget/scope/settings_scope.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatApp extends StatelessWidget {
  final InitializationData initializationData;

  const ChatApp({
    Key? key,
    required this.initializationData,
  }) : super(key: key);

  SharedPreferences get _sharedPreferences =>
      initializationData.sharedPreferences;

  @override
  Widget build(BuildContext context) => EnvironmentScope(
        create: initializationData.environmentStorage.constant,
        child: AppLifecycleScope(
          errorTrackingDisabler: initializationData.errorTrackingDisabler,
          child: DependenciesScope(
            create: (context) => DependenciesStorage(
              databaseName: 'chat_database',
              sharedPreferences: _sharedPreferences,
            ),
            child: RepositoryScope(
              create: (context) => RepositoryStorage(
                appDatabase: DependenciesScope.of(context).database,
                sharedPreferences: _sharedPreferences,
              ),
              child: const SettingsScope(
                child: AppConfiguration(),
              ),
            ),
          ),
        ),
      );
}
