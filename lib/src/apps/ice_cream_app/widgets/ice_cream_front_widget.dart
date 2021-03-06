import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/models/ice_cream.dart';

class IceCreamFrontWidget extends StatefulWidget {
  final IceCream iceCream;
  final int iceBallCount;

  const IceCreamFrontWidget(
      {Key key, @required this.iceCream, this.iceBallCount})
      : super(key: key);

  @override
  _IceCreamFrontWidgetState createState() => _IceCreamFrontWidgetState();
}

class _IceCreamFrontWidgetState extends State<IceCreamFrontWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.lerp(Colors.white, Colors.brown, 0.9),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: Image.asset(
          widget.iceCream.image,
          fit: BoxFit.cover,
        ),
        title: Stack(
          children: <Widget>[
            buildIceCream(context),
            Positioned(
              child: buildIceCreamInfo(),
              top: 16,
              right: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIceCream(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.iceCream.name,
            style: Theme.of(context).primaryTextTheme.title,
          ),
          SizedBox(height: 8.0),
          OutlineButton(
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            onPressed: () {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text(
                        '${widget.iceBallCount}x ${widget.iceCream.name} added to cart')));
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.shopping_cart),
                SizedBox(width: 16.0),
                Text('Add to cart')
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          )
        ],
      );

  Widget buildIceCreamInfo() => Column(
        children: <Widget>[
          Text(
            '${widget.iceBallCount} balls',
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 4.0),
          Text(
            '\$${getIceCreamPrice()}',
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      );

  String getIceCreamPrice() => (0.6 * widget.iceBallCount).toStringAsFixed(2);
}
