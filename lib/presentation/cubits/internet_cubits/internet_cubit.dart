
import 'dart:async';

import 'package:blog_explorer/presentation/cubits/internet_cubits/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState>{


  Connectivity _internetConnectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetInitialState()){
    connectivitySubscription = _internetConnectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetConnectedState());
      }
      else{
        emit(InternetNotConnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }

}