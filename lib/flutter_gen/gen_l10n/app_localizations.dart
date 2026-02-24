import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// This shim adds the real Flutter localization delegates so the app has
// Material/Cupertino localizations available at runtime. For production
// use, prefer the generated file created by Flutter's gen-l10n tool.
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    final instance =
        Localizations.of<AppLocalizations>(context, AppLocalizations);
    return instance ?? AppLocalizations(const Locale('en'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  String get appTitle => _t({'en': 'Mini Todo App', 'vi': 'Mini Todo App'});

  String get dialogAddTitle => _t({'en': 'Add task', 'vi': 'Thêm task'});
  String get dialogEditTitle => _t({'en': 'Edit task', 'vi': 'Sửa task'});
  String get hintEnterTask =>
      _t({'en': 'Enter task description', 'vi': 'Nhập nội dung task'});
  String get validationEmpty => _t({
        'en': 'Content must not be empty',
        'vi': 'Nội dung không được để trống'
      });
  String get dueNotSet => _t({'en': 'Due: Not set', 'vi': 'Hạn: Chưa đặt'});
  String dueLabel(String datetime) =>
      _t({'en': 'Due: $datetime', 'vi': 'Hạn: $datetime'});
  String createdLabel(String datetime) =>
      _t({'en': 'Created: $datetime', 'vi': 'Tạo: $datetime'});
  String get chooseDue => _t({'en': 'Choose due', 'vi': 'Chọn hạn'});
  String get clearDue => _t({'en': 'Clear', 'vi': 'Xóa'});
  String get cancel => _t({'en': 'Cancel', 'vi': 'Hủy'});
  String get save => _t({'en': 'Save', 'vi': 'Lưu'});
  String get confirmTitle => _t({'en': 'Confirm', 'vi': 'Xác nhận'});
  String get confirmDeleteMessage => _t({
        'en': 'Are you sure you want to delete?',
        'vi': 'Bạn có chắc chắn muốn xóa?'
      });
  String get no => _t({'en': 'No', 'vi': 'Không'});
  String get yes => _t({'en': 'Yes', 'vi': 'Có'});
  String chipsCompleted(int count) =>
      _t({'en': 'Completed: $count', 'vi': 'Đã xong: $count'});
  String chipsActive(int count) =>
      _t({'en': 'Active: $count', 'vi': 'Chưa xong: $count'});
  String get filterAll => _t({'en': 'All', 'vi': 'Tất cả'});
  String get filterActive => _t({'en': 'Active', 'vi': 'Chưa xong'});
  String get filterCompleted => _t({'en': 'Completed', 'vi': 'Đã xong'});
  String get emptyList => _t({
        'en': 'No tasks yet — add a new one.',
        'vi': 'Chưa có task, hãy thêm task mới.'
      });
  String get fabTooltip => _t({'en': 'Add task', 'vi': 'Thêm task'});
  String get editTooltip => _t({'en': 'Edit', 'vi': 'Sửa'});
  String get deleteTooltip => _t({'en': 'Delete', 'vi': 'Xóa'});
  String get categoryHint =>
      _t({'en': 'Category (optional)', 'vi': 'Danh mục (tùy chọn)'});
  String get tagsHint => _t(
      {'en': 'Tags (comma separated)', 'vi': 'Thẻ (ngăn cách bằng dấu phẩy)'});

  String _t(Map<String, String> map) {
    final tag = locale.languageCode;
    return map[tag] ?? map.values.first;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
