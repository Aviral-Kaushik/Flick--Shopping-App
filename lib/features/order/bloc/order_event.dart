import 'package:flick/models/pre_order.dart';

abstract class OrderEvent {

  const OrderEvent();
}

class CreateOrder extends OrderEvent {

  final PreOrder preOrder;

  const CreateOrder(this.preOrder);
}