import 'package:flutter/material.dart';
import 'kabkota.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailKabKota extends StatelessWidget {
  final KabKota data;
  const DetailKabKota({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Kabupaten/Kota')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            Text(
              data.kabupaten_kota,
              style: const TextStyle(
                fontSize: 21.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: SvgPicture.network(
                data.url_peta_wilayah,
                semanticsLabel: 'Peta Wilayah!',
                placeholderBuilder:
                    (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator(),
                    ),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pusat Pemerintahan : ${data.pusat_pemerintahan}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Kepala Daerah : ${data.bupati_walikota}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Tanggal Berdiri : ${data.tanggal_berdiri}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Luas Wilayah : ${data.luas_wilayah} m2",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Jumlah Penduduk : ${data.jumlah_penduduk} jiwa",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Jumlah Kecamatan : ${data.jumlah_kecamatan}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Jumlah Kelurahan : ${data.jumlah_kelurahan}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Jumlah Desa : ${data.jumlah_desa}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Deskripsi Singkat ${data.kabupaten_kota}",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Html(
                    data: data.deskripsi,
                    // Styling with CSS (not real CSS)
                    style: {
                      'h1': Style(color: Colors.red),
                      'p': Style(
                        color: Colors.black87,
                        fontSize: FontSize.medium,
                      ),
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
