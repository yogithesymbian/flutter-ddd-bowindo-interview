import 'package:flutter_wonderwoman_projectscoid/application/employee_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/employee_model.dart';
import 'package:flutter_wonderwoman_projectscoid/gen/assets.gen.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/app_bar.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/widget_support.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/colors.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/config/app_constants.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../widgets/button/icon_button_cpn.dart';
import '../../widgets/text_field/textfield.dart';

final greetingProvider = Provider<String>((ref) {
  return 'Yogithesymbian';
});

class EmployeeScreen extends ConsumerStatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends ConsumerState<EmployeeScreen>
    with SingleTickerProviderStateMixin {
  void _onChanged(dynamic val) => debugPrint(val.toString());
  List<EmployeeDetailModel?>? _employeeModel;
  final TextEditingController _oneCtl = TextEditingController();

  final FocusNode _oneFn = FocusNode();

  // pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  int totalPage = 0;
  int currentPage = 0;
  bool? isLoaded;
  // end_of pull_to_refresh
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _oneCtl.dispose();
    _oneFn.dispose();
    super.dispose();
  }

  loadData({bool isRefresh = false}) async {
    if (isRefresh) {
      _refreshController.resetNoData();
    } else {
      currentPage += 1;
      if (currentPage >= totalPage) {
        await ref.read(employeeBlocProvider.notifier).setEmployeetPagination(
              currentPage: 0,
            );
        _onChanged('no data return');
        return;
      }
      _onChanged('continue refresh');
      await ref.read(employeeBlocProvider.notifier).setEmployeetPagination(
            currentPage: currentPage, // default
          );
    }
    await ref
        .read(employeeBlocProvider.notifier)
        .getEmployee(isRefresh, page: currentPage, size: 2);
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final String greeting = ref.watch(greetingProvider);
    final employeeWatch = ref.watch(employeeBlocProvider);

    _employeeModel = employeeWatch.employeeModel;
    // totalPage = employeeWatch.employeePagination?.totalPages ?? 0;
    // currentPage = employeeWatch.employeePagination?.currentPage ?? 0;
    isLoaded = employeeWatch.isLoaded ?? true;
    _onChanged('total page: $totalPage, current page: $currentPage');

    return Scaffold(
      appBar: AppBarCpn(
        left: null,
        center: Text(
          greeting,
          style: h3(
            fontWeight: '700',
            color: black,
          ),
        ),
        right: IconButtonCpn(
          function: () {
            showCupertinoModalBottomSheet(
              context: context,
              elevation: 12.0,
              expand: true,
              builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingHorizontal,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Add Employee',
                        style: h2(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      AppWidget.divider(),
                      const SizedBox(
                        height: 12.0,
                      ),
                      TextFieldCpn(
                        controller: _oneCtl,
                        focusNode: _oneFn,
                        labelText: "Employee Name",
                        hintText: 'Junior Yogithesymbian',
                        customIsNext: true,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          bgColor: blueCrayola,
          path: Assets.images.icPlus.path,
          iconColor: grey100,
          hasOutline: false,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingHorizontal),
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            SizedBox(
              height: height * 0.7,
              child: SmartRefresher(
                controller: _refreshController,
                enablePullUp: true,
                header: const WaterDropHeader(),
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = const CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("Load Failed! Tap retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = const Text("release to load more");
                    } else {
                      body = Text(
                        "« No more data »",
                        style: h5(
                          context: context,
                          fontWeight: '400',
                        ),
                      );
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                onRefresh: () async {
                  await loadData(isRefresh: true);
                  _onChanged('onRefresh : $isLoaded');
                  if (isLoaded == true) {
                    _refreshController.refreshCompleted();
                  } else {
                    _refreshController.refreshFailed();
                  }
                },
                onLoading: () async {
                  await loadData();
                  _onChanged('onLoading : $isLoaded');
                  if (currentPage >= totalPage) {
                    _refreshController.loadNoData();
                    _onChanged('no data');
                  } else {
                    if (isLoaded == true) {
                      _refreshController.loadComplete();
                    } else {
                      _refreshController.loadFailed();
                    }
                  }
                },
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(32),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: const [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          children: <Widget>[
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: SizedBox(
                                width: 64,
                                child: Text('ID'),
                              ),
                            ),
                            SizedBox(
                              width: 32,
                              child: Text('NAME'),
                            ),
                            Center(
                              child: SizedBox(
                                width: 64,
                                child: Text('EMAIL'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = _employeeModel?[index];
                        return Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(32),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              children: <Widget>[
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: SizedBox(
                                    width: 64,
                                    child:
                                        Text(data?.employeeId.toString() ?? ""),
                                  ),
                                ),
                                SizedBox(
                                  width: 32,
                                  child:
                                      Text(data?.employeeName.toString() ?? ""),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 64,
                                    child: Text(
                                        data?.employeeMail.toString() ?? ""),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      itemCount: _employeeModel?.length ?? 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
