part of projects_page;

class _ProjectButton extends StatelessWidget {
  final String title;
  final String link;

  _ProjectButton(
    this.title,
    this.link, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ScaleTap(
      onPressed: () async {
        if (link.isNotEmpty && await canLaunch(link)) {
          await launch(link);
        } else {
          AppSnackBar.showError(
            ScaffoldMessenger.of(context),
            title: S.current.sorry_app_not_available_in_store,
          );
        }
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.0.w,
          ),
        ),
        child: Container(
          width: width,
          height: 40.h,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
