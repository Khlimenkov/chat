.PHONY: run emulator install-apk

run:
	@echo "* Running app *"
	@flutter run

emulator:
	@echo "* Opening an Android emulator *"
	@emulator @Pixel_XL_API_30

install-apk:
	@adb install build\app\outputs\flutter-apk\app-release.apk

logs:
	@flutter logs

# Development/Trunk
run-develop:
	@flutter run --flavor development --dart-define=environment=development --dart-define=sentry_dsn=https://0d44e04073114fb19b8a19395e4df9c1@o1348102.ingest.sentry.io/6627231

# Staging/Stage/Model/Pre-production
run-staging:
	@flutter run --flavor staging --dart-define=environment=staging

# Production/Live
run-production:
	@flutter run --flavor production --dart-define=environment=production
