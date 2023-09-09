import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_string.dart';

class MyTranslation implements Translations{
  @override
  Map<String, Map<String, String>> get keys {
   return {
     AppString.kEn:
   {
     AppString.kChooseLang:AppStringEn.kChooseLanguage,
     AppString.kHomeAppBar:AppStringEn.kMoneyApp,
     AppString.kHomeTookMoney:AppStringEn.kTookMoney,
     AppString.kTax:AppStringEn.kTax,
     AppString.kPay:AppStringEn.kPay,
     AppString.kDealing:AppStringEn.kLastDealings,
     AppString.kEntry:AppStringEn.kEntryButton,
     AppString.kEntryTookScreen:AppStringEn.kEntryTookMoney,
     AppString.kAskingTookMoney:AppStringEn.kAskingTookMoney,
     AppString.kNameTookMoney:AppStringEn.kNameCustomer,
     AppString.kAskingPay:AppStringEn.kPayMoney,
     AppString.kDetailsPay:AppStringEn.kDetailsMoneyPay,
     AppString.kEntryTax:AppStringEn.kTaxEntry,
     AppString.kError:AppStringEn.kErrorTextFiled,
     AppString.kAskingTax:AppStringEn.kTransferMoney,
     AppString.kDate:AppStringEn.kDateMoney,
     AppString.kDetails:AppStringEn.kDetailsMoney,
     AppString.kEgypt:AppStringEn.kEgypt,
     AppString.kEnglish:AppStringEn.kEnglish,
     AppString.kErrorHome:AppStringEn.kErrorHome,
     AppString.kDelete:AppStringEn.kDelete,
     AppString.kAlarm:AppStringEn.kAlarm,
     AppString.kConfirm:AppStringEn.kConfirm,
     AppString.kCancel:AppStringEn.kCancel,
     AppString.kDeleteData:AppStringEn.kDeleteData,
     AppString.kLanguage:AppStringEn.kLanguage,
   },
     AppString.kAr:
     {
       AppString.kChooseLang:AppStringAr.kChooseLanguage,
       AppString.kHomeAppBar:AppStringAr.kMoneyApp,
       AppString.kHomeTookMoney:AppStringAr.kTookMoney,
       AppString.kTax:AppStringAr.kTax,
       AppString.kPay:AppStringAr.kPay,
       AppString.kDealing:AppStringAr.kLastDealings,
       AppString.kEntry:AppStringAr.kEntryButton,
       AppString.kEntryTookScreen:AppStringAr.kEntryTookMoney,
       AppString.kAskingTookMoney:AppStringAr.kAskingTookMoney,
       AppString.kNameTookMoney:AppStringAr.kNameCustomer,
       AppString.kAskingPay:AppStringAr.kPayMoney,
       AppString.kDetailsPay:AppStringAr.kDetailsMoneyPay,
       AppString.kEntryTax:AppStringAr.kTaxEntry,
       AppString.kError:AppStringAr.kErrorTextFiled,
       AppString.kAskingTax:AppStringAr.kTransferMoney,
       AppString.kDate:AppStringAr.kDateMoney,
       AppString.kDetails:AppStringAr.kDetailsMoney,
       AppString.kEgypt:AppStringAr.kEgypt,
       AppString.kEnglish:AppStringAr.kEnglish,
       AppString.kErrorHome:AppStringAr.kErrorHome,
       AppString.kDelete:AppStringAr.kDelete,
       AppString.kAlarm:AppStringAr.kAlarm,
       AppString.kConfirm:AppStringAr.kConfirm,
       AppString.kCancel:AppStringAr.kCancel,
       AppString.kDeleteData:AppStringAr.kDeleteData,
       AppString.kSetting:AppStringAr.kSetting,
       AppString.kLanguage:AppStringAr.kLanguage,
     }
   };
  }


}
