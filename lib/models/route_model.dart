class RouteModel {
    RouteModel({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool? success;
    final List<Route> data;
    final String? message;

    factory RouteModel.fromJson(Map<String, dynamic> json){ 
        return RouteModel(
            success: json["success"],
            data: json["data"] == null ? [] : List<Route>.from(json["data"]!.map((x) => Route.fromJson(x))),
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.map((x) => x.toJson()).toList(),
        "message": message,
    };

}

class Route {
    Route({
        required this.id,
        required this.routeName,
        required this.distributorId,
        required this.tsoId,
        required this.day,
        required this.status,
        required this.username,
        required this.createdAt,
        required this.updatedAt,
        required this.shopsCount,
    });

    final int? id;
    final String? routeName;
    final int? distributorId;
    final int? tsoId;
    final String? day;
    final int? status;
    final String? username;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? shopsCount;

    factory Route.fromJson(Map<String, dynamic> json){ 
        return Route(
            id: json["id"],
            routeName: json["route_name"],
            distributorId: json["distributor_id"],
            tsoId: json["tso_id"],
            day: json["day"],
            status: json["status"],
            username: json["username"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            shopsCount: json["shops_count"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "route_name": routeName,
        "distributor_id": distributorId,
        "tso_id": tsoId,
        "day": day,
        "status": status,
        "username": username,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shops_count": shopsCount,
    };

}
