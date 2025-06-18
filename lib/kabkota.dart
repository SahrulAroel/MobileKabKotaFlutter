class KabKota {
  final int id;
  final String kabupaten_kota;
  final String pusat_pemerintahan;
  final String bupati_walikota;
  final String tanggal_berdiri;
  final double luas_wilayah;
  final int jumlah_penduduk;
  final int jumlah_kecamatan;
  final int jumlah_kelurahan;
  final int jumlah_desa;
  final String url_peta_wilayah;
  final String deskripsi;
  final String logo;

  const KabKota({
    required this.id,
    required this.kabupaten_kota,
    required this.pusat_pemerintahan,
    required this.bupati_walikota,
    required this.tanggal_berdiri,
    required this.luas_wilayah,
    required this.jumlah_penduduk,
    required this.jumlah_kecamatan,
    required this.jumlah_kelurahan,
    required this.jumlah_desa,
    required this.url_peta_wilayah,
    required this.deskripsi,
    required this.logo,
  });

  factory KabKota.fromJson(Map<String, dynamic> json) {
    return KabKota(
      id: json['id'],
      kabupaten_kota: json['kabupaten_kota'],
      pusat_pemerintahan: json['pusat_pemerintahan'],
      bupati_walikota: json['bupati_walikota'],
      tanggal_berdiri: json['tanggal_berdiri'],
      luas_wilayah: (json['luas_wilayah']).toDouble(),
      jumlah_penduduk: json['jumlah_penduduk'],
      jumlah_kecamatan: json['jumlah_kecamatan'],
      jumlah_kelurahan: json['jumlah_kelurahan'],
      jumlah_desa: json['jumlah_desa'],
      url_peta_wilayah: json['url_peta_wilayah'],
      deskripsi: json['deskripsi'],
      logo: json['logo'],
    );
  }
}
