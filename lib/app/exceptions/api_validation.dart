//get the Validation from API
class ApiValidation {
  final String? password;
  final String? passwordConfirmation;
  final String? email;
  final String? name;
  final String? phone;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? message;
  final String? body;
  final String? file;
  final String? description;
  final String? newPassword;
  final String? oldPassword;
  final String? newPasswordConfirmation;
  final String? branchId;
  final String? serviceId;
  final String? acceptTerms;
  final String? username;
  final String? price;
  final String? reportTypeId;

  ApiValidation({
    this.email,
    this.name,
    this.password,
    this.passwordConfirmation,
    this.phone,
    this.description,
    this.title,
    this.message,
    this.newPassword,
    this.newPasswordConfirmation,
    this.oldPassword,
    this.file,
    this.serviceId,
    this.branchId,
    this.acceptTerms,
    this.username,
    this.price,
    this.lastName,
    this.firstName,
    this.body,
    this.reportTypeId,
  });

  factory ApiValidation.fromJson(Map<String, dynamic> json) => ApiValidation(
        password: json["password"]?.join(","),
        firstName: json["first_name"]?.join(","),
        lastName: json["last_name"]?.join(","),
        body: json["body"]?.join(","),
        passwordConfirmation: json["password_confirmation"]?.join(","),
        name: json["name"]?.join(","),
        username: json["username"]?.join(","),
        price: json["price"]?.join(","),
        phone: json["phone"]?.join(","),
        email: json["email"]?.join(","),
        title: json["title"]?.join(","),
        description: json["description"]?.join(","),
        message: json["message"]?.join(","),
        acceptTerms: json["accept_terms"]?.join(","),
        newPassword: json["new_password"]?.join(","),
        reportTypeId: json["report_type_id"]?.join(","),
        newPasswordConfirmation: json["new_password_confirmation"]?.join(","),
        oldPassword: json["old_password"],
        file: json["files.0"]?.join(","),
        serviceId:
            json["service_id"]?.join(",").toString().replaceAll("id ", ""),
        branchId: json["branch_id"]?.join(",").toString().replaceAll("id ", ""),
      );
}

//convert list object that come from api to string [,]
extension ListExtension on List<dynamic>? {
  String? get string {
    if (this != null) {
      return this!.join(",");
    }
    return null;
  }
}
