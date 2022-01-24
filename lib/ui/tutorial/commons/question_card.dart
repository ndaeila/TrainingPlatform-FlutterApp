import 'package:californiaefficiencygroup/ui/tutorial/commons/question.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard(this.question, {Key? key}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber[Random().nextInt(5) * 100],
      child: Column(
        children: [
          // Question
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 30),
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),

          // Options
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                // height: 20,
                child: MaterialButton(
                  child: Text(question.choices[index].toString()),
                  onPressed: () {
                    //
                  },
                ),
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey[700],
                  height: 0.2,
                ),
              ),
              itemCount: question.choices.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
