part of 'dashboard_cubit.dart';

class DashboardState {
  const DashboardState({this.selectedIndex = 0});

  final int selectedIndex;

  DashboardState copyWith({int? selectedIndex}) {
    return DashboardState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
