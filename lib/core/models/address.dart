class Address {
  final String title;          
  final String contactName;    
  final String phoneNumber;    
  final String fullAddress;    
  final String? apartment;          
  final String? building;      
  final String? street;        
  final String? city;          
  final String? country;       

  const Address({
    required this.title,
    required this.contactName,
    required this.phoneNumber,
    required this.fullAddress,
    this.apartment,
    this.building,
    this.street,
    this.city,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      title: json['title'],
      contactName: json['contact_name'],
      phoneNumber: json['phone_number'],
      fullAddress: json['full_address'],
      apartment: json['apartment'],
      building: json['building'],
      street: json['street'],
      city: json['city'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'contact_name': contactName,
      'phone_number': phoneNumber,
      'full_address': fullAddress,
      'apartment': apartment,
      'building': building,
      'street': street,
      'city': city,
      'country': country,
    };
  }
}