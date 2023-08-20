import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightCard extends StatefulWidget {
  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  var weightTolbs;
  var _1lbs = 2.20462;
  final _textController = TextEditingController();
  final _textFocusNode = FocusNode();

  @override
  void initState() {
    _textFocusNode.addListener(_convertWeight);
    super.initState();
  }

  void _convertWeight() {
    if (!_textFocusNode.hasFocus && _textController.text.isNotEmpty) {
      var a = int.parse(_textController.text) * _1lbs;
      weightTolbs = a.toInt();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _textFocusNode.removeListener(_convertWeight);
    _textFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Color(0xffC7EBF9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              child: Text(_textController.text.isEmpty ? "" :
                _textController.text + " Kg" + "($weightTolbs Lb)",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: TextField(
                controller: _textController,
                focusNode: _textFocusNode,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: "Weight",
                  labelStyle: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
