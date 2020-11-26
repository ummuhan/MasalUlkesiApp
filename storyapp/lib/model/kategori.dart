class Kategori {
  int kategorID;
  String kategoriAdi;

  Kategori(this.kategoriAdi);
  Kategori.withID(this.kategorID, this.kategoriAdi);

  Map<String, dynamic> fromMap() {
    var map = Map<String, dynamic>();
    this.kategorID = map['kategoriID'];
    this.kategoriAdi = map['kategoriAdi'];
  }

  Kategori.toMap(Map<String, dynamic> map) {
    map['kategoriID'] = this.kategorID;
    map['kategoriAdi'] = this.kategoriAdi;
  }

  @override
  String toString() {
    return 'Kategori{kategoriD: $kategorID, kategoriAdi: $kategoriAdi}';
  }
}
