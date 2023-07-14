import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/core/crud/state_status.dart';

class HandlingDataView extends StatelessWidget {
  final StateRequest stateRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.stateRequest, required this.widget,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return stateRequest == StateRequest.loading
        ?  Center(
            child: Lottie.asset('assets/lottie/loading2.json',width: 80, height: 80),)
        : stateRequest == StateRequest.serverException
            ? Center(
                child: Lottie.asset('assets/lottie/internal-server-error.json',width: 250, height: 250,repeat: false))
            : stateRequest == StateRequest.serverFaluire
                ?  Center(
                    child: Lottie.asset('assets/lottie/failure.json',width: 250, height: 250,repeat: false))
                : stateRequest == StateRequest.failure
                    ?  Center(
                        child: Lottie.asset('assets/lottie/errorfailure.json',width: 250, height: 250,repeat: false)) 
                          :stateRequest == StateRequest.internetFaluire 
                            ?  Center(
                            child: Lottie.asset('assets/lottie/no-internet-connection.json'),
                        )
                    : widget;
  }
}

