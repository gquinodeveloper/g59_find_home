class RequestUserModel {
    RequestUserModel({
        this.name,
        this.lastname,
        this.adress,
        this.email,
        this.password,
    });

    String? name;
    String? lastname;
    String? adress;
    String? email;
    String? password;

    factory RequestUserModel.fromJson(Map<String, dynamic> json) => RequestUserModel(
        name: json["name"],
        lastname: json["lastname"],
        adress: json["adress"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "adress": adress,
        "email": email,
        "password": password,
    };
}
