class PartnerModel {
  int? id;
  String? name;
  String? description;
  double? latitude;
  double? longitude;
  bool? isActive;
  int? sector;
  String? dateCreated;
  String? image;
  Owner? owner;

  PartnerModel(
      {this.id,
      this.name,
      this.description,
      this.latitude,
      this.longitude,
      this.isActive,
      this.sector,
      this.dateCreated,
      this.image,
      this.owner});

  PartnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isActive = json['is_active'];
    sector = json['sector'];
    dateCreated = json['date_created'];
    image = json['image'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_active'] = isActive;
    data['sector'] = sector;
    data['date_created'] = dateCreated;
    data['image'] = image;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    return data;
  }
}

class Owner {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? image;
  String? phonenumber;
  bool? isAdmin;
  bool? isDriver;
  bool? isSuperuser;
  bool? isActive;
  String? dateJoined;
  bool? isConfirmed;

  Owner(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.image,
      this.phonenumber,
      this.isAdmin,
      this.isDriver,
      this.isSuperuser,
      this.isActive,
      this.dateJoined,
      this.isConfirmed});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    phonenumber = json['phonenumber'];
    isAdmin = json['is_admin'];
    isDriver = json['is_driver'];
    isSuperuser = json['is_superuser'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    isConfirmed = json['is_confirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['phonenumber'] = phonenumber;
    data['is_admin'] = isAdmin;
    data['is_driver'] = isDriver;
    data['is_superuser'] = isSuperuser;
    data['is_active'] = isActive;
    data['date_joined'] = dateJoined;
    data['is_confirmed'] = isConfirmed;
    return data;
  }
}
