class Masal {
  int masalID;
  int kategoriID;
  String masalMetni;
  String masalAdi;
  String masalResmi;
  String masalRenk;
  Masal(this.masalAdi, this.kategoriID, this.masalMetni, this.masalRenk,
      this.masalResmi);
  Masal.withID(this.masalID, this.masalAdi, this.kategoriID, this.masalMetni,
      this.masalRenk, this.masalResmi);

  Map<String, dynamic> toMap() {
    //Gelen nesneyi mape çevirir.
    var map = Map<String, dynamic>();
    map["masalID"] = this.masalID;
    map["kategoriD"] = this.kategoriID;
    map["masalAdi"] = this.masalAdi;
    map["masalMetni"] = this.masalMetni;
    map["masalRenk"] = this.masalRenk;
    map["masalResmi"] = this.masalResmi;
    return map;
  }

  Masal.fromMap(Map<String, dynamic> map) {
    //Gelen mapi nesneye çevirir.
    this.masalID = map["masalID"];
    this.kategoriID = map["kategoriID"];
    this.masalAdi = map["masalAdi"];
    this.masalMetni = map["masalMetni"];
    this.masalRenk = map["masalRenk"];
    this.masalResmi = map["masalResmi"];
  }
  @override
  String toString() {
    return "Masal ID: $masalID Masal Adi: $masalAdi Kategori Id: $kategoriID Masal Metni $masalMetni Masal Renk $masalRenk Masal Resmi $masalResmi";
  }
}
