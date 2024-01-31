import 'package:flutter/cupertino.dart';



// 앱 테마 컬러 설정
class AppTheme{
  // 앱 테마 색깔 설정
  Color themeColor({String color = 'blue'}){
    if(color == 'blue'){
      return const Color(0xFFc0edfd);
    }
    else if(color == 'gray blue') {
      return const Color(0xFFeaf3fd);
    }
    else{
      return const Color(0xFFF5F5F5);
    }
  }
}
