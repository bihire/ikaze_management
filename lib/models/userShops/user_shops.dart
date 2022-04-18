
class UserShopModel {

  ShopAssociationsModel associations;
  String roleName;
  String shopName;
  String? adminFirstName;
  String? adminLastName;
  String adminUserName;
  String? managerFirstName;
  String? managerLastName;
  String? managerUserName;

  UserShopModel.fromJson(Map<String, dynamic> json)
      : roleName = json['role_name'],
        associations = ShopAssociationsModel.fromJson(json['associations']),
        shopName = json['shop_name'],
        adminFirstName = json['admin_first_name'],
        adminLastName = json['admin_last_name'],
        adminUserName = json['admin_user_name'],
        managerFirstName = json['manager_first_name'],
        managerLastName = json['manager_last_name'],
        managerUserName = json['manager_user_name']
      ;
}

class ShopAssociationsModel {
  int role;
  int shopId;
  int adminId;
  int? managerId;

  ShopAssociationsModel.fromJson(Map<String, dynamic> json)
    : role = json['role'],
      shopId = json['shop_id'],
      adminId = json['admin_id'],
      managerId = json['manager_id'];
}
