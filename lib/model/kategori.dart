class Kategori {
  int kategoriID;
  String kategoriAdi;

  Kategori(this.kategoriAdi);
  Kategori.withID(this.kategoriID, this.kategoriAdi);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['kategoriID'] = this.kategoriID;
    map['kategoriAdi'] = this.kategoriAdi;
    return map;
  }

  Kategori.fromMap(Map<String, dynamic> map) {
    this.kategoriID = map['kategoriID'];
    this.kategoriAdi = map['kategoriAdi'];
  }

  @override
  String toString() {
    return 'Kategori{kategoriD: $kategoriID, kategoriAdi: $kategoriAdi}';
  }
}
