 

validInput(String val , int max , int min , String  type ) {
  if (val.trim().length > max   ) {
    return "لا يمكن ان ${type} اكبر من ${max} احرف" ; 
  }
    if (val.trim().length <  min   ) {
    return "لا يمكن ان ${type} اصغر من ${min} احرف" ; 
  }if (val.trim().isEmpty) {
    return "لا يمكن ان ${type} فارغ"  ; 
  }

}