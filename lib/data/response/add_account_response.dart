
class AddAccountResponse {
  final bool isStatus;
  final String data;
  AddAccountResponse({this.isStatus = false, required this.data});
  factory AddAccountResponse.fromJson(Map<String, dynamic> json) =>
      AddAccountResponse(data: json['data']);
}
