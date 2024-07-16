import 'package:flutter/material.dart';
import 'package:tic_tac_toe_2/view/widget/board_button.dart';
import 'package:tic_tac_toe_2/view/widget/timer.dart';
import '../../controllers/tictactoe_controller.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final PlayController playController = PlayController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const GameTimer(),
       
          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
              alignment: Alignment.center,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  print(index);
                  return BoardButton(
                    '${playController.buttonStatus[index]}',
                    onTap: () {
                      setState(() {
                        String? winner = playController.setButton(index);
                        if (winner != null) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                              return AlertDialog(
                                title: Text('Win'),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          playController.reset();
                                          Navigator.pop(dialogContext);
                                        });
                                      },
                                      icon: Icon(Icons.lock_reset))
                                ],
                              );
                            },
                          );
                          print('Winner is: $winner');
                        }
                      });
                      print(index);
                    },
                  );
                },
              )
          ),
          Center(
            child: Text('Tic Tac Toe - 2 Player',
                style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
