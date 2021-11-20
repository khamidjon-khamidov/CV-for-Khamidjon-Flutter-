part of skills_page;

class _SkillPercentage extends StatefulWidget {
  final ThemeData theme;
  final int percentage;
  final bool isAnimatable;
  _SkillPercentage(
    this.percentage,
    this.isAnimatable,
    this.theme, {
    Key? key,
  }) : super(key: key);

  @override
  _SkillPercentageState createState() => _SkillPercentageState();
}

class _SkillPercentageState extends State<_SkillPercentage> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Color?>? colorAnimation;
  Animation<double>? percentageAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.isAnimatable) {
      logger.d('isAnimatable: true, percentage: ${widget.percentage}');

      controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
      );

      colorAnimation = ColorTween(
        begin: widget.theme.errorColor,
        end: getFinalColor(),
      ).animate(controller!);

      percentageAnimation = Tween<double>(
        begin: 0,
        end: widget.percentage.toDouble(),
      ).animate(controller!)
        ..addListener(() {
          setState(() {});
        });

      controller!.forward();
    }
  }

  Color getFinalColor() {
    if (widget.percentage < 40) {
      return widget.theme.errorColor;
    } else if (widget.percentage < 70) {
      return widget.theme.colorScheme.warning;
    } else {
      return widget.theme.colorScheme.success;
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 40.h,
        child: LiquidLinearProgressIndicator(
          value: (percentageAnimation?.value ?? widget.percentage) / 100, // Defaults to 0.5.
          valueColor: //colorAnimation ??
              AlwaysStoppedAnimation(
            colorAnimation?.value ?? getFinalColor(),
          ), // Defaults to the current Theme's accentColor.
          backgroundColor: Theme.of(context)
              .scaffoldBackgroundColor, // Defaults to the current Theme's backgroundColor.
          borderColor: Theme.of(context).colorScheme.secondary,
          borderWidth: 2.0.r,
          borderRadius: 8.0.r,

          direction: Axis
              .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
          center: Text(
            // "${percentageAnimation?.value ?? widget.percentage}%",
            "",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
