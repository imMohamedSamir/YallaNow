import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';

part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit(this.googleMapsServices) : super(TranslateInitial());
  final GoogleMapsServices googleMapsServices;
  void tanslate({required String text}) async {
    if (AppLang.isArabic()) {
      emit(TranslateLoading());
      var restult = await googleMapsServices.translate(text: text);
      restult.fold((fail) {
        TranslateFailure(errMsg: fail.errMessage);
      }, (translatedText) {
        String text = translatedText.data!.translations!.first.translatedText!;
        emit(TranslateSuccess(translatedText: text));
      });
    }
  }
}
