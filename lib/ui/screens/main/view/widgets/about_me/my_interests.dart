part of home_pages;

class MyInterests extends StatelessWidget {
  const MyInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).my_interests,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.chess,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              onPressed: () {},
            ),
            Text(
              S.of(context).chess,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 12),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.map,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              onPressed: () {},
            ),
            Text(
              S.of(context).travel,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 12),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.film,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              onPressed: () {},
            ),
            Text(
              S.of(context).film,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 12),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.music,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              onPressed: () {},
            ),
            Text(
              S.of(context).music,
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
