abstract class ApiConfig {
  static String baseUrl = "";
  static String authToken = "";
  static const String categories = "/requestAccount/categories";
  static const String uploadDocuments = "/requestAccount/uploadDocuments";
  static const String avatar = "/requestAccount/avatar";
  static const String languages = "/requestAccount/expert/languages";
  static const String professions = "/requestAccount/expert/professions";
  static const String uploadVideo = "/requestAccount/uploadVideo";
  static const String addAccount = "/requestAccount/expert/addAccount";
  static String subCategory(int id) => "/requestAccount/subCategory/$id";
}
