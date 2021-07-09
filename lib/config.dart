enum Flavor { dev, prod }

abstract class Config {
  static late Flavor appFlavor;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Production';
      case Flavor.dev:
      default:
        return 'Development';
    }
  }
}
