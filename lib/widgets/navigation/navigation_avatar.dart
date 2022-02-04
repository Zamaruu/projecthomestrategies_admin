import 'package:fluent_ui/fluent_ui.dart';

class NavigationAvatar extends StatefulWidget {
  const NavigationAvatar({Key? key}) : super(key: key);

  @override
  State<NavigationAvatar> createState() => _NavigationAvatarState();
}

class _NavigationAvatarState extends State<NavigationAvatar> {
  final FlyoutController controller = FlyoutController();

  Row item(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Flyout(
      content: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: FlyoutContent(
          padding: EdgeInsets.zero,
          child: ListView(shrinkWrap: true, children: [
            TappableListTile(
              title: item(
                "Einstellungen",
                FluentIcons.settings,
              ),
              onTap: () {},
            ),
            TappableListTile(
              title: item(
                "Abmelden",
                FluentIcons.sign_out,
              ),
              onTap: () {},
            ),
          ]),
        ),
      ),
      verticalOffset: 20,
      contentWidth: 200,
      controller: controller,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => controller.open = true,
          child: const CircleAvatar(
            child: Text("HS"),
          ),
        ),
      ),
    );
  }
}
