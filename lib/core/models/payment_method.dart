enum PaymentMethod {
  credit,
  onDelivery,
  knet
}


 extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.credit:
        return 'Credit';
      case PaymentMethod.onDelivery:
        return 'On Delivery';
      case PaymentMethod.knet:
        return 'Knet';
    }
  }

  static PaymentMethod fromString(String status) {
    switch (status.toLowerCase()) {
      case 'credit':
        return PaymentMethod.credit;
      case 'on_delivery':
        return PaymentMethod.onDelivery;
      case 'knet':
        return PaymentMethod.knet;
      default:
        throw ArgumentError('Unknown payment method: $status');
    }
  }
}