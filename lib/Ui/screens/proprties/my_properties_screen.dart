import 'package:ebroker/Ui/screens/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_theme.dart';
import '../../../data/cubits/property/fetch_my_properties_cubit.dart';
import '../../../data/cubits/system/app_theme_cubit.dart';
import '../../../utils/Extensions/extensions.dart';
import '../../../utils/ui_utils.dart';
import 'Property%20tab/sell_rent_screen.dart';

int propertyScreenCurrentPage = 0;
ValueNotifier<Map> emptyCheckNotifier =
    ValueNotifier({"isSellEmpty": false, "isRentEmpty": false});

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({Key? key}) : super(key: key);

  State<PropertiesScreen> createState() => MyPropertyState();
}

class MyPropertyState extends State<PropertiesScreen>
    with TickerProviderStateMixin {
  int offset = 0, total = 0;
  int selectTab = 0;
  final PageController _pageController = PageController();
  bool isSellEmpty = false;
  bool isRentEmpty = false;

  @override
  void initState() {
    // if (ref.containsKey('sell')) {
    //   (ref['sell'] as FetchMyPropertiesCubit).stream.listen((event) {
    //     if (event is FetchMyPropertiesSuccess) {
    //       isSellEmpty = event.myProperty.isEmpty;
    //       setState(() {});
    //     }
    //   });
    // }
    // if (ref.containsKey("rent")) {
    //   (ref['rent'] as FetchMyPropertiesCubit).stream.listen((event) {
    //     if (event is FetchMyPropertiesSuccess) {
    //       isRentEmpty = event.myProperty.isEmpty;
    //       setState(() {});
    //     }
    //   });
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarDividerColor: Colors.transparent,
          // systemNavigationBarColor: Theme.of(context).colorScheme.secondaryColor,
          systemNavigationBarIconBrightness:
              context.watch<AppThemeCubit>().state.appTheme == AppTheme.dark
                  ? Brightness.light
                  : Brightness.dark,
          //
          statusBarColor: Theme.of(context).colorScheme.secondaryColor,
          statusBarBrightness:
              context.watch<AppThemeCubit>().state.appTheme == AppTheme.dark
                  ? Brightness.dark
                  : Brightness.light,
          statusBarIconBrightness:
              context.watch<AppThemeCubit>().state.appTheme == AppTheme.dark
                  ? Brightness.light
                  : Brightness.dark),
      child: Scaffold(
        backgroundColor: context.color.primaryColor,
        appBar: UiUtils.buildAppBar(
          context,
          title: "My Orders".translate(context),
          // bottomHeight: 49,
          bottomHeight: 10,
        )

        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: false,
        //   backgroundColor: context.color.primaryColor,
        //   title: Text(UiUtils.getTranslatedLabel(context, "myProperty"))
        //       .color(context.color.textColorDark),
        //   bottom: PreferredSize(
        //       preferredSize: const Size.fromHeight(40),
        //       child: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
        //         child: Row(
        //           children: [
        //             customTab(
        //               context,
        //               isSelected: (selectTab == 0),
        //               onTap: () {
        //                 selectTab = 0;
        //                 propertyScreenCurrentPage = 0;
        //                 setState(() {});
        //                 _pageController.jumpToPage(0);
        //                 cubitReference = context.read<FetchMyPropertiesCubit>();
        //                 propertyType = "sell";
        //               },
        //               name: UiUtils.getTranslatedLabel(context, "sell"),
        //               onDoubleTap: () {},
        //             ),
        //             const SizedBox(
        //               width: 5,
        //             ),
        //             customTab(
        //               context,
        //               isSelected: selectTab == 1,
        //               onTap: () {
        //                 _pageController.jumpToPage(1);
        //                 selectTab = 1;
        //                 propertyScreenCurrentPage = 1;

        //                 cubitReference = context.read<FetchMyPropertiesCubit>();
        //                 propertyType = "rent";

        //                 setState(() {});
        //               },
        //               onDoubleTap: () {},
        //               name: UiUtils.getTranslatedLabel(context, "rent"),
        //             ),
        //           ],
        //         ),
        //       )),
        // ),

        ,
        body: ScrollConfiguration(
          behavior: RemoveGlow(),
          child: PageView(
            onPageChanged: (value) {
              propertyScreenCurrentPage = value;
              selectTab = value;
              setState(() {});
            },
            controller: _pageController,
            children: [
              BlocProvider(
                create: (context) => FetchMyPropertiesCubit(),
                child: SellRentScreen(
                  type: "sell",
                  key: const Key("0"),
                  controller: sellScreenController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
