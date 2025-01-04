import 'package:flick/models/pre_order.dart';

abstract class OrderEvent {

  const OrderEvent();
}

class PostOrder extends OrderEvent {

  final PreOrder preOrder;

  const PostOrder(this.preOrder);
}