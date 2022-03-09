import 'package:projecthomestrategies_admin/bloc/model/user.dart';

class Household {
  int? householdId;
  String? householdName;
  List<User>? householdMember;
  int? adminId;
  DateTime? createdAt;
  User? householdCreator;

  Household({
    this.householdId,
    this.householdName,
    this.householdMember,
    this.adminId,
  });

  Household.fromJson(Map<String, dynamic> json) {
    householdId = json['householdId'];
    householdName = json['householdName'];
    adminId = json['adminId'];
    createdAt = DateTime.parse(json['createdAt']);
    householdMember = json['householdMember'] != null
        ? List<User>.from(
            json['householdMember'].map((model) => User.fromJson(model)),
          )
        : null;
    householdCreator = json['householdCreator'] != null
        ? User.fromJson(json['householdCreator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['householdId'] = householdId;
    data['householdName'] = householdName;
    data['createdAt'] = createdAt.toString();
    data['adminId'] = adminId;
    if (householdMember != null) {
      data['householdMember'] =
          householdMember!.map((v) => v.toJson()).toList();
    }
    if (householdCreator != null) {
      data['householdCreator'] = householdCreator!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['householdName'] = householdName;
    data['adminId'] = adminId;
    if (householdCreator != null) {
      data['householdCreator'] = householdCreator!.toJson();
    }
    return data;
  }
}
