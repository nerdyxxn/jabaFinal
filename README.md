# JABA, 내 손 안의 카페
<img width="1200" alt="Jaba_main" src="https://user-images.githubusercontent.com/66936285/107166925-d0c14680-69fa-11eb-9e11-b12688e21592.png"></img>
___
## 목차
1. [개요](#개요)
2. [설계의 주안점](#설계의-주안점)
3. [개발 환경](#개발-환경)
4. [주요 기능](#주요-기능)
5. [Document](#document)
___
## 개요
* 내 손 안의 카페란 컨셉으로, 미리 주문 후 픽업 할 수 있는 서비스 개발
* 최근 코로나로 인한 사회적 거리두기로 비대면 소비문화가 확산되는 추세 반영
* 대면 없이 미리 음료를 주문해 매장에서 곧바로 픽업하는 방식으로 사용자의 편의성 증가
___
## 설계의 주안점
* **Spring MVC Request Lifecycle**을 기반으로 **Spring MVC Project** 설계
* **BootStrap**를 활용하여 보다 직관적이고 사용이 용이한 UI/UX 구현 
* **BootStrap Modal**을 이용해 페이지 이동없이 데이터의 이동과 연결이 가능하도록 구현
* **Chart.js**를 사용하여 실시간으로 변경되는 그래프 구현
* **iamport api**를 이용해 신용카드, 실시간 계좌이체, 가상계좌, 휴대폰 소액결제 등의 **온라인 결제기능** 구현
* **카카오 장소 검색 api**를 이용해 주소 별, 브랜드 별, **현재위치 기반 검색**이 가능하도록 설계
* **Apache Commons FileUpload**를 통한 파일 업로드 기능 구현
* **javax.mail** 라이브러리를 사용해 유저의 비밀번호 찾기 기능 구현
___
## 개발 환경
|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JS, CSS3, JQuery|
|BackEnd|Java(JDK 1.8), Servlet, Spring(4.2.4), Mybatis|
|OS|Windows 10, MacOS|
|Libray&API|OJDBC(v6), JSON(v1.2), JSTL, BootStrap(v3.3.7), Chart.js, iamport API, Apache Commons FileUpload, JavaMail Library, Kakaomap, Websocket|
|IDE|STS(3.9.12.RELEASE), VisualStudio|
|Server|Tomcat(v8.5)|
|Document|Google Drive, ERDCloud, diagrams.net|
|CI|Github|
|DateBase|Oracle DataBase 11g|
___
## 주요 기능
* client page
<img width="1200" alt="client" src="https://user-images.githubusercontent.com/66562887/106883844-e1846a80-6723-11eb-8fee-83c04cf518fb.png">

* partner page
<img width="1200" alt="partner" src="https://user-images.githubusercontent.com/66562887/106884112-3c1dc680-6724-11eb-9a8b-e41307542d47.png">

* admin page
<img width="1200" alt="admin" src="https://user-images.githubusercontent.com/66562887/106884192-4fc92d00-6724-11eb-9d3b-c98c60ebd87c.png">

## Document

1. 기능 정의서
<img width="1200" alt="요구사항 명세서" src="https://user-images.githubusercontent.com/66562887/107018344-aa758e00-67e3-11eb-9934-9035bb1ef5ab.png">
2. UseCase
<img width="1200" alt="usecase_diagram1" src="https://user-images.githubusercontent.com/66562887/107018386-b5c8b980-67e3-11eb-89c8-c319df34e618.png">
<img width="1200" alt="usecase_diagram2" src="https://user-images.githubusercontent.com/66562887/107018398-ba8d6d80-67e3-11eb-8a85-d1abb45bd099.png">

3. UI
<img width="1200" alt="UI설계" src="https://user-images.githubusercontent.com/66562887/107018430-c37e3f00-67e3-11eb-8c84-d622d4945fbc.png">

4. ERD
<img width="1200" alt="erd" src="https://user-images.githubusercontent.com/66562887/107018448-ca0cb680-67e3-11eb-98b0-bb5bb6d25163.png">

5. Table Description
<img width="1200" alt="테이블 정의서" src="https://user-images.githubusercontent.com/66562887/107018576-f4f70a80-67e3-11eb-8016-a753bf10144d.png">

6. Class Diagram
<img width="1200" alt="클래스 다이어그램" src="https://user-images.githubusercontent.com/66562887/107018611-0213f980-67e4-11eb-809e-14adfe96cf3d.png">

7. Sequence Diagram
<img width="1200" alt="시퀀스 다이어그램" src="https://user-images.githubusercontent.com/66562887/107018638-093b0780-67e4-11eb-8a81-36be6fe4dd08.png">
