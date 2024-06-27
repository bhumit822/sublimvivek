// To parse this JSON data, do
//
//     final returnItemDetailByIdModel = returnItemDetailByIdModelFromMap(jsonString);

import 'dart:convert';

ReturnItemDetailByIdModel returnItemDetailByIdModelFromMap(String str) => ReturnItemDetailByIdModel.fromMap(json.decode(str));

String returnItemDetailByIdModelToMap(ReturnItemDetailByIdModel data) => json.encode(data.toMap());

class ReturnItemDetailByIdModel {
    final String? qrcodeUrl;
    final String? labelUrl;
    final Location? location;
    final Brand? brand;
    final List<Item>? items;
    final dynamic tracking;
    final String? nearbyLocationsUriTemplate;

    ReturnItemDetailByIdModel({
        this.qrcodeUrl,
        this.labelUrl,
        this.location,
        this.brand,
        this.items,
        this.tracking,
        this.nearbyLocationsUriTemplate,
    });

    ReturnItemDetailByIdModel copyWith({
        String? qrcodeUrl,
        String? labelUrl,
        Location? location,
        Brand? brand,
        List<Item>? items,
        dynamic tracking,
        String? nearbyLocationsUriTemplate,
    }) => 
        ReturnItemDetailByIdModel(
            qrcodeUrl: qrcodeUrl ?? this.qrcodeUrl,
            labelUrl: labelUrl ?? this.labelUrl,
            location: location ?? this.location,
            brand: brand ?? this.brand,
            items: items ?? this.items,
            tracking: tracking ?? this.tracking,
            nearbyLocationsUriTemplate: nearbyLocationsUriTemplate ?? this.nearbyLocationsUriTemplate,
        );

    factory ReturnItemDetailByIdModel.fromMap(Map<String, dynamic> json) => ReturnItemDetailByIdModel(
        qrcodeUrl: json["qrcode_url"],
        labelUrl: json["label_url"],
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        brand: json["brand"] == null ? null : Brand.fromMap(json["brand"]),
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        tracking: json["tracking"],
        nearbyLocationsUriTemplate: json["nearby_locations_uri_template"],
    );

    Map<String, dynamic> toMap() => {
        "qrcode_url": qrcodeUrl,
        "label_url": labelUrl,
        "location": location?.toMap(),
        "brand": brand?.toMap(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
        "tracking": tracking,
        "nearby_locations_uri_template": nearbyLocationsUriTemplate,
    };
}

class Brand {
    final String? name;
    final String? logoUrl;

    Brand({
        this.name,
        this.logoUrl,
    });

    Brand copyWith({
        String? name,
        String? logoUrl,
    }) => 
        Brand(
            name: name ?? this.name,
            logoUrl: logoUrl ?? this.logoUrl,
        );

    factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        name: json["name"],
        logoUrl: json["logo_url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "logo_url": logoUrl,
    };
}

class Item {
    final String? imageUrl;
    final String? itemName;
    final String? itemSize;
    final String? itemColor;
    final int? returnQuantity;
    final String? returnReason;

    Item({
        this.imageUrl,
        this.itemName,
        this.itemColor,
        this.returnQuantity,
        this.itemSize,
        this.returnReason,
    });

    Item copyWith({
        String? imageUrl,
        String? itemName,
        String? itemColor,
        String? itemSize,
        int? returnQuantity,
        String? returnReason,
    }) => 
        Item(
            imageUrl: imageUrl ?? this.imageUrl,
            itemName: itemName ?? this.itemName,
            itemSize: itemSize ?? this.itemSize,
            itemColor: itemColor ?? this.itemColor,
            returnQuantity: returnQuantity ?? this.returnQuantity,
            returnReason: returnReason ?? this.returnReason,
        );

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        imageUrl: json["image_url"],
        itemName: json["item_name"],
        itemSize: json["item_size"],
        itemColor: json["item_color"],
        returnQuantity: json["return_quantity"],
        returnReason: json["return_reason"],
    );

    Map<String, dynamic> toMap() => {
        "image_url": imageUrl,
        "item_name": itemName,
        "item_size": itemSize,
        "item_color": itemColor,
        "return_quantity": returnQuantity,
        "return_reason": returnReason,
    };
}

class Location {
    final String? locationId;
    final double? latitude;
    final double? longitude;
    final String? name;
    final String? address;
    
    final String? city;
    final String? region;
    final String? postalCode;
    final List<Hour>? hours;
    final String? logoUrl;

    Location({
        this.locationId,
        this.latitude,
        this.longitude,
        this.name,
        this.address,
        this.city,
        this.region,
        this.postalCode,
        this.hours,
        this.logoUrl,
    });

    Location copyWith({
        String? locationId,
        double? latitude,
        double? longitude,
        String? name,
        String? address,
        String? city,
        String? region,
        String? postalCode,
        List<Hour>? hours,
        String? logoUrl,
    }) => 
        Location(
            locationId: locationId ?? this.locationId,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            name: name ?? this.name,
            address: address ?? this.address,
            city: city ?? this.city,
            region: region ?? this.region,
            postalCode: postalCode ?? this.postalCode,
            hours: hours ?? this.hours,
            logoUrl: logoUrl ?? this.logoUrl,
        );

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        locationId: json["location_id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        name: json["name"],
        address: json["address"],
        city: json["city"],
        region: json["region"],
        postalCode: json["postal_code"],
        hours: json["hours"] == null ? [] : List<Hour>.from(json["hours"]!.map((x) => Hour.fromMap(x))),
        logoUrl: json["logo_url"],
    );

    Map<String, dynamic> toMap() => {
        "location_id": locationId,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "address": address,
        "city": city,
        "region": region,
        "postal_code": postalCode,
        "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x.toMap())),
        "logo_url": logoUrl,
    };
}

class Hour {
    final String? day;
    final bool? closed;
    final String? open;
    final String? close;

    Hour({
        this.day,
        this.closed,
        this.open,
        this.close,
    });

    Hour copyWith({
        String? day,
        bool? closed,
        String? open,
        String? close,
    }) => 
        Hour(
            day: day ?? this.day,
            closed: closed ?? this.closed,
            open: open ?? this.open,
            close: close ?? this.close,
        );

    factory Hour.fromMap(Map<String, dynamic> json) => Hour(
        day: json["day"],
        closed: json["closed"],
        open: json["open"],
        close: json["close"],
    );

    Map<String, dynamic> toMap() => {
        "day": day,
        "closed": closed,
        "open": open,
        "close": close,
    };
}
 