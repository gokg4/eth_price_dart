import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

void main () async {
    var queryParameters = {
        'vs_currencies': 'inr,usd,eur,gbp',
        'ids': 'ethereum'
    };
    var now = DateFormat.yMMMd().add_jm().format(DateTime.now());
    var url = Uri.https('api.coingecko.com', '/api/v3/simple/price', queryParameters);
    var response = await http.get(url);
    
    if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        final inr = jsonResponse['ethereum']?['inr'];
        final usd = jsonResponse['ethereum']?['usd'];
        final eur = jsonResponse['ethereum']?['eur'];
        final gbp = jsonResponse['ethereum']?['gbp'];
        print('Ethereum Price Today($now) in INR: $inr, USD: $usd, EUR: $eur, GBP: $gbp');        
    }   else {
        print('response.statusCode');
    }
}
