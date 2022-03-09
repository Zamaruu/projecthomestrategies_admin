// ignore_for_file: prefer_initializing_formals

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projecthomestrategies_admin/bloc/model/api_response.dart';

class ApiResponseMessage {
  late BuildContext context;
  late ApiResponse response;
  late Color toastColor;
  late Icon toastIcon;
  late bool _showWhenSuccess;

  ApiResponseMessage({
    required BuildContext context,
    required ApiResponse response,
    bool showWhenSuccess = false,
  }) {
    this.context = context;
    this.response = response;
    _showWhenSuccess = showWhenSuccess;

    toastColor = _generateColorForResponse();
    toastIcon = _generateIconForResponse();
  }

  Icon _generateIconForResponse() {
    var code = response.statusCode;

    if (code >= 200 && code <= 299) {
      return const Icon(
        FluentIcons.accept,
        color: Colors.white,
      );
    } else if (code >= 300 && code <= 399) {
      return const Icon(
        FluentIcons.warning,
        color: Colors.white,
      );
    } else if (code >= 400 && code <= 499) {
      return const Icon(
        FluentIcons.error_badge,
        color: Colors.white,
      );
    } else {
      return const Icon(
        FluentIcons.critical_error_solid,
        color: Colors.white,
      );
    }
  }

  Color _generateColorForResponse() {
    var code = response.statusCode;

    if (code >= 200 && code <= 299) {
      return Colors.green;
    } else if (code >= 300 && code <= 399) {
      return Colors.grey;
    } else if (code >= 400 && code <= 499) {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }

  void showToast() {
    if (!_showWhenSuccess) {
      return;
    }

    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: toastColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          toastIcon,
          const SizedBox(
            width: 12.0,
          ),
          Text(response.message ?? ""),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP_RIGHT,
      toastDuration: const Duration(seconds: 4),
    );
  }
}
