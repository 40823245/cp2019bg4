main() {
  int len;
  var type;
  var number;
  List temp = [ "25kg", "30lb", "56lb", "14kg", "68lb", "198kg"];
  for (var data in temp) {
    len = data.length;
    type = data[len-2];
    number = data.substring(0, len-2);
    number = int.parse(number);
    if (type == "k"){
      double type=number*2.2046;
      print("kg:$number, = ${(type).toStringAsFixed(4)} lb");
    }else{
      double type=number*0.4535;
      print("lb:$number, =${(type).toStringAsFixed(4)} kg");
    }
      
  }
} 