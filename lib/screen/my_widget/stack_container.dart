import 'package:flutter/material.dart';

class StackContainer extends StatefulWidget {
  final IconData myIcon;
  final Color myColor;
  final double mySize;
  const StackContainer(
      {Key? key,
        required this.myIcon,
        required this.myColor,
        required this.mySize})
      : super(key: key);

  @override
  State<StackContainer> createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Colors.deepOrange.shade50,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(32, 56, 32, 32),
              child: Text('Wellcome!', style: TextStyle(fontSize: 32,color: Colors.deepOrange)),
            ),
          ),
          Positioned(
            top: -40,
            child: Container(
              child: Icon(
                widget.myIcon,
                color: widget.myColor,
                size: widget.mySize,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.deepOrange.shade50, width: 4),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
