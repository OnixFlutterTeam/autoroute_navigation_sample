class FavouriteScreenState {
  FavouriteScreenState({
    this.reportAvailable = false,
  });

  bool reportAvailable;

  FavouriteScreenState copyWith({
    bool? reportAvailable,
  }) {
    return FavouriteScreenState(
      reportAvailable: reportAvailable ?? this.reportAvailable,
    );
  }
}
