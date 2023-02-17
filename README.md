# CHOICE

# 프로젝트 타이틀

### 한동 동아리 추천 앱


# 주제 한줄 소개

질문 결과에 따른 동아리 추천

# 개발스택 설명
<div>
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the badge&logo=Flutter&logoColor=white" width="100" height="40">   
<img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the badge&logo=Firebase&logoColor=white" width="100" height="40">
</div>

  >Cloud Firestore 사용해 데이터를 관리함     
  
# 프로젝트 상세 설명

**'한동 동아리 추천 앱'** 은 사용자(한동대학교 학생들)가 동아리들에는 무엇이 있고 어떤 활동을 하며, 자신에게 맞는 동아리가 무엇인지 찾을 수 있다. 
지정된 질문들을 통해 사용자가 어떤 동아리를 원하는지를 파악하고 선택을 하여 그 결과에 따라 해당하는 동아리 목록들을 도출해줌으로써 보다 정확하게 자신에게 맞는 동아리를 선택할 수 있다.

# 대표화면, 스크린별 설명
*  홈 화면 
홈 화면에는 앱의 중요한 기능 중 하나인 "테스트 시작하기" 버튼이 있다. 하단바에는 홈, 동아리 리스트, 동아리 찜 기능, 프로필 기능이 있어 자유롭게 이동 가능하다. 
또한, 랜덤으로 변하는 4개의 색깔이 다른 타일을 두어 디자인적 요소를 주었고 4개의 색깔과 숫자가 모두 같으면 폭죽이 터지는 이스터에그를 넣어주었다.<br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219569780-af08db76-fb81-47cf-92f9-50733aeeb3bd.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570214-46c29fdc-eef3-4fcc-9673-0c42569683c2.png">
<br/><br/>
*  질문 화면
메인화면에서 테스트 시작하기 화면을 누르면 질문 페이지로 이동한다. 테스트는 13개의 질문들로 이루어져 있고, 각 답변에 가중치를 두어 답변에 따라 결과가 달라지도록 하였다. <br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570295-5c0e3131-8212-4748-b32e-1c25fd32899b.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570765-6dc36a66-0d75-492c-b097-36b63ac594bf.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570773-aa7891c2-c728-4dd8-8518-47e44d99e4e7.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570782-c61ba491-95dc-4207-bdac-a611257d3766.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570941-b5741ac2-2a4d-4ba1-92d3-379c4f396f8a.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570957-ff2a66fe-f132-43c2-a10f-d6d5c3f9b2e5.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219574100-5e52006d-9566-474a-9beb-7944eaf75b67.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219571141-d45cc24e-d378-4d50-b316-1397f370b4f7.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219571159-d2e0f98f-ab89-4520-8f45-fdf365b29def.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219571163-7df7ce0d-7a70-4efe-9af6-51141a0ee726.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219571167-3b502a93-5704-4bd3-9673-9708a5ee391b.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219573763-4de48827-7b2f-4193-b0fd-2dd11bfdd7e4.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219573775-54573cdd-5245-4799-8324-3a2be6421885.png">
<br/><br/>
*  결과 화면 
13개의 질문 테스트가 끝나면 결과 화면으로 이동한다. 결과 화면에는 자신의 결과에 해당되는 인물의 이름, 사진, 동아리 리스트를 보여준다. 결과 화면에서도 동아리 찜 기능을 활용할 수 있으며, 아래 "결과 저장하기" 버튼을 누르면 결과가 저장되고 프로필 화면으로 이동한다. 저장된 결과는 프로필 화면에서 확인할 수 있다. 오른쪽 상단에 있는 홈 아이콘을 클릭하면 결과 저장 없이 홈 화면으로 이동할 수 있다.
<br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219572945-79d4b8d7-bf01-4da0-a1ce-31f85354fb6f.png">
<br/><br/>
*  프로필 화면
프로필 화면에서는 자신의 개인프로필과 이전에 저장했던 테스트 결과들을 확인할 수 있다. 개인프로필에는 자신의 이름과 계정을 확인할 수 있다. 또, 최근 테스트 결과는 인물 이름과 저장했던 시간이 표시되어 있는 결과 리스트로 이루어져 있으며, 펼치기 기능을 사용하면 각 결과에 해당하는 동아리 리스트를 확인할 수 있다. 추가적으로, 아래 "학회에 대해 궁금하시다면??" 버튼을 누르면 학부별로 정리되어 있는 학회들을 팝업창을 통해 확인할 수 있다. 
<br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219572945-79d4b8d7-bf01-4da0-a1ce-31f85354fb6f.png">
<br/><br/>
*  리스트 화면

<br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219577604-bc76b536-8632-440e-8052-670304e9cd2e.png">
<br/><br/>
*  찜 화면

<br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219577749-1a9686b6-c09b-4d0c-8a36-2d571c583c12.png">
<br/><br/>

