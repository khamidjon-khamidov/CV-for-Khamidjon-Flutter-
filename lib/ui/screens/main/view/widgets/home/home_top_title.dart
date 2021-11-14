part of home_pages;

class TopTitle extends StatelessWidget {
  const TopTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            S.current.hiI_am,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.headline5!.color!,
            ),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: Text(
            S.current.my_name,
            style: GoogleFonts.aBeeZee().copyWith(
              fontSize: 24,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
