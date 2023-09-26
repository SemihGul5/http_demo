
class Category{
  int id=0;
  String categoryName="";
  String seoUrl="";

  //kategori oluşturan constructor
  Category(this.id,this.categoryName,this.seoUrl);

  //gelen dosya json türünde olduğu için onu categrory nesnesine çevirmemiz gerek
  //Json dan gelen datayı MAP olarak geliyor
  Category.fromJson(Map json){
    id=json["id"];
    categoryName=json["categoryName"];
    seoUrl=json["seoUrl"];
  }

  //kategori eklememiz gerekebilir.Onu json formatında gönderiyoruz.
  //yani category nesnesini jsona dönüştür. bunun için bir MAP oluşturulmalı  
  Map toJson(){
    return {
      "id":id,
      "categoryName":categoryName,
      "seoUrl":seoUrl

    };
  }


}



