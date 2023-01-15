import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetContent extends StatefulWidget {
  final List<dynamic>? genres;
  final parentState;

  final List<String>? selectedGenres;


  const BottomSheetContent({required Key key,  this.genres,  this.selectedGenres, this.parentState}) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            "Geners",
            style: TextStyle(
                color: Colors.orange),
          ),
          SizedBox(
            height: 25,
          ),
          Wrap(
            children:
            widget.genres!.map((genre) {


              return ChoiceChip(
                label: Text(genre),
                selected: widget.selectedGenres!
                    .contains(
                    genre),
                onSelected:
                    (bool selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedGenres!
                          .add(genre);

                      print(
                          widget.selectedGenres);
                    } else {
                      widget.selectedGenres!
                          .remove(
                          genre);

                    }
                    widget.parentState.setState(() {});
                  });
                  setState(() {});
                },
                selectedColor: widget.selectedGenres!.contains(genre)
                    ? Colors.orange
                    : Colors.white,
              );
            }).toList(),
          ),
          Padding(
            padding:
            const EdgeInsets.only(
                top: 50),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment
                  .end,
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style:
                      ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty
                            .all(Colors
                            .black),
                      ),

                      onPressed: () {

                          Navigator.of(
                              context)
                              .pop(
                              widget.selectedGenres);
                          },
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: Colors
                                .orange),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style:
                      ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty
                            .all(Colors
                            .black),
                      ),
                      onPressed: () {
                        Navigator.of(
                            context)
                            .pop();
                        setState(() {

                        });

                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors
                                .orange),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
