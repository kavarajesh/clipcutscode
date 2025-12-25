import 'package:clipcuts/resources/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OverlayEntry? _overlayEntry;

OverlayEntry _createOverlayEntry() {
  return OverlayEntry(
    builder: (context) => Positioned(
      child: Material(
        color: Colors.black45,
        child: Center(
          child: Container(
            width: 100.r,
            height: 100.r,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CircularProgressIndicator(color: primaryColor),
          ),
        ),
      ),
    ),
  );
}

bool isLoading = false;

void showLoading(BuildContext context) {
  if (!isLoading) {
    isLoading = true;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }
}

void dismissLoading() {
  if (isLoading) {
    isLoading = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
