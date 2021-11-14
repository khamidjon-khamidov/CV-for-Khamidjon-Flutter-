part of home_pages;

class DetailItem extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;

  DetailItem({
    required this.title,
    required this.detail,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: FaIcon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 24,
          ),
          onPressed: () {},
        ),
        Text(
          '$title:    ',
          style: TextStyle(
            color: Theme.of(context).splashColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          detail,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
