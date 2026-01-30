class ThemeState {
  final bool isDark;

  const ThemeState(this.isDark);

  factory ThemeState.initial(){
    return const ThemeState(true);
  }
}


