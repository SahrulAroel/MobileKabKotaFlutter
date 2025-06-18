import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'kabkota.dart';
import 'detail_kabkota.dart';
import 'about_developer.dart';

class KabKotaListView extends StatefulWidget {
  const KabKotaListView({super.key});

  @override
  KabKotaListViewState createState() => KabKotaListViewState();
}

class KabKotaListViewState extends State<KabKotaListView> {
  static const String URL = "http://192.168.212.35/kabupaten-kota";
  late Future<List<KabKota>> result_data;

  @override
  void initState() {
    super.initState();
    result_data = _fetchKabKota();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kabupaten/Kota App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AboutDeveloper(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<KabKota>>(
        future: result_data,
        builder: (context, snapshot) {
          return RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Center(child: _listView(snapshot)),
          );
        },
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      result_data = _fetchKabKota();
    });
  }

  Widget _listView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<KabKota>? data = snapshot.data;
      return _kabKotaListView(data!);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return const CircularProgressIndicator();
  }

  Future<List<KabKota>> _fetchKabKota() async {
    var url = Uri.parse("$URL/api/read_kabkota.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonData = jsonResponse['data'];
      return jsonData.map((kabKota) => KabKota.fromJson(kabKota)).toList();
    } else {
      throw Exception("Failed to load data from API");
    }
  }

  ListView _kabKotaListView(List<KabKota> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(context, data[index]);
      },
    );
  }

  ListTile _tile(BuildContext context, KabKota data) => ListTile(
    title: Text(
      data.kabupaten_kota,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    subtitle: Text("Pusat Pemerintahan: ${data.pusat_pemerintahan}"),
    leading: Image.network(
      "$URL/image/logo/${data.logo}",
      width: 50,
      height: 100,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DetailKabKota(data: data),
        ),
      );
    },
  );
}
