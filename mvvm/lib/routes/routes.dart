abstract class Routes {
  static const String todo = '/todos';
  static String todoDetails(String id) => '$todo/$id';
}