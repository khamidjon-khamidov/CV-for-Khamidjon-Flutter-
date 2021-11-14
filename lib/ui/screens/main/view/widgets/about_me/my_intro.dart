part of home_pages;

class MyIntro extends StatelessWidget {
  const MyIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.my_intro,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Text(
          S.current.experience_description,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline4!.color!,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
