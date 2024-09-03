# Chat Application - Flutter

## 프로젝트 소개 👨‍💻
이 프로젝트는 **Flutter**와 **Firebase**를 기반으로 한 실시간 채팅 애플리케이션입니다. 사용자들은 이메일을 통해 회원가입을 하고, 로그인하여 실시간 채팅 기능을 이용할 수 있습니다. **Firebase Authentication**을 사용하여 안전한 로그인 시스템을 제공하며, **Firestore**를 이용해 데이터를 관리하고, **Firebase Storage**를 통해 사용자 프로필 이미지를 저장합니다.

## 주요 기능 ✨
- **사용자 인증**: Firebase Authentication을 사용하여 이메일 및 비밀번호를 통한 회원가입 및 로그인 기능 제공.
- **실시간 채팅**: 인증된 사용자 간 실시간으로 채팅이 가능.
- **프로필 이미지 업로드**: 회원가입 시 사용자가 자신의 프로필 이미지를 업로드할 수 있으며, 해당 이미지는 Firebase Storage에 저장됨.
- **애니메이션 효과**: 로그인 및 회원가입 화면 간의 전환 시 애니메이션 효과 적용.
- **폼 유효성 검사**: 입력된 이메일, 비밀번호, 사용자 이름에 대한 유효성 검사를 통해 정확한 입력 유도.
- **Google 로그인 기능 (예정)**: Google OAuth를 통해 간편 로그인 기능 제공 예정.

## 주요 파일 구조 🗂️
```plaintext
lib/
│
├── main.dart                    # 애플리케이션의 진입점
├── screens/
│   ├── login_screen.dart         # 로그인 및 회원가입 화면 UI 및 로직 처리
│   ├── chat_screen.dart          # 채팅 화면 UI 및 로직 처리
├── widgets/
│   ├── add_image.dart            # 프로필 이미지 선택을 위한 위젯
├── models/
│   └── palette.dart              # 애플리케이션에서 사용하는 색상 팔레트 정의

사용된 패키지 📦
이 프로젝트에서 사용된 주요 패키지는 다음과 같습니다:

firebase_auth: Firebase 인증 기능을 제공.
cloud_firestore: Firebase Firestore 데이터베이스를 사용해 실시간 데이터 저장 및 관리.
firebase_storage: Firebase Storage를 사용해 사용자 이미지 파일을 저장.
modal_progress_hud: 비동기 작업이 진행되는 동안 로딩 스피너 표시.
image_picker: 사용자가 갤러리에서 이미지를 선택하거나 사진을 찍을 수 있는 기능 제공.
pubspec.yaml 파일에서 다음과 같이 종속성을 추가할 수 있습니다:

yaml
코드 복사
dependencies:
  flutter:
    sdk: flutter
  firebase_auth: ^3.3.5
  cloud_firestore: ^3.1.5
  firebase_storage: ^10.0.3
  modal_progress_hud: ^0.1.3
  image_picker: ^0.8.4+4
