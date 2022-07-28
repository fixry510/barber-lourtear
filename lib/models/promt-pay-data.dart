class PromtPayData {
  late String id;
  late String doc;
  late String status;
  late String qrcode;

  PromtPayData({
    required this.id,
    required this.doc,
    required this.status,
    required this.qrcode,
  });

  PromtPayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doc = json['doc'];
    status = json['status'];
    qrcode = json['qrcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doc'] = this.doc;
    data['status'] = this.status;
    data['qrcode'] = this.qrcode;
    return data;
  }
}
