import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/core/values/app_text_style.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {super.key,
      this.border,
      this.textColor,
      required this.text,
      this.onTap,
      this.padding,
      this.duration,
      this.color,
      this.borderradius,
      this.icon,
      this.enabled = true,
      this.boxShadow});
  final String text;
  final Duration? duration;
  final Future<void> Function()? onTap;
  final Color? color;
  final BoxBorder? border;
  final double? padding;
  final double? borderradius;
  final BoxShadow? boxShadow;
  final Widget? icon;
  final Color? textColor;
  final bool enabled;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _scale;
  late AnimationController _controller;
  bool isLoading = false;
  RenderBox? childRenderBox;
  final GlobalKey _keys = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 200),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.9)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      childRenderBox = _keys.currentContext?.findRenderObject() as RenderBox;
    });
  }

  bool _isOutsideChildBox(Offset touchPosition) {
    final RenderBox childRenderBox =
        _keys.currentContext?.findRenderObject() as RenderBox;
    final Size childSize = childRenderBox.size;
    final Offset childPosition = childRenderBox.localToGlobal(Offset.zero);

    return touchPosition.dx < childPosition.dx ||
        touchPosition.dx > childPosition.dx + childSize.width ||
        touchPosition.dy < childPosition.dy ||
        touchPosition.dy > childPosition.dy + childSize.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      key: _keys,
      onPointerDown: (PointerDownEvent event) {
        if (isLoading) return;
        _controller.forward();
      },
      onPointerUp: (PointerUpEvent event) async {
        if (isLoading) return;
        _controller.reverse();
        if (_isOutsideChildBox(event.position)) return;
        setState(() {
          isLoading = true;
        });
        widget.onTap?.call().then((value) {
          if (!widget.enabled) {
            return;
          }
          setState(() {
            isLoading = false;
          });
        });
      },
      child: ScaleTransition(
        scale: _scale,
        child: Container(
            width: double.maxFinite,
            padding: (widget.padding != null)
                ? EdgeInsets.all(widget.padding!)
                : const EdgeInsets.symmetric(vertical: 13, horizontal: 0),
            decoration: BoxDecoration(
                color: widget.color ?? AppColors.primary60,
                // boxShadow: [
                //   BoxShadow(
                //       offset: const Offset(0, 5),
                //       color: const Color(0xffA5A5A5).withOpacity(0.45),
                //       blurRadius: 40),
                // ],
                border: widget.border,
                borderRadius: BorderRadius.circular(widget.borderradius ?? 8)),
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(5),
                    child: SpinKitFadingCube(
                      color: Colors.white,
                      size: 10,
                    ),
                  )
                : widget.icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.text,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          widget.icon ?? Container()
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.text,
                            style: Ts.text.regularTextBase16pxRegular
                                .withColor(widget.textColor ?? AppColors.white),
                          ),
                        ],
                      )),
      ),
    );
  }
}
