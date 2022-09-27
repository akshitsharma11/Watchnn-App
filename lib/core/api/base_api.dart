// // ignore_for_file: avoid_print
//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
//
//
// String baseUrl = "http://92.205.28.214:3000/api/v1";
// // String baseUrl = "https://personalityapp.herokuapp.com/api/v1";
//
// Future getRequest(String path) async {
//   final response = await http.get(
//     Uri.parse("$baseUrl$path"),
//   );
//   if (response.statusCode == 200) {
//     return jsonDecode(response.body);
//   } else {
//     return {"status": false, "message": "Failed to load data from $path"};
//   }
// }
//
// Future postRequest(String path, {Map? data}) async {
//   log(json.encode(data));
//   var headers = {'Content-Type': 'application/json'};
//   http.Response response = await http.post(
//     Uri.parse("$baseUrl$path"),
//     headers: headers,
//     body: json.encode(data),
//   );
//   Map responseBody = json.decode(response.body);
//   if (responseBody["status"]) {
//     return responseBody;
//   } else {
//     log(response.reasonPhrase!);
//     return responseBody;
//   }
// }
//
// imageUploadApi(
//   BuildContext context, {
//   required String path,
//   String? image,
// }) async {
//   String url = "$baseUrl$path";
//   var postUri = Uri.parse(url);
//   var request = http.MultipartRequest("POST", postUri);
//   if (image != "") {
//     final imageFile = await http.MultipartFile.fromPath(
//       "photo",
//       image!,
//     );
//     request.files.add(imageFile);
//   }
//
//   try {
//     final streamedResponse = await request.send();
//     final response = await http.Response.fromStream(streamedResponse);
//     print(response.body);
//     Map res = json.decode(response.body);
//     if (res["status"]) {
//       return res;
//     } else {
//       showSnackbar(context, res["message"]);
//       return false;
//     }
//   } catch (e) {
//     print(e);
//     showSnackbar(context, e.toString());
//     return false;
//   }
// }
