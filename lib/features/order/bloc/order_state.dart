abstract class OrderState {

  const OrderState();
}

class InitialOrderState extends OrderState {

  const InitialOrderState();
}

class OrderLoadingState extends OrderState {
  final String progressMessage;

  const OrderLoadingState(this.progressMessage);
}

class OrderCreated extends OrderState {

  const OrderCreated();
}

class OrderError extends OrderState {
  final String errorMessage;

  const OrderError(this.errorMessage);
}
