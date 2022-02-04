import 'package:fluent_ui/fluent_ui.dart';

class UserPage extends StatelessWidget {
  final ScrollController controller = ScrollController();
  UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: const Text('Benutzer'),
        commandBar: Row(
          children: <Widget>[
            Button(
              child: Row(
                children: const [
                  Icon(FluentIcons.add),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Neuer Administrator"),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      content: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const CircleAvatar(),
            title: Text("Name $index"),
            subtitle: Text("Untertitel $index"),
            trailing: IconButton(
              icon: const Icon(FluentIcons.collapse_menu),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
