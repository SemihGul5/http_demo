import 'package:http/http.dart' as http;

class CategoryApi{
  
  //static kullanınca ProductApi.getProducts() yazıp çalıştırmamızı sağlar

  static Future getCategories(){
  return http.get(Uri.parse("http://10.0.2.2:3000/categories")); // Uri.parse metodu ile String'i Uri'ye dönüştür
}



}