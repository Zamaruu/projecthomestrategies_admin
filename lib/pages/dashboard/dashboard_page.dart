import 'package:fluent_ui/fluent_ui.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('Dashboard'),
      ),
    );
  }
}
