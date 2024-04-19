import 'package:flutter/material.dart';

class NewBranch extends StatefulWidget {
  const NewBranch({super.key});

  @override
  State<NewBranch> createState() => _NewBranchState();
}

class _NewBranchState extends State<NewBranch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Branch Testing"),
      ),
      body: const Center(
        child: Text("all about Branch"),
      ),
    );
  }
}
