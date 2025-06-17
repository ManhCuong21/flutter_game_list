enum Flavor { prod, dev, uat}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {

      case Flavor.prod:
        return 'Codebase';
      case Flavor.dev:
        return 'Codebase Dev';
      case Flavor.uat:
        return 'Codebase Uat';
      default:
        return 'title';
    }
  }

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.prod:
        return 'https://mmo-games.p.rapidapi.com';
      case Flavor.dev:
        return 'https://mmo-games.p.rapidapi.com';
      case Flavor.uat:
        return 'https://mmo-games.p.rapidapi.com';
      default:
        return 'https://mmo-games.p.rapidapi.com';
    }
  }
}
