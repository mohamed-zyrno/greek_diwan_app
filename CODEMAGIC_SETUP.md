# إعداد النشر على Codemagic - Greek Diwan

هذا الملف يحتوي على تعليمات مفصلة لنشر تطبيق "الديوان اليوناني" على Codemagic وتحويله إلى ملف APK.

## الخطوة 1: التحضير المسبق

### 1.1 تثبيت Flutter محلياً
تأكد من تثبيت Flutter على جهازك:
```bash
flutter --version
```

### 1.2 إنشاء حساب GitHub
- اذهب إلى [github.com](https://github.com)
- أنشئ حساباً جديداً أو سجل الدخول
- أنشئ مستودعاً جديداً باسم `greek_diwan_app`

### 1.3 رفع المشروع إلى GitHub
```bash
cd /path/to/greek_diwan_app
git init
git add .
git commit -m "Initial commit: Greek Diwan Flutter app"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/greek_diwan_app.git
git push -u origin main
```

## الخطوة 2: إعداد Codemagic

### 2.1 التسجيل في Codemagic
1. اذهب إلى [codemagic.io](https://codemagic.io)
2. انقر على "Sign up"
3. اختر "Sign up with GitHub"
4. وافق على الأذونات المطلوبة

### 2.2 ربط المشروع
1. بعد التسجيل، انقر على "New app"
2. اختر "GitHub"
3. ابحث عن `greek_diwan_app`
4. انقر على "Set up build"

### 2.3 إعدادات البناء

#### للبناء على Android (APK):

1. **اختر نظام التشغيل**: Android
2. **اختر نوع البناء**: Release
3. **إعدادات البناء**:
   - **Flutter version**: 3.24.0 (أو أحدث)
   - **Build for**: Android
   - **Build type**: APK Release

4. **الإعدادات المتقدمة**:
   - **Build arguments**: `--release`
   - **Environment variables**: (اترك فارغاً إن لم تكن هناك متغيرات)

### 2.4 التوقيع الرقمي (اختياري لكن مهم)

لتوقيع APK تلقائياً:

1. **إنشاء مفتاح التوقيع محلياً**:
```bash
keytool -genkey -v -keystore ~/greek_diwan.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias greek_diwan
```

2. **تحميل المفتاح إلى Codemagic**:
   - في إعدادات المشروع، اذهب إلى "Signing"
   - اختر "Android"
   - اختر "Upload keystore"
   - اختر ملف `greek_diwan.keystore`
   - أدخل كلمة المرور

3. **تفعيل التوقيع**:
   - فعّل خيار "Sign Android APK"
   - أدخل بيانات المفتاح

## الخطوة 3: بناء التطبيق

### 3.1 بدء البناء
1. في لوحة تحكم Codemagic
2. اختر مشروع `greek_diwan_app`
3. انقر على "Start new build"
4. اختر الفرع `main`
5. انقر على "Build"

### 3.2 مراقبة البناء
- ستظهر شاشة البناء الحية
- انتظر انتهاء البناء (عادة 10-15 دقيقة)
- ستظهر رسالة "Build completed successfully"

## الخطوة 4: تحميل APK

### 4.1 تحميل الملف
1. بعد انتهاء البناء، انقر على "Download APK"
2. سيتم تحميل ملف `app-release.apk`

### 4.2 تثبيت على الهاتف
```bash
adb install app-release.apk
```

أو انقل الملف إلى هاتفك وثبّته يدوياً.

## الخطوة 5: النشر على Google Play (اختياري)

### 5.1 إنشاء حساب Google Play Developer
1. اذهب إلى [play.google.com/console](https://play.google.com/console)
2. أنشئ حساباً جديداً (رسم تسجيل مرة واحدة: $25)
3. أكمل معلومات الحساب

### 5.2 إنشاء تطبيق جديد
1. انقر على "Create app"
2. أدخل اسم التطبيق: "الديوان اليوناني"
3. اختر الفئة: "Books & Reference"
4. ملأ المعلومات المطلوبة

### 5.3 رفع APK
1. اذهب إلى "Release" > "Production"
2. انقر على "Create new release"
3. اختر ملف APK
4. أضف ملاحظات الإصدار
5. انقر على "Review release"
6. انقر على "Rollout to Production"

## استكشاف الأخطاء

### المشكلة: فشل البناء
**الحل**:
- تحقق من أن جميع المكتبات مثبتة: `flutter pub get`
- تحقق من إصدار Flutter: `flutter --version`
- شاهد سجلات البناء للتفاصيل

### المشكلة: خطأ في التوقيع
**الحل**:
- تأكد من صحة كلمة مرور المفتاح
- تأكد من صحة اسم المفتاح (alias)

### المشكلة: خطأ في الأذونات
**الحل**:
- تحقق من ملف `AndroidManifest.xml`
- أضف الأذونات المطلوبة

## الملفات المهمة

- `pubspec.yaml`: ملف المكتبات والإعدادات
- `android/app/build.gradle`: إعدادات بناء Android
- `android/app/src/main/AndroidManifest.xml`: بيانات التطبيق
- `lib/main.dart`: الملف الرئيسي للتطبيق

## الدعم والمساعدة

- [توثيق Flutter](https://flutter.dev/docs)
- [توثيق Codemagic](https://docs.codemagic.io)
- [توثيق Google Play](https://support.google.com/googleplay)

---

تم إعداده بـ ❤️ لتطبيق الديوان اليوناني
