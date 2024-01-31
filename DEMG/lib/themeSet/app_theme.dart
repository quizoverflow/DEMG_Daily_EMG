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
  // 페이지 전환
  PageRouteBuilder createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOutQuart;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return ScaleTransition(
          scale: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
