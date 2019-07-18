class DiscountModel {
  final String name;
  final String price;
  final String description;
  final int discount_amount;
  final int discount_percent;
  final String unit;
  final String img_url;
  final int on_move;
  final String vendor_id;
  final String product_id;


  DiscountModel._({
    this.name, this.price,this.description,this.discount_amount,
    this.discount_percent, this.unit,this.img_url,this.on_move,
    this.vendor_id, this.product_id
  
  
  
  
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return new DiscountModel._(
      // image: json['image'],
      // link: json['link'],
      // title: json['title'],
      // ch_name: json['ch_name'],

  name: json['name'],
  price: json['price'],
  description: json['description'],
  discount_amount: json['discount_amount'],
  discount_percent: json['discount_percent'],
  unit: json['unit'],
  img_url: json['img_url'],
  on_move: json['on_move'],
  vendor_id: json['vendor_id'],
  product_id: json['product_id'],
    );
  }
}

