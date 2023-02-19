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
## *  홈 화면 
홈 화면에는 앱의 중요한 기능 중 하나인 "테스트 시작하기" 버튼이 있다. 하단바에는 홈, 동아리 리스트, 동아리 찜 기능, 프로필 기능이 있어 자유롭게 이동 가능하다. 
또한, 랜덤으로 변하는 4개의 색깔이 다른 타일을 두어 디자인적 요소를 주었고 4개의 색깔과 숫자가 모두 같으면 폭죽이 터지는 이스터에그를 넣어주었다.<br/><br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219569780-af08db76-fb81-47cf-92f9-50733aeeb3bd.png">
<img width="200" src="https://user-images.githubusercontent.com/103638613/219570214-46c29fdc-eef3-4fcc-9673-0c42569683c2.png">
<br/><br/>
## *  질문 화면
메인화면에서 테스트 시작하기 화면을 누르면 질문 페이지로 이동한다. 테스트는 13개의 질문들로 이루어져 있고, 각 답변에 가중치를 두어 답변에 따라 결과가 달라지도록 하였다. <br/><br/>
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
## *  결과 화면 
13개의 질문 테스트가 끝나면 결과 화면으로 이동한다. 결과 화면에는 자신의 결과에 해당되는 인물의 이름, 사진, 동아리 리스트를 보여준다. 결과 화면에서도 동아리 찜 기능을 활용할 수 있으며, 아래 "결과 저장하기" 버튼을 누르면 결과가 저장되고 프로필 화면으로 이동한다. 저장된 결과는 프로필 화면에서 확인할 수 있다. 오른쪽 상단에 있는 홈 아이콘을 클릭하면 결과 저장 없이 홈 화면으로 이동할 수 있다.
<br/><br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219572945-79d4b8d7-bf01-4da0-a1ce-31f85354fb6f.png">
<br/><br/>
## *  프로필 화면
프로필 화면에서는 자신의 개인프로필과 이전에 저장했던 테스트 결과들을 확인할 수 있다. 개인프로필에는 자신의 이름과 계정을 확인할 수 있다. 또, 최근 테스트 결과는 인물 이름과 저장했던 시간이 표시되어 있는 결과 리스트로 이루어져 있으며, 펼치기 기능을 사용하면 각 결과에 해당하는 동아리 리스트를 확인할 수 있다. 추가적으로, 아래 "학회에 대해 궁금하시다면??" 버튼을 누르면 학부별로 정리되어 있는 학회들을 팝업창을 통해 확인할 수 있다. 
<br/><br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219579532-05019faf-3680-41cf-9453-c7331a23942b.png">
<br/><br/>
## *  리스트 화면
리스트 화면에는 동아리들의 목록을 볼 수 있다. 각 동아리를 상징하는 키워드 두 가지를 확인할 수 있으며 동아리를 누르면 팝업창을 통해서 동아리의 설명과 필수 학기 수, 정모 시간과 같은 정보를 얻을 수 있다. 또한 옆의 하트 아이콘을 통해 관심 있는 동아리를 찜 목록에 추가 및 삭제할 수 있다. 상단에 있는 검색 기능을 통해서는 동아리들의 이름을 검색해 필요한 동아리를 찾을 수 있다.
<br/><br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219577604-bc76b536-8632-440e-8052-670304e9cd2e.png">
<img width="200" src="https://user-images.githubusercontent.com/103119924/219657255-f0d6ecb5-6192-474d-b687-91504f5a6ac2.png">
<br/><br/>
## *  찜 화면
찜 화면에서는 리스트 페이지와 결과 페이지의 하트 아이콘을 통해 추가한 동아리들의 목록을 볼 수 있다. 이 페이지에서 또한 이전에 찜했던 동아리를 삭제할 수 있다.
<br/><br/>
<img width="200" src="https://user-images.githubusercontent.com/103638613/219577749-1a9686b6-c09b-4d0c-8a36-2d571c583c12.png">
<br/><br/>

# 개인별 개발 후기 
- 장가은 :기획부터 개발까지 이번 프로젝트가 두 번째로 하는 앱 프로젝트라 처음보다는 어려움을 겪지는 않았던 것 같다. 그래도 내가 생각했던 기능들을 완벽하게 구현해 내기에는 버거움이 있었고 그러한 기능을 구현하기에는 많은 시간 투자가 필요했던 것 같다. 프론트 부분은 재미있게 팀원들과 했던 것 같은데 백엔드 부분은 역시나 두 번의 프로젝트를 해도 아직까지 부족한 부분이 많다고 느껴졌다. 그래도 이번 프로젝트를 하면서 또 한 번 많은 부분을 배웠기에 다음에 또다시 앱 프로젝트를 할 수 있는 기회가 생긴다면 조금 더 능숙하게 프론트 부분과 백엔드 부분을 다룰 수 있을 거 같은 자신감이 생겼다. 또한, 프로젝트로 진행하면서 역시나 많은 에러들, 생각했던 대로 작동하지 않는 기능들 등 어려움을 겪었지만 팀원들과 함께 고민하고 여러 버전으로 시도해보면서 우리가 생각했던 앱의 방향에 도달할 수 있었던 거 같다. 그렇기 때문에 함께 고생해 준 우리 팀원들에게 정말 감사하다고 말하고 싶다! 
- 이하경 :이번 프로젝트는 나에게 정말 의미있고 소중한 경험이었다. 방학 한달동안 프로젝트를 진행하면서 정말 많은 에러와 생각대로 되지 않는 부분들에 지칠 때도 있었지만, 팀원들과 힘을 합쳐 하나씩 해결해나가며 힘을 낼 수 있었다. 또 하나의 앱을 처음부터 끝까지 직접 만들고 있고, 점점 목표에 가까워진다는 사실이 재미있게 느껴져 한달이 그렇게 길게 느껴지지 않았다. 고생하며 만들다 보니 이 앱에 정도 많이 들었는지 주변 사람들에게 자랑하는 내 모습도 볼 수 있었다. 이번 경험을 통해 실력도 많이 성장하게 된 것 같아 앞으로도 많은 실전 경험들을 쌓기 위해 적극적으로 노력해야겠다고 생각했다. 정말 고생많았고 초이스팀 최고 !!!
- 박규은 :평소 일상생활에서 쉽게 접할 수 있는 앱을 한번 직접 기획부터 개발까지의 모든 과정을 경험해 보고 싶었다. 최근 인기가 많았던 MBTI의 질문 형식에 아이디어를 얻어 동아리를 사용자에게 추천해 주는 방식이 흥미로웠고 학교의 많은 수의 동아리로 정보를 얻기 어려웠는데 그 부분을 해결해 줄 수 있는 앱이라 필요성을 느끼고 더 즐겁게 참여할 수 있었다. Flutter와 Firebase를 처음 사용해 보기에 초반에는 어려움이 있었지만 팀원들과 함께 필요한 정보를 찾고 문제점을 해결해 나가는 과정을 통해 보다 더 많은 것을 배울 수 있었다. 평소 자신이 앱 분야에 관심이 있다면 프로젝트를 통해 좋은 경험을 쌓을 수 있을 거 같다!!
- 김용현 : 

