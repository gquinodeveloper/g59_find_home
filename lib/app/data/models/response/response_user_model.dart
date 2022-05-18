class ResponseUserModel {
    ResponseUserModel({
        this.idUser,
        this.name = "",
        this.lastname,
        this.address,
        this.email,
        this.password,
    });

    int? idUser;
    late String name;
    String? lastname;
    String? address;
    String? email;
    String? password;

    factory ResponseUserModel.fromJson(Map<String, dynamic> json) => ResponseUserModel(
        idUser: json["idUser"],
        name: json["name"],
        lastname: json["lastname"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "name": name,
        "lastname": lastname,
        "address": address,
        "email": email,
        "password": password,
    };
}
