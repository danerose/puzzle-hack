//Flutter
import 'package:flutter/material.dart';
import 'package:puzzle_hack/app/flows/home/view/components/header_component.dart';


//Theme

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 530),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraint){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight,
                ),
                child: Column(
                  children: const [
                    HeaderComponent()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
