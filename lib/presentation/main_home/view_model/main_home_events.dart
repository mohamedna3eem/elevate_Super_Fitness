
sealed class MainHomeEvent {}

class OnBottomNavBarTappedEvent extends MainHomeEvent {
  final int index;
  OnBottomNavBarTappedEvent(this.index);
}

class OnPageChangedEvent extends MainHomeEvent {
  final int index;
  OnPageChangedEvent(this.index);
}

class OnScrollUpdateEvent extends MainHomeEvent {
  final double pixels;
  final double scrollDelta;

  OnScrollUpdateEvent(this.pixels, this.scrollDelta);
}
