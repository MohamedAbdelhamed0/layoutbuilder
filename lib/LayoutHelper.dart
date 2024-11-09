class LayoutHelper {
  // Generic method to get a responsive value based on screen width
  static T getResponsiveValue<T>({
    required double screenWidth,
    required T small,
    T? medium,
    T? large,
  }) {
    if (screenWidth < 300) {
      return small;
    } else if (screenWidth < 600 && medium != null) {
      return medium;
    } else if (large != null) {
      return large;
    }
    return small; // Default to small if no other conditions match
  }
}
