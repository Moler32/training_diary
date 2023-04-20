import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_diary/core/constants/images.dart';
import 'package:training_diary/core/di/injection.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/cubit/locale_cubit/locale_cubit.dart';
import 'package:training_diary/src/data_sources/isar_db/isar.dart';
import 'package:training_diary/src/models/locale/locale_model.dart';

import 'package:training_diary/src/ui/widgets/app_bar/profile_app_bar.dart';
import 'package:training_diary/src/ui/widgets/language/language_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LocaleCubit _localeCubit = LocaleCubit(getIt<IsarDB>());

  @override
  void initState() {
    super.initState();
    _localeCubit.getLanguage();
  }

  final List<LocaleModel> list = [
    LocaleModel('uk', ukraineFlag, 'Український'),
    LocaleModel('en', usaFlag, 'USA')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
        title: LocaleKeys.settings.tr(),
      ),
      body: BlocConsumer<LocaleCubit, LocaleState>(
          bloc: _localeCubit,
          listener: (context, state) {
            state.maybeWhen(
              errorLocale: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              orElse: () {},
            );
          },
          buildWhen: (prev, curr) {
            return curr is ErrorLocale || curr is ChangedLocale;
          },
          builder: (context, state) {
            return state.maybeWhen(changedLocale: (localeModel) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      LocaleKeys.chooseLanguage.tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    DropdownButton(
                      value: localeModel.language == 'en' ? list[1] : list[0],
                      items: list.map<DropdownMenuItem<LocaleModel>>(
                          (LocaleModel value) {
                        return DropdownMenuItem<LocaleModel>(
                          value: value,
                          child: SizedBox(
                            height: 140,
                            width: 140,
                            child: Center(
                              child: LanguageMenuItem(
                                image: value.image,
                                language: value.language,
                                title: value.title,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: <LocaleModel>(value) {
                        _localeCubit.saveLanguage(
                            value.language, value.image, value.title);
                        context.setLocale(Locale(value.language));
                        setState(() {});
                      },
                    )
                  ]);
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, errorLocale: (message) {
              return Center(
                child: Text(message),
              );
            }, orElse: () {
              return const Text('orElse');
            });
          }),
    );
  }
}
