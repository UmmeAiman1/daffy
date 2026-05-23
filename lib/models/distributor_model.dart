class DistributorModel {
    DistributorModel({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool? success;
    final List<Distributor> data;
    final String? message;

    factory DistributorModel.fromJson(Map<String, dynamic> json){ 
        return DistributorModel(
            success: json["success"],
            data: json["data"] == null ? [] : List<Distributor>.from(json["data"]!.map((x) => Distributor.fromJson(x))),
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.map((x) => x.toJson()).toList(),
        "message": message,
    };

}

class Distributor {
    Distributor({
        required this.id,
        required this.distributorCode,
        required this.customCode,
        required this.contactPerson,
        required this.distributorName,
        required this.parentCode,
        required this.distributorSubCode,
        required this.typeDistributorId,
        required this.level1,
        required this.level2,
        required this.level3,
        required this.email,
        required this.phone,
        required this.altPhone,
        required this.address,
        required this.note,
        required this.cityId,
        required this.city,
        required this.zip,
        required this.zoneId,
        required this.minDiscount,
        required this.maxDiscount,
        required this.map,
        required this.locationTitle,
        required this.locationLatitude,
        required this.locationLongitude,
        required this.locationRadius,
        required this.username,
        required this.activeUnactive,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;
    final String? distributorCode;
    final String? customCode;
    final String? contactPerson;
    final String? distributorName;
    final String? parentCode;
    final String? distributorSubCode;
    final int? typeDistributorId;
    final String? level1;
    final String? level2;
    final String? level3;
    final String? email;
    final String? phone;
    final dynamic altPhone;
    final String? address;
    final String? note;
    final int? cityId;
    final String? city;
    final dynamic zip;
    final int? zoneId;
    final dynamic minDiscount;
    final dynamic maxDiscount;
    final dynamic map;
    final dynamic locationTitle;
    final dynamic locationLatitude;
    final dynamic locationLongitude;
    final dynamic locationRadius;
    final String? username;
    final String? activeUnactive;
    final int? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory Distributor.fromJson(Map<String, dynamic> json){ 
        return Distributor(
            id: json["id"],
            distributorCode: json["distributor_code"],
            customCode: json["custom_code"],
            contactPerson: json["contact_person"],
            distributorName: json["distributor_name"],
            parentCode: json["parent_code"],
            distributorSubCode: json["distributor_sub_code"],
            typeDistributorId: json["type_distributor_id"],
            level1: json["level1"],
            level2: json["level2"],
            level3: json["level3"],
            email: json["email"],
            phone: json["phone"],
            altPhone: json["alt_phone"],
            address: json["address"],
            note: json["note"],
            cityId: json["city_id"],
            city: json["city"],
            zip: json["zip"],
            zoneId: json["zone_id"],
            minDiscount: json["min_discount"],
            maxDiscount: json["max_discount"],
            map: json["map"],
            locationTitle: json["location_title"],
            locationLatitude: json["location_latitude"],
            locationLongitude: json["location_longitude"],
            locationRadius: json["location_radius"],
            username: json["username"],
            activeUnactive: json["active_unactive"],
            status: json["status"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "distributor_code": distributorCode,
        "custom_code": customCode,
        "contact_person": contactPerson,
        "distributor_name": distributorName,
        "parent_code": parentCode,
        "distributor_sub_code": distributorSubCode,
        "type_distributor_id": typeDistributorId,
        "level1": level1,
        "level2": level2,
        "level3": level3,
        "email": email,
        "phone": phone,
        "alt_phone": altPhone,
        "address": address,
        "note": note,
        "city_id": cityId,
        "city": city,
        "zip": zip,
        "zone_id": zoneId,
        "min_discount": minDiscount,
        "max_discount": maxDiscount,
        "map": map,
        "location_title": locationTitle,
        "location_latitude": locationLatitude,
        "location_longitude": locationLongitude,
        "location_radius": locationRadius,
        "username": username,
        "active_unactive": activeUnactive,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };

}
