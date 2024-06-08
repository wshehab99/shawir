class ExpertAvatar {
  final bool isStatus;
  final String data;
  ExpertAvatar(this.isStatus, this.data);
  factory ExpertAvatar.fromJson(Map<String, dynamic> json) =>
      ExpertAvatar(json['isStatus'], json['data']);
}
