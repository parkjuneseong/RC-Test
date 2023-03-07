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
 
