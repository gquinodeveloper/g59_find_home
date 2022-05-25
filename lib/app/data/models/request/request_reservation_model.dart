class RequestReservationModel {
    RequestReservationModel({
        this.idUser,
        this.idHouse,
        this.date,
        this.price,
    });

    int? idUser;
    int? idHouse;
    String? date;
    String? price;

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idHouse": idHouse,
        "date": date,
        "price": price,
    };
}
