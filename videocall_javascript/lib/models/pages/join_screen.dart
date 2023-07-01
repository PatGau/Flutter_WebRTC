import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:videocall_javascript/models/meetings_details.dart';
import 'package:videocall_javascript/models/pages/meeting_pages.dart';

class JoinScreen extends StatefulWidget {
  final String? meetingId;
  final MeetingDetail? meetingDetail;

  const JoinScreen({super.key, this.meetingId, this.meetingDetail});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meeting App"),
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
        key: _formKey,
        child: formUI(),
      ),
    );
  }

  Widget formUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            FormHelper.inputFieldWidget(
              context,
              "UserId",
              "Enter your Name",
              (val) {
                if (val.isEmpty) {
                  return "Name can't be empty";
                }
                return null;
              },
              (onSaved) {
                setState(() {
                  userName = onSaved;
                });
              },
              borderRadius: 10,
              borderFocusColor: Colors.redAccent,
              borderColor: Colors.redAccent,
              hintColor: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: FormHelper.submitButton("Join Meeting", () {
                  if (validateAndSave()) {
                    // Meeting;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) {
                      return MeetingPage(
                        meetingId: widget.meetingDetail!.id,
                        name: userName,
                        meetingDetail: widget.meetingDetail!,
                      );
                    })));
                  }
                })),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
