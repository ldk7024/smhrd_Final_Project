# smhrd_Final_Project
## 농인과 청인 간 원활한 의사소통을 위한 수어영상 음성번역 서비스
![캡처DADAD](https://user-images.githubusercontent.com/65816974/131450162-bff942ff-dcd6-4997-87ce-7565b86ae0ab.PNG)

- 2021.08.02 ~ 2021.08.23
- 맡은 파트 및 역할: 프론트엔드 개발, 웹 사이트 기능구현 

### 01. 프로젝트 소개
 - 청각 및 언어 장애인들의 원활한 의사소통을 돕기 위한 목적으로 실시간 수어 영상을 감지하여 이를 텍스트로 번역 후 음성으로 변환해주는 서비스

### 02. 프로젝트 특장점
 
- 웹캠 또는 카메라로 수어 영상을 촬영하면 해당 발화 내용이 음성으로 출력
- 텍스트 입력 시 수화 동작을 알려주는 수화 교육 정보 제공
- 공공기관, 장애복지시설, 의료시설, 특수학교 등 의사소통에 어려움을 겪는 종사자들에게 새로운 커뮤니케이션
  도구를 제공

### 03. 프로젝트 개발 내용

#### 데이터 수집
- AI HUB에서 음성/자연어 수어 영상 데이터를 신청하여 약 10TB 정도의 데이터 확보 
- ※ https://aihub.or.kr/aidata/7965

#### 데이터 전처리
-  수집한 영상 데이터의 동작이 멈춰있는 부분만 잘라내어 편집 
-  각 영상별 초당 30fps으로 잘라내어 이미지 저장
-  각 영상에 맞는 단어 라벨링
-  웹캠을 통해 실제 수어 영상 촬영 뒤 가공

#### DB 구축
-  회원정보, 단어 사전, 게시판 및 댓글 기능 활용 가능
-  회원정보-게시판과 게시판-댓글 테이블을 관계로 두어 최종 ERD가 생성됨
- 
#### 웹 페이지 및 기능구현
-  HTML/CSS 활용하여 웹 생성(template)
-  javascript를 활용하여 웸캠 녹화 및 저장기능 구현
-  Spring을 활용하여 검색을 통한 수어 영상 출력
-  텍스트를 음성 API(TTS)를 활용하여 음성으로 출력

#### 딥러닝
- OpenCV 및 MediaPipe를 활용하여 수어 영상의 동작들을 인식시킨 후 이를 학습
- 전처리한 데이터에서 수어 몸동작 33개, 왼손, 오른손 각 21개씩 키포인트 추출
- 각 프레임별 키포인트를 문제 데이터로 설정, 라벨링 한 데이터를 정답 데이터로 설정
- LSTM 모델을 이용하여 총 126개의 키포인트를 50번의 timesteps 적용 후 학습 (input_shape = (50,126))
- 모델 평가 및 실제 영상과의 정확도 측정
- train_test_split = 0.25, validation = 0.2, optimizer = ‘Adam’, loss= ‘categorical_crossentropy’ 사용


#### Flask
-  Python과 웹 통신
-  사용자가 찍은 수어 영상을 가상 서버에 저장하고 해당 URL 주소를 Python으로 전송
-  Python에서 딥러닝 모델을 실행시킨 후 결과값을 웹으로 전달


### 04. 프로젝트 수행을 위한 주요 기술

- LSTM
- MediaPipe
- Flask
- My SQL
- Java(Spring, Javascript, Html, CSS)
- 음성 API (TTS)

### 05. 프로젝트 수행 결과물


![ㄴㄴㄴㄴ](https://user-images.githubusercontent.com/65816974/131450776-e26572f8-d2ad-4c9e-a64a-3cce90baa71a.PNG)


### 06. 프로젝트 기대효과 및 활용분야

- 청각 및 언어 장애인들의 원활한 의사소통
- 장애에 대한 인식 개선 효과
- 장애인들의 사회 참여 및 경제활동 유도
- 일반인들의 수어에 대한 관심도 증가
- 국민의 권리에 대한 보장

### 07. 포트폴리오
![fafdajdf;lkshd](https://user-images.githubusercontent.com/65816974/132091128-4089218b-5373-4b56-abe6-83681fb3ed8e.PNG)
![aadadadad](https://user-images.githubusercontent.com/65816974/132091141-ed454939-88d9-4649-8705-fa05beb52fc3.PNG)
