import "dart:html";

lbtokg(num lb){
return lb*0.4536;
}

kgtolb(num kg){
return kg*2.2046;
}

main() {
    
    InputElement weightInput = querySelector("#weight");
    querySelector("#submit").onClick.listen((e) => convert(weightInput.value));
}

convert(String data){ 
  int len;  
  var type;  
  var number;
  
  LabelElement output = querySelector("#output");
  
  len = data.length;  
  type = data[len-2];
  number = data.substring(0, len-2);
  
  number = int.parse(number);
  if (type == "L" || type == "l"){
     output.innerHtml = " $number LB =  ${lbtokg(number).toStringAsFixed(4)} KG";
  } else if ((type == "K" || type == "k")){
     output.innerHtml = " $number KG =  ${kgtolb(number).toStringAsFixed(4)} LB";
  } else {
     output.innerHtml = "請輸入數字加上 LB 或 KG!";
  }
} 
