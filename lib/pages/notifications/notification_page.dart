import 'package:fluent_ui/fluent_ui.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('Benachrichtigungen'),
      ),
    );
  }
}
