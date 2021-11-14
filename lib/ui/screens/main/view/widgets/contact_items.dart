part of home_pages;

class ContactItems extends StatelessWidget {
  const ContactItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        ContactLink(
          title: 'Github',
          link: 'https://github.com/SomeoneAndNoone',
          icon: FontAwesomeIcons.github,
        ),
        SizedBox(width: 16),
        ContactLink(
          title: 'LinkedIn',
          link: 'https://www.linkedin.com/in/khamidjon-khamidov-a31128194/',
          icon: FontAwesomeIcons.linkedin,
        ),
        SizedBox(width: 16),
        ContactLink(
          title: 'StackOverflow',
          link: 'https://stackoverflow.com/users/11984583/khamidjon-khamidov',
          icon: FontAwesomeIcons.stackOverflow,
        ),
        SizedBox(width: 16),
        ContactLink(
          title: 'Website',
          link: 'https://cvforkhamidjon.herokuapp.com/',
          icon: FontAwesomeIcons.globe,
        ),
        SizedBox(width: 16),
        ContactLink(
          title: 'Facebook',
          link: 'https://www.facebook.com/khamidjon.khamidov',
          icon: FontAwesomeIcons.facebook,
        ),
        SizedBox(width: 16),
        ContactLink(
          title: 'Telegram',
          link: 'http://t.me/work_smard',
          icon: FontAwesomeIcons.telegram,
        ),
        Spacer(),
      ],
    );
  }
}
