import 'package:fluent_ui/fluent_ui.dart';

class HouseholdPage extends StatelessWidget {
  const HouseholdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('Haushalte'),
      ),
    );
  }
}
