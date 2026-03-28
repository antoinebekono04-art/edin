import 'package:flutter/cupertino.dart';
import 'package:eden/l10n/app_localizations.dart';

class LangText {
  BuildContext context;
  late AppLocalizations local;

  LangText(this.context) {
    local = AppLocalizations.of(context)!;
  }
}
