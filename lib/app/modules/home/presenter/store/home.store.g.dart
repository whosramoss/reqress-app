// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<List<UserModel>> _$usersAPIComputed;

  @override
  List<UserModel> get usersAPI =>
      (_$usersAPIComputed ??= Computed<List<UserModel>>(() => super.usersAPI,
              name: '_HomeStoreBase.usersAPI'))
          .value;

  final _$_usersAtom = Atom(name: '_HomeStoreBase._users');

  @override
  List<UserModel> get _users {
    _$_usersAtom.reportRead();
    return super._users;
  }

  @override
  set _users(List<UserModel> value) {
    _$_usersAtom.reportWrite(value, super._users, () {
      super._users = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$failureAtom = Atom(name: '_HomeStoreBase.failure');

  @override
  Option<HomeFailure> get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<HomeFailure> value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$emailAtom = Atom(name: '_HomeStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$idAtom = Atom(name: '_HomeStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$clearDataAsyncAction = AsyncAction('_HomeStoreBase.clearData');

  @override
  Future<void> clearData() {
    return _$clearDataAsyncAction.run(() => super.clearData());
  }

  final _$getDataAsyncAction = AsyncAction('_HomeStoreBase.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$fetchUsersListAsyncAction =
      AsyncAction('_HomeStoreBase.fetchUsersList');

  @override
  Future<List<UserModel>> fetchUsersList() {
    return _$fetchUsersListAsyncAction.run(() => super.fetchUsersList());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
failure: ${failure},
email: ${email},
id: ${id},
usersAPI: ${usersAPI}
    ''';
  }
}
