extension boolExtension on bool{
  int boolIntoInt(){
    if(this){
      return 1;
    }else
      return 0;
  }
}

extension intExtension on int{
  bool intIntoBool(){
    if(this == 1){
      return true;
    }else
      return false;
  }
}

extension stringExtension on String{
  String removeTextHtml(){
    return this.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }
}

extension Parse on Map {
  int intValue(String key) {
    final vl = this[key];
    if (vl != null && vl is int) {
      return vl;
    }
    return 0;
  }

  String stringValue(String key){
    final vl = this[key];
    if(vl != null && vl is String){
      return vl;
    }
    return '';
  }

  bool boolValue(String key){
    final vl = this[key];
    if(vl != null && vl is bool){
      return vl;
    }

    return false;
  }
}
