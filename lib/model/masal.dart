class Masal {
  int masalID;
  int kategoriID;
  String masalMetni;
  String masalAdi;
  Masal(this.masalAdi, this.kategoriID, this.masalMetni);
  Masal.withID(this.masalID, this.masalAdi, this.kategoriID, this.masalMetni);

  Map<String, dynamic> toMap() {
    //Gelen nesneyi mape çevirir.
    var map = Map<String, dynamic>();
    map["masalID"] = this.masalID;
    map["kategoriD"] = this.kategoriID;
    map["masalAdi"] = this.masalAdi;
    map["masalMetni"] = this.masalMetni;
    return map;
  }

  Masal.fromMap(Map<String, dynamic> map) {
    //Gelen mapi nesneye çevirir.
    this.masalID = map["masalID"];
    this.kategoriID = map["kategoriID"];
    this.masalAdi = map["masalAdi"];
    this.masalMetni = map["masalMetni"];
  }
  @override
  String toString() {
    return "Masal ID: $masalID Masal Adi: $masalAdi Kategori Id: $kategoriID Masal Metni $masalMetni";
  }
}
