class akunAmil {
  String image;
  String title;
  int bintang;
  int pengikut;
  int aksiGalangAmal;

  akunAmil({this.image, this.title, this.bintang, this.pengikut, this.aksiGalangAmal});
}

var akunAmils = [
  akunAmil(
      image: "assets/images/default_picture_man.png",
      title: "Bamuis BNI",
      bintang: 4,
      pengikut: 1234,
      aksiGalangAmal: 9),
  akunAmil(
      image: "assets/images/default_picture_woman.png",
      title: "Dewan Da'wah",
      bintang: 4,
      pengikut: 3134,
      aksiGalangAmal: 4),
  akunAmil(
      image: "assets/images/default_picture_man.png",
      title: "Yayasan TDI",
      bintang: 5,
      pengikut: 9934,
      aksiGalangAmal: 11),
];
