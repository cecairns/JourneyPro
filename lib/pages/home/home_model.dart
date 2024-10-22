import '/flutter_flow/flutter_flow_util.dart';
import '/pages/trips/trips_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Trips component.
  late TripsModel tripsModel;

  @override
  void initState(BuildContext context) {
    tripsModel = createModel(context, () => TripsModel());
  }

  @override
  void dispose() {
    tripsModel.dispose();
  }
}
