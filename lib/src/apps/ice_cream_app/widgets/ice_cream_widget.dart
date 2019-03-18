import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/models/ice_cream.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/widgets/ice_cream_front_widget.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/widgets/ice_cream_inside_widget.dart';
import 'package:folding_cell/folding_cell.dart';

class IceCreamWidget extends StatefulWidget {
  final IceCream iceCream;

  IceCreamWidget({Key key, @required this.iceCream}) : super(key: key);

  @override
  _IceCreamWidgetState createState() => _IceCreamWidgetState();
}

class _IceCreamWidgetState extends State<IceCreamWidget> {
  int iceBallCount = 1;
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return SimpleFoldingCell(
      animationDuration: Duration(milliseconds: 300),
      key: _foldingCellKey,
      frontWidget: IceCreamFrontWidget(
        iceCream: widget.iceCream,
        iceBallCount: iceBallCount,
      ),
      innerTopWidget: IceCreamInsideWidget(),
      innerBottomWidget:
          Container(color: Color.lerp(Colors.white, Colors.brown, 0.9)),
      cellSize: Size(MediaQuery.of(context).size.width, 125.0),
      padding: EdgeInsets.all(16.0),
    );
  }
}
