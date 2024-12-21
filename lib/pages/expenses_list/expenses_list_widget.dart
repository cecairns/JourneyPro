import '/backend/backend.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/expenses/expenses_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'expenses_list_model.dart';
export 'expenses_list_model.dart';

class ExpensesListWidget extends StatefulWidget {
  const ExpensesListWidget({
    super.key,
    required this.trips,
  });

  final DocumentReference? trips;

  @override
  State<ExpensesListWidget> createState() => _ExpensesListWidgetState();
}

class _ExpensesListWidgetState extends State<ExpensesListWidget> {
  late ExpensesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpensesListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ExpensesList'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/test1_copy.png',
              ).image,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.topBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const TopBarWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Expenses',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Container(
                          width: 350.0,
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<List<ExpensesRecord>>(
                            stream: queryExpensesRecord(
                              parent: widget.trips,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ExpensesRecord> listViewExpensesRecordList =
                                  snapshot.data!;
                              if (listViewExpensesRecordList.isEmpty) {
                                return Image.asset(
                                  'assets/images/Nothing_here_yet_(1).png',
                                  width: 350.0,
                                  height: 300.0,
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewExpensesRecordList.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 20.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewExpensesRecord =
                                      listViewExpensesRecordList[listViewIndex];
                                  return ExpensesWidget(
                                    key: Key(
                                        'Key5q3_${listViewIndex}_of_${listViewExpensesRecordList.length}'),
                                    expenses: listViewExpensesRecord,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'EXPENSES_LIST_ADD_NEW_EXPENSE_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'AddExpense',
                              queryParameters: {
                                'trips': serializeParam(
                                  widget.trips,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: 'Add New Expense',
                          options: FFButtonOptions(
                            width: 350.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 20.0))
                          .around(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const BottomBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
