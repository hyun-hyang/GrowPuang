import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growpuang/controller/personal_contoller.dart';
import 'package:growpuang/controller/post_list_controller.dart';
import 'package:growpuang/model/loading_dialog.dart';
import 'package:growpuang/view/community_screen.dart';
import 'package:growpuang/view/knowledge/KnowledgeMainPage.dart';

class MainPage extends StatelessWidget {

  final postListController = Get.put(PostListController());
  final personalController = Get.put(PersonalController());
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // 반응형 배경 이미지 설정
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/기본-배경.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // 영신관 이미지 (상단 중앙에 배치)
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                // 영신관 이미지를 누를 때 수행할 작업을 정의하세요.
                print('영신관 이미지를 눌렀습니다.');
                // 여기에서 다음 질문 또는 동작을 정의할 수 있습니다.
              },
              child: Container(
                width: 550.w,
                height: 200.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/영신관.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // 자산 이미지 크기 및 배치 수정
          Positioned(
            left: 0.w,
            right: 0.w,
            top: 250.h, // 원하는 위치로 조정
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      personalController.option1 +
                          ' ' +
                          personalController.option2,
                      style: TextStyle(
                        color: Color(0xFF143264),
                        fontSize: 40.sp,
                        fontFamily: 'YourFontFamily',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h), // 원하는 여백 크기로 조정
                  Container(
                    width: 230.w, // 이미지 너비 조정
                    height: 280.h, // 이미지 높이 조정
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/${personalController.pick_img}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    '',
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 40.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          // 게이지 바 (기본-푸앙이 밑에 배치)
          Positioned(
            left: 20.w,
            right: 20.w,
            top: 650.h, // 기본-푸앙이 밑에 원하는 위치로 조정
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w), // 좌우 여백을 조정
              child: Row(
                children: [
                  Text(
                    selectedLanguage == '한국어' ? '체력' : 'HP',
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 40.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 30.w), // 원하는 여백 크기로 조정
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30.0), // 원하는 라운드값으로 조절
                      child: LinearProgressIndicator(
                        minHeight: 30.0,
                        value: personalController
                            .progressValue, // 게이지 바의 값 (0.0에서 1.0 사이)
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue), // 게이지 바 색상
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w), // 원하는 여백 크기로 조정
                  Text(
                    '1/10', // 원하는 비율로 변경
                    style: TextStyle(
                      color: Color(0xFF143264),
                      fontSize: 40.sp,
                      fontFamily: 'YourFontFamily',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 이미지 버튼 1
                InkWell(
                  onTap: () {
                    // 이미지 버튼 1을 탭했을 때 수행할 작업을 정의
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnowledgeMainPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/지식지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 2 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 2를 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/활동지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 3 (기존 UI 유지)
                InkWell(
                  onTap: () async {
                    //기다리는 동안 로딩창 띄우기
                    loadingDialog(context);

                    //posts가 비어있을때(첫 호출때만 데이터 로딩)
                    print(postListController.postList);
                    if (postListController.postList.length == 0) {
                      await postListController.readPostData();
                    }

                    //화면 이동 전, 로딩 다이어로그 pop!
                    Navigator.of(context, rootNavigator: true).pop();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityScreen(),
                      ),
                    );

                    print('커뮤니티 페이지로 넘어 갑니다');
                  },
                  child: Container(
                    width: 130.w,
                    height: 130.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/사교지수.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // 이미지 버튼 4 (기존 UI 유지)
                InkWell(
                  onTap: () {
                    // 이미지 버튼 4를 탭했을 때 수행할 작업을 정의
                  },
                  child: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/도움말.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
