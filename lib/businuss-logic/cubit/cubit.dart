import 'package:bloc/bloc.dart';
import 'package:vezeeta_clone/businuss-logic/cubit/cubit_state.dart';
import 'package:vezeeta_clone/utils/internet_checker.dart';

class CubitFunction extends Cubit<CubitState>{

  
  networkHandeler(){


    emit(InternetConnectivityCheck(isConnected:  internetChecker()));
  }

    

  CubitFunction():super(CubitInitial());

}