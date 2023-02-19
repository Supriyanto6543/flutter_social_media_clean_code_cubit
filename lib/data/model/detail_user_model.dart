import 'package:clean_unlcebob/domain/entities/detail_user_entity.dart';
import 'package:equatable/equatable.dart';

class DetailUserModel extends Equatable {
  DetailUserModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.location,
    required this.registerDate,
    required this.updatedDate,
  });
  late final String id;
  late final String title;
  late final String firstName;
  late final String lastName;
  late final String picture;
  late final String gender;
  late final String email;
  late final String dateOfBirth;
  late final String phone;
  late final LocationModel location;
  late final String registerDate;
  late final String updatedDate;

  DetailUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    gender = json['gender'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    phone = json['phone'];
    location = LocationModel.fromJson(json['location']);
    registerDate = json['registerDate'];
    updatedDate = json['updatedDate'];
  }

  DetailUserEntity toEntity() => DetailUserEntity(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture,
      gender: gender,
      email: email,
      dateOfBirth: dateOfBirth,
      phone: phone,
      location: location,
      registerDate: registerDate,
      updatedDate: updatedDate);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        firstName,
        lastName,
        picture,
        gender,
        email,
        dateOfBirth,
        phone,
        location,
        registerDate,
        updatedDate
      ];
}

class LocationModel extends Equatable {
  LocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });
  late final String street;
  late final String city;
  late final String state;
  late final String country;
  late final String timezone;

  LocationModel.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    timezone = json['timezone'];
  }

  LocationEntity toEntity() => LocationEntity(
      street: street,
      city: city,
      state: state,
      country: country,
      timezone: timezone);

  @override
  // TODO: implement props
  List<Object?> get props => [street, city, state, country, timezone];
}
