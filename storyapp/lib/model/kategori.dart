class Kategori {
  int kategoriID;
  String kategoriAdi;

  Kategori(this.kategoriAdi);
  Kategori.withID(this.kategoriID, this.kategoriAdi);

  Map<String, dynamic> fromMap() {
    var map = Map<String, dynamic>();
    this.kategoriID = map['kategoriID'];
    this.kategoriAdi = map['kategoriAdi'];
  }

  Kategori.toMap(Map<String, dynamic> map) {
    map['kategoriID'] = this.kategoriID;
    map['kategoriAdi'] = this.kategoriAdi;
  }

  @override
  String toString() {
    return 'Kategori{kategoriD: $kategoriID, kategoriAdi: $kategoriAdi}';
  }
}
