enum OrderStatus { canceled,delivering, shipped, confirmed, delivered, placed }

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.delivering:
        return 'Delivering';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.canceled:
        return 'Canceled';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.placed:
        return 'Placed';
    }
  }

  static OrderStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'delivering':
        return OrderStatus.delivering;
      case 'shipped':
        return OrderStatus.shipped;
      case 'canceled':
        return OrderStatus.canceled;
      case 'confirmed':
        return OrderStatus.confirmed;
      case 'delivered':
        return OrderStatus.delivered;
      case 'placed':
        return OrderStatus.placed;
      default:
        throw ArgumentError('Unknown status: $status');
    }
  }
}
