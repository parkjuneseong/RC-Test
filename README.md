# RC-Test
3/4 
홈VC ,SearchVC 만들기
홈VC는 무제한으로 스크롤 되며 업데이트되어서 먼저 8개의 tableViewCell로 만들고
headerView와 footerView 연결 
SearchVC는 ScrollView,StackView를 이용해 만들고 마찬가지로 tableView와 로 만듬
(사진은 아직 대체용)
3/5 
TalkVC,TabbarController,홈VC collectionView 자동 스크롤 만들기
collectionView의 자동스크롤은 banner를 배열로 두고 그안에 원하는이미지를 넣어 Timer를 설정 (현재3초) 처음에는 구현이 잘안되서 고민하다가 하루를 날림 
처음이미지에서 isPagingEnabled = false로 해주고 넘어갈때 true로 바뀌었다가 2번째 이미지가 나오게 변경하니 잘 구현됨
TalkVC는 tableView와 headerView로구현
TabbarController는 5개의 뷰중 검색과 등록은 화면이동부분에서 밑에 TabbarController가 사라지기 떄문에 검색뷰는 push로 등록은 present fullscreen으로 구현하고 5개의 StackView를 원하는 뷰를 클릭했을때 
클릭되었을때, 클릭안되어있을때의 이미지가다르기때문에 이미지 변경사항 구현
3/6 
SplashVC와 로그인 회원가입 VC만들기
로그인 vc는 만들었지만 회원가입 vc는 아직이다
splashVC는 잘 구현되었고 
image 리소스를 받아 넣어주었다 
My VC 와 RegistVC를 만들었고 Cell들을 세부적으로 수정하였다
 3/7 
 MyVC 를 마무리 하고 
 RegistVC 만들고 있다 .. 
 UIView에서는 UINavigationController가 없어서 UIViewController로 protocol delegate를 사용하여 데이터 전달 후 ViewController에서 Navigation활용
 label 의 attrubute 사용 하여 밑줄 밑 부분 색깔 변경 
 3/8 
 registVC의 textField와 태그 , 카테고리 vc 으로 넘어가게 만들어줬고
 SocialVC에서 다른 방식으로 로그인과 본인 인증으로 로그인을vc를 만들어 클릭하게되면 회원가입 vc가나오고
 회원가입VC이 처음에 나왔을때 처음나온 공란이 작성되면 숨어있던 다른 작성창이 나오도록 만들어줬다
작성이 마무리 되면 확인 버튼으로 다시 rootView로 돌아가게 만들었다
3/9
 전체메뉴와 찜메뉴 를 만들었고 stackView들을 클릭할시에 색이 바뀌는것과 밑줄이 생기는걸 구현했다
 뷰들을 서로 연결시키고 navigationController 가 없는 뷰에 만들어주고 
 cell들의 frame 와 UI를 조정했다
 
3/10
 상품을눌렀을때의 뷰를 만들고 좋아요 버튼 을 만들었다 아직 UserDefualt는 만들지않고 
 fill heart와 빈 heart 뷰를 만들었다 
3/11
Alamofire 로 서버 통신하였다 JSONEncoding 으로 받아와야되는걸 UrlEncoding으로 하루종일 통신하고있었다 ..
번개장터앱에는 회원가입이 따로 없는것 같아 임의로 만들어서 api연결 해줄거고 
imagePicker로 RegistVC에서 사진을 collectionView처럼 나오게 해줬다.
특정 control클릭시 셀의 index가 변경되게 바꿔 주었으며 nil값일땐 dummyCell이 나오게 바꿧다

 3/12 
api 통신연결했고 
사용가능한 api 모델리스트들 전부 만들고
Alamofire로 사용가능한 함수도 전부 만들어줬다
UserDefaults 로 userId와 jwt 저장해서 로그인 , 회원가입 만들었고 userId와 jwt가 존재하면 자동로그인 되게 만들었다
mypage에 지금 까지명세서에 나온 내용 호출완료 하였다,

3/13 
홈화면의 상품정보 api연결에 성공했지만 아직 
서버의 배열의 nil값이다 이미지를 post하기 위에 firebase 설치 했다

3/14 
regist api를 마무리 못지었고 ,, 통신은 되었다 
firebase를 처음 사용해보았고 내 storage에 이미지를 저장하는데 성공했다
regist 의 옵션선택으로 상품 가격 위치 수량 교환가능여부등등 만들어줬고 등록을 했을때 
등록뷰에서 적었던 데이터들을 가져오게 만들었다.

3/15 
팀 회의 ,소셜로그인 구현하지않는다고전달받았다. 서버에서 중단하기로 결정
결제하기 UI와 my상세페이지 구현
 
3/16 
예비군소집 다녀와서 등록 api와 상품상세페이지 api를 하고 
내일이 제출일이라 ui를 조금 손보고 더미데이터를넣어주었다
