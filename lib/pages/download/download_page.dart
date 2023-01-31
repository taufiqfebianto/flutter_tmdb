import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import 'bloc/download_bloc.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  DownloadBloc? bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<DownloadBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onBack() {
    Navigator.of(context).popUntil(ModalRoute.withName(Routers.home));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadBloc, DownloadState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorStyle.black(),
          appBar: AppBar(
            shadowColor: colorStyle.transparent(),
            leading: IconButton(
              onPressed: _onBack,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: colorStyle.lightBlue(),
              ),
            ),
            title: Text(
              'Download',
              style: styleText.lato(
                  fontWeight: FontWeight.bold,
                  color: colorStyle.lightBlue(),
                  fontSize: 18),
            ),
            actions: [
              IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.edit_rounded,
                  color: colorStyle.lightBlue(),
                ),
              )
            ],
            backgroundColor: colorStyle.darkBlue(),
          ),
          body: Container(
            width: double.infinity,
            
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[colorStyle.darkBlue(), colorStyle.black()],
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.download_for_offline_rounded,
                      size: 150,
                      // color: colorStyle.lightBlue(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Download videos and watch them offline',
                      style: styleText.lato(
                        color: colorStyle.lightBlue(),
                      ),
                    ),
                  ],
                )
                // GridView.builder(
                //     physics: const AlwaysScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     padding: const EdgeInsets.all(0),
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 1,
                //       mainAxisSpacing: 10,
                //       crossAxisSpacing: 10,
                //       // childAspectRatio: 0.8,
                //     ),
                //     itemCount: 10,
                //     itemBuilder: (BuildContext context, int index) {
                //       return ClipRRect(
                //           borderRadius: BorderRadius.circular(5),
                //           child:
                //               // widget.model!.results![index].posterPath != null
                //               //     ?
                //               Image.asset(Constants.backdrop)
                //           // : loadingWidget(),
                //           );
                //     }),
                ),
          ),
        );
      },
    );
  }
}
