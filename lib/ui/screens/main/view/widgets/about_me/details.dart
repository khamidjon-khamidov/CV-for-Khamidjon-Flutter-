part of home_pages;

class _Details extends StatelessWidget {
  final AboutMe aboutMe;

  _Details({
    required this.aboutMe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).personal_details,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 12),
        _DetailItem(
          title: S.of(context).name,
          detail: S.current.my_name,
          icon: FontAwesomeIcons.userAlt,
        ),
        _DetailItem(
          title: S.of(context).phone,
          detail: aboutMe.phone,
          icon: FontAwesomeIcons.phone,
        ),
        _DetailItem(
          title: S.of(context).email,
          detail: aboutMe.email,
          icon: FontAwesomeIcons.at,
        ),
        _DetailItem(
          title: S.of(context).education,
          detail: aboutMe.education.map((e) => e.name).toList().join(', '),
          icon: FontAwesomeIcons.graduationCap,
        ),
        _DetailItem(
          title: S.of(context).experience,
          detail: S.of(context).experience_start_date,
          icon: FontAwesomeIcons.graduationCap,
        ),
      ],
    );
  }
}
