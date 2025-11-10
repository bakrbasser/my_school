// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class BaseException implements Exception {
  final String message;

  BaseException({required this.message});

  @override
  String toString() => message;
}

class NetworkException extends BaseException {
  NetworkException()
    : super(
        message:
            'يوجد مشكلة في الانترنت الخاص بك اعد المحاولة عند الوصول الى الشابكة',
      );
}

class UnauthorizedException extends BaseException {
  UnauthorizedException()
    : super(
        message: 'عذرا لا تمتلك الصلاحيات اللازمة للقيام بالعملية المطلوبة',
      );
}

class TimeoutExceptionCustom extends BaseException {
  TimeoutExceptionCustom()
    : super(message: 'انتهى وقت الانتظار، حاول مرة أخرى لاحقًا');
}

class ServerException extends BaseException {
  ServerException([
    String msg =
        ' حدث خطأ في الخادم يرجى المحاولة في وقت لاحق او تقديم شكوى لخدمة العملاء',
  ]) : super(message: msg);
}

class DatabaseException extends BaseException {
  DatabaseException([
    String msg = ' الطلب المرسل غير صالح يرجى اعادة المحاولة بطلب جديد',
  ]) : super(message: msg);
}

class StorageException extends BaseException {
  StorageException([String msg = ' يوجد ملف تالف في قاعدة البيانات'])
    : super(message: msg);
}

//Text Fields Exceptions
class EmptyNameField extends BaseException {
  EmptyNameField([String msg = 'حقل اسم المنتج فارغ يرجى تعبئته'])
    : super(message: msg);
}

class EmptySearchField extends BaseException {
  EmptySearchField([String msg = 'حقل البحث المنتج فارغ يرجى تعبئته'])
    : super(message: msg);
}

//Auth Related Exceptions
class InvalidEmail extends BaseException {
  InvalidEmail([
    String msg = 'البريد الكتروني المدخل غير صالح يرجى ادخال ايميل صحيح',
  ]) : super(message: msg);
}

class UnAuthenticated extends BaseException {
  UnAuthenticated([String msg = 'لا يوجد بريد الكتروني مسجل يرجى تسجيل الدخول'])
    : super(message: msg);
}

class IncorrectCredentials extends BaseException {
  IncorrectCredentials([
    String msg =
        'بيانات الدخول غير صحيحة يرجى التحقق من البريد الالكتروني وكلمة المرور',
  ]) : super(message: msg);
}

Exception mapToFailure(Object e) {
  if (e is SocketException || e is TimeoutException) {
    return NetworkException();
  } else if (e is PostgrestException) {
    return DatabaseException();
  } else if (e is StorageException) {
    return StorageException();
  } else if (e is EmptyNameField) {
    return EmptyNameField();
  } else if (e is EmptySearchField) {
    return EmptySearchField();
  } else if (e is InvalidEmail) {
    return InvalidEmail();
  } else if (e is AuthApiException) {
    return IncorrectCredentials();
  }
  return BaseException(message: e.toString());
}

Future<T> guardCall<T>({required Future<T> Function() call}) async {
  try {
    final result = await call();
    return result;
  } catch (e) {
    throw mapToFailure(e);
  }
}
