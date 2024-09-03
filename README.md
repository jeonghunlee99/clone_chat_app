# Chat Application - Flutter

## 프로젝트 소개 👨‍💻
이 프로젝트는 **Flutter**와 **Firebase**를 기반으로 한 실시간 채팅 앱. 사용자들은 이메일을 통해 회원가입을 하고, 로그인하여 실시간 채팅 기능을 이용할 수 있음. **Firebase Authentication**을 사용하여 로그인 시스템을 제공하며, **Firestore**를 이용해 데이터를 관리하고, **Firebase Storage**를 통해 사용자 프로필 이미지를 저장.

 ## 목적 🎯
이 프로젝트의 목적은 Firebase Authentication을 사용하여 로그인 및 회원가입 기능을 구현하고, Firestore를 통해 사용자 데이터를 관리하는 기능을 익히고 이를 통해 Firebase의 인증 및 데이터베이스 서비스를 활용하여 실시간 채팅이 가능한 앱을 제작하는것이 목적임

이 클론 코딩 프로젝트는 특히 Firebase와 Firestore를 사용하는 방법을 학습하는 데 중점을 두며, 사용자가 로그인하거나 회원가입 시 해당 데이터를 Firestore에 저장하고 관리하는 전체적인 프로세스를 이해하는 것이 목표입니다.

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
```



## 주요 코드 🔑

<details>
<summary>1. Firebase Authentication (로그인 및 회원가입 기능)</summary>
<div markdown="1">

 ```dart
  Widget _buildSuggestionsOrResults() {
      Set<String> uniqueNames = {};

      final List<Map<String, dynamic>> suggestionList = query.isEmpty
          ? []
          : _foodData.where((food) {
              if (food['name'].toLowerCase().contains(query.toLowerCase())) {
                return uniqueNames.add(food['name']);
              } else {
                return false;
              }
            }).toList();
  }

```

</div>
</details>

<details>
<summary>2. Firestore (사용자 데이터 저장)</summary>
<div markdown="1">

 ```dart
 void _saveUserData() async {
  final newUser = await _authentication.createUserWithEmailAndPassword(
    email: userEmail,
    password: userPassword,
  );

  await FirebaseFirestore.instance
      .collection('users')
      .doc(newUser.user!.uid)
      .set({
    'username': username,
    'email': userEmail,
  });

  print("사용자 데이터 저장 완료");
}

```

</div>
</details>

<details>
<summary>3. Firebase Storage (이미지 저장)</summary>
<div markdown="1">

 ```dart
final refImage = FirebaseStorage.instance
    .ref()
    .child('user_images')
    .child(newUser.user!.uid + '.jpg');

await refImage.putFile(userPickedImage!);
final imageUrl = await refImage.getDownloadURL();

await FirebaseFirestore.instance
    .collection('users')
    .doc(newUser.user!.uid)
    .update({
  'image_url': imageUrl,
});


```

</div>
</details>



## 사용된 패키지 📦
- [ firebase_auth](https://pub.dev/packages/firebase_auth) : Firebase 초기화를 위한 패키지.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) : Firebase Firestore와의 통합을 위한 패키지로, Firestore CRUD 작업을 수행할 수 있음.
- [  firebase_storage](https://pub.dev/packages/firebase_storage) : Firebase Storage를 사용해 사용자 이미지 파일을 저장.
- [ modal_progress_hud](https://pub.dev/packages/modal_progress_hud_nsn/example) : 비동기 작업이 진행되는 동안 로딩 스피너 표시.
- [  image_picker](https://pub.dev/packages/image_picker) : 사용자가 갤러리에서 이미지를 선택하거나 사진을 찍을 수 있는 기능 제공.
