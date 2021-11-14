part of home_pages;

class ContactLink extends StatelessWidget {
  final String title;
  final String link;
  final IconData icon;

  ContactLink({
    required this.title,
    required this.link,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
          icon: FaIcon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 32,
          ),
          onPressed: () async => await canLaunch(link) ? await launch(link) : () {},
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
