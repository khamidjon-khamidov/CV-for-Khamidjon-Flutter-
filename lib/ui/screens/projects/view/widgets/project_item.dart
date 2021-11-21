part of projects_page;

class ProjectItem extends StatelessWidget {
  final Project project;

  ProjectItem(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTap(
          onPressed: () {},
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 1.0.w,
              ),
            ),
            borderOnForeground: true,
            child: Container(
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    project.title,
                    style: GoogleFonts.alegreya().copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      project.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.mediumEmphasisTextDark,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        project.time,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.disabledTextDark,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
