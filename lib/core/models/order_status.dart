enum OrderStatus {
  delivering,
  finished,
  canceled,
  working,
  delivered,
  newOrder,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.delivering:
        return 'Delivering';
      case OrderStatus.finished:
        return 'Finished';
      case OrderStatus.canceled:
        return 'Canceled';
      case OrderStatus.working:
        return 'Working';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.newOrder:
        return 'New';
    }
  }

  static OrderStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'delivering':
        return OrderStatus.delivering;
      case 'finished':
        return OrderStatus.finished;
      case 'canceled':
        return OrderStatus.canceled;
      case 'working':
        return OrderStatus.working;
      case 'delivered':
        return OrderStatus.delivered;
      case 'new':
        return OrderStatus.newOrder;
      default:
        throw ArgumentError('Unknown status: $status');
    }
  }
}