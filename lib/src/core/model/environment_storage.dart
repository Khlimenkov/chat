import 'package:chat/src/core/enum/environment.dart';

abstract class IEnvironmentStorage {
  Environment get environment;
  String get sentryDsn;
}

class EnvironmentStorage implements IEnvironmentStorage {
  const EnvironmentStorage();

  @override
  Environment get environment => Environment.values.byName('development');

  @override
  String get sentryDsn =>
      'https://0d44e04073114fb19b8a19395e4df9c1@o1348102.ingest.sentry.io/6627231';
}
