import 'dart:convert';
class DataServices {
  Future<List> loadData() async {
    String jsonString =
        '{"data":{"genres":[{"name":"Jazz"},{"name":"Classical"},{"name":"Rock"},{"name":"Techno"},{"name":"Trance"},{"name":"Metal"},{"name":"Folk"},{"name":"Pop"},{"name":"Hip Hop"},{"name":"Black Metal"},{"name":"Bass"},{"name":"Soul Music"},{"name":"Country Music"},{"name":"Blues"},{"name":"Electronic"},{"name":"Punk Rock"},{"name":"Disco"},{"name":"Pop Rock"},{"name":"Indie Rock"},{"name":"Orchestra"},{"name":"Ambient Music"},{"name":"World Music"},{"name":"Opera"},{"name":"Contemporary"},{"name":"Drum & Bass"},{"name":"Experimental"},{"name":"Death Metal"},{"name":"Synth Pop"},{"name":"Trap"},{"name":"Breakbeat"},{"name":"Dutch Rock"},{"name":"Frenchcore"},{"name":"Gabber"},{"name":"Indorock"},{"name":"Jordaanlied"},{"name":"Levenslied"},{"name":"Nederpop"},{"name":"Palingsound"},{"name":"Ultra"}]}}';
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    List<dynamic> genres = jsonData['data']['genres'];


    return genres.map((e) => e['name']).toList();
  }
}