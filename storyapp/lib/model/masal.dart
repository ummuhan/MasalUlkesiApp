class Masal {
  int masalID;
  int kategoriID;

  String masalAdi;
  Masal(this.masalAdi, this.kategoriID);
  Masal.withID(this.masalID, this.masalAdi, this.kategoriID);

  Map<String, dynamic> toMap() {
    //Gelen nesneyi mape çevirir.
    var map = Map<String, dynamic>();
    map["masalID"] = this.masalID;
    map["kategoriD"] = this.kategoriID;
    map["masalAdi"] = this.masalAdi;
    return map;
  }

  Masal.fromMap(Map<String, dynamic> map) {
    //Gelen mapi nesneye çevirir.
    this.masalID = map["masalID"];
    this.kategoriID = map["kategoriID"];
    this.masalAdi = map["masalAdi"];
  }
  @override
  String toString() {
    return "Masal ID: $masalID Masal Adi: $masalAdi Kategori Id: $kategoriID";
  }
}
