part of home_pages;

class _ExperienceText extends StatelessWidget {
  const _ExperienceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.development_experience,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            S.current.experience_details,
            style: TextStyle(
              height: 1.5,
              color: Theme.of(context).textTheme.headline4!.color!,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
