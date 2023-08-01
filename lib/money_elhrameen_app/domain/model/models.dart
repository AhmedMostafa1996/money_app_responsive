class WalletModel {
  String nameDetails;
  double money;
  String date;
  double total;
  String icon;
  String details;

  WalletModel({
    required this.nameDetails,
    required this.money,
    required this.date,
    required this.total,
    required this.icon,
    required this.details,
  });

  factory WalletModel.fromJson(Map<String, dynamic> information,Map<String,dynamic> total) {
    return WalletModel(
      nameDetails: information['nameDetails'],
      money: information['money'],
      date: information['data'],
      total: total['total'],
      icon: information['icon'],
      details: information['details']
    );
  }
}
