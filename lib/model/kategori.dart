class Kategori {
  int kategoriID;
  String kategoriResim;
  String kategoriAdi;

  Kategori(this.kategoriAdi);
  Kategori.withID(this.kategoriID, this.kategoriAdi, this.kategoriResim);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['kategoriID'] = this.kategoriID;
    map['kategoriAdi'] = this.kategoriAdi;
    map['kategoriResim'] = this.kategoriResim;

    return map;
  }

  Kategori.fromMap(Map<String, dynamic> map) {
    this.kategoriID = map['kategoriID'];
    this.kategoriAdi = map['kategoriAdi'];
    this.kategoriResim = map['kategoriResim'];
  }

  @override
  String toString() {
    return 'Kategori{kategoriD: $kategoriID, kategoriAdi: $kategoriAdi, kategoriResim:$kategoriResim}';
  }
}
