part of home_pages;

class SkillDescription extends StatelessWidget {
  final String description;

  SkillDescription({
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 24),
        Text(
          S.current.flutter_developer,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: 450,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
