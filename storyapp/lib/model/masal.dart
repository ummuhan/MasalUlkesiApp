class Masal {
  int masalID;
  String masalAdi;
  Masal(this.masalAdi);
  Masal.withID(this.masalID, this.masalAdi);

  Map<String, dynamic> toMap() {
    //Gelen nesneyi mape çevirir.
    var map = Map<String, dynamic>();
    map["masalID"] = this.masalID;
    map["masalAdi"] = this.masalAdi;
    return map;
  }

  Masal.fromMap(Map<String, dynamic> map) {
    //Gelen mapi nesneye çevirir.
    this.masalID = map["masalID"];
    this.masalAdi = map["masalAdi"];
  }
  @override
  String toString() {
    return "Masal ID: $masalID Masal Adi: $masalAdi";
  }
}
