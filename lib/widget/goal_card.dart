import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalCard extends StatefulWidget {
  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  final checkBoxList = [
    CheckBoxModal(title: "Lose Weight"),
    CheckBoxModal(title: "Gain Muscules"),
    CheckBoxModal(title: "Eat Healther"),
    CheckBoxModal(title: "Live Better"),
    CheckBoxModal(title: "Be Successfull"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Color(0xffC7EBF9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              ...checkBoxList
                  .map(
                    (item) => ListTile(
                      leading: Checkbox(
                        shape: CircleBorder(),
                        value: item.value,
                        onChanged: (value) => onItemClicked(item),
                      ),
                      title: Text(
                        item.title,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      onTap: () => onItemClicked(item),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  onItemClicked(CheckBoxModal ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value;
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({
    this.value = false,
    required this.title,
  });
}
