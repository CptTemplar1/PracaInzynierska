import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'TicketPosterPage',
              path: 'ticketPosterPage',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
                'selectedRepertory':
                    getDoc(['repertory'], RepertoryRecord.fromSnapshot),
              },
              builder: (context, params) => TicketPosterPageWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
                selectedRepertory:
                    params.getParam('selectedRepertory', ParamType.Document),
                selectedHour: params.getParam('selectedHour', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SeatSelectionPage',
              path: 'seatSelectionPage',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
                'selectedRepertory':
                    getDoc(['repertory'], RepertoryRecord.fromSnapshot),
                'selectedRepertoryDetails': getDoc(
                    ['repertoryDetails'], RepertoryDetailsRecord.fromSnapshot),
              },
              builder: (context, params) => SeatSelectionPageWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
                selectedRepertory:
                    params.getParam('selectedRepertory', ParamType.Document),
                selectedRepertoryDetails: params.getParam(
                    'selectedRepertoryDetails', ParamType.Document),
                posterChoice: params.getParam('posterChoice', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'TicketDetails',
              path: 'ticketDetails',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
                'selectedRepertory':
                    getDoc(['repertory'], RepertoryRecord.fromSnapshot),
              },
              builder: (context, params) => TicketDetailsWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
                selectedRepertory:
                    params.getParam('selectedRepertory', ParamType.Document),
                selectedCalendarDate:
                    params.getParam('selectedCalendarDate', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'StreamingTransactionSummay',
              path: 'streamingTransactionSummay',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
              },
              builder: (context, params) => StreamingTransactionSummayWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'TicketTransactionSummay',
              path: 'ticketTransactionSummay',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
                'selectedRepertory':
                    getDoc(['repertory'], RepertoryRecord.fromSnapshot),
                'selectedRepertoryDetails': getDoc(
                    ['repertoryDetails'], RepertoryDetailsRecord.fromSnapshot),
              },
              builder: (context, params) => TicketTransactionSummayWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
                selectedRepertory:
                    params.getParam('selectedRepertory', ParamType.Document),
                selectedRepertoryDetails: params.getParam(
                    'selectedRepertoryDetails', ParamType.Document),
                posterChoice: params.getParam('posterChoice', ParamType.String),
                priceSum: params.getParam('priceSum', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'RegisterPage',
              path: 'registerPage',
              builder: (context, params) => RegisterPageWidget(),
            ),
            FFRoute(
              name: 'DeleteAccountPage',
              path: 'deleteAccountPage',
              builder: (context, params) => DeleteAccountPageWidget(),
            ),
            FFRoute(
              name: 'PersonalDataPage',
              path: 'personalDataPage',
              builder: (context, params) => PersonalDataPageWidget(),
            ),
            FFRoute(
              name: 'ForgottenPasswordPage',
              path: 'forgottenPasswordPage',
              builder: (context, params) => ForgottenPasswordPageWidget(),
            ),
            FFRoute(
              name: 'HelloPage',
              path: 'helloPage',
              builder: (context, params) => HelloPageWidget(),
            ),
            FFRoute(
              name: 'PasswordChangePage',
              path: 'passwordChangePage',
              builder: (context, params) => PasswordChangePageWidget(),
            ),
            FFRoute(
              name: 'TicketMovieInfoPage',
              path: 'ticketMovieInfoPage',
              asyncParams: {
                'selectedRepertory':
                    getDoc(['repertory'], RepertoryRecord.fromSnapshot),
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
              },
              builder: (context, params) => TicketMovieInfoPageWidget(
                selectedRepertory:
                    params.getParam('selectedRepertory', ParamType.Document),
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
                selectedCalendarDate:
                    params.getParam('selectedCalendarDate', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'StreamingMovieInfoPage',
              path: 'streamingMovieInfoPage',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
              },
              builder: (context, params) => StreamingMovieInfoPageWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EasterEggPage',
              path: 'easterEggPage',
              builder: (context, params) => EasterEggPageWidget(),
            ),
            FFRoute(
              name: 'DiscountPage',
              path: 'discountPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'DiscountPage')
                  : DiscountPageWidget(),
            ),
            FFRoute(
              name: 'WatchStreamingPage',
              path: 'watchStreamingPage',
              asyncParams: {
                'selectedOwnedStreaming':
                    getDoc(['movies'], MoviesRecord.fromSnapshot),
              },
              builder: (context, params) => WatchStreamingPageWidget(
                selectedOwnedStreaming: params.getParam(
                    'selectedOwnedStreaming', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'MainPage',
              path: 'mainPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MainPage')
                  : MainPageWidget(),
            ),
            FFRoute(
              name: 'TicketInfoPage',
              path: 'ticketInfoPage',
              asyncParams: {
                'selectedTicket':
                    getDoc(['userTickets'], UserTicketsRecord.fromSnapshot),
              },
              builder: (context, params) => TicketInfoPageWidget(
                selectedTicket:
                    params.getParam('selectedTicket', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'StreamingCheckPosterPage',
              path: 'streamingCheckPosterPage',
              asyncParams: {
                'selectedMovie': getDoc(['movies'], MoviesRecord.fromSnapshot),
              },
              builder: (context, params) => StreamingCheckPosterPageWidget(
                selectedMovie:
                    params.getParam('selectedMovie', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ShoppingTransactionPage',
              path: 'shoppingTransactionPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ShoppingTransactionPage')
                  : ShoppingTransactionPageWidget(),
            ),
            FFRoute(
              name: 'UserAccountPage',
              path: 'userAccountPage',
              asyncParams: {
                'selectedUser': getDoc(['users'], UsersRecord.fromSnapshot),
                'selectedUserKKTubeAccount':
                    getDoc(['kkTubeAccount'], KkTubeAccountRecord.fromSnapshot),
              },
              builder: (context, params) => UserAccountPageWidget(
                selectedUser:
                    params.getParam('selectedUser', ParamType.Document),
                selectedUserKKTubeAccount: params.getParam(
                    'selectedUserKKTubeAccount', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AddVideoPage',
              path: 'addVideoPage',
              builder: (context, params) => AddVideoPageWidget(),
            ),
            FFRoute(
              name: 'CreateAccountPage',
              path: 'createAccountPage',
              builder: (context, params) => CreateAccountPageWidget(),
            ),
            FFRoute(
              name: 'YourAccountPage',
              path: 'yourAccountPage',
              builder: (context, params) => YourAccountPageWidget(),
            ),
            FFRoute(
              name: 'SubscribedUsersPage',
              path: 'subscribedUsersPage',
              builder: (context, params) => SubscribedUsersPageWidget(),
            ),
            FFRoute(
              name: 'YourVideosPage',
              path: 'yourVideosPage',
              builder: (context, params) => YourVideosPageWidget(),
            ),
            FFRoute(
              name: 'UserVideosPage',
              path: 'userVideosPage',
              asyncParams: {
                'selectedUser': getDoc(['users'], UsersRecord.fromSnapshot),
                'selectedUserKKTubeAccount':
                    getDoc(['kkTubeAccount'], KkTubeAccountRecord.fromSnapshot),
              },
              builder: (context, params) => UserVideosPageWidget(
                selectedUser:
                    params.getParam('selectedUser', ParamType.Document),
                selectedUserKKTubeAccount: params.getParam(
                    'selectedUserKKTubeAccount', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'YourSelectedVideoPage',
              path: 'yourSelectedVideoPage',
              builder: (context, params) => YourSelectedVideoPageWidget(
                yourSelectedVideo: params.getParam('yourSelectedVideo',
                    ParamType.DocumentReference, false, ['kkTubeVideos']),
              ),
            ),
            FFRoute(
              name: 'ShortsPage',
              path: 'shortsPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ShortsPage')
                  : ShortsPageWidget(),
            ),
            FFRoute(
              name: 'UserSelectedVideoPage',
              path: 'userSelectedVideoPage',
              asyncParams: {
                'selectedUser': getDoc(['users'], UsersRecord.fromSnapshot),
                'selectedUserKKTubeAccount':
                    getDoc(['kkTubeAccount'], KkTubeAccountRecord.fromSnapshot),
              },
              builder: (context, params) => UserSelectedVideoPageWidget(
                userSelectedVideo: params.getParam('userSelectedVideo',
                    ParamType.DocumentReference, false, ['kkTubeVideos']),
                selectedUser:
                    params.getParam('selectedUser', ParamType.Document),
                selectedUserKKTubeAccount: params.getParam(
                    'selectedUserKKTubeAccount', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'HelpPage',
              path: 'helpPage',
              builder: (context, params) => HelpPageWidget(),
            ),
            FFRoute(
              name: 'MoviesHelpSubpage',
              path: 'moviesHelpSubpage',
              builder: (context, params) => MoviesHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'ShoppingHelpSubpage',
              path: 'shoppingHelpSubpage',
              builder: (context, params) => ShoppingHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'DiscountHelpSubpage',
              path: 'discountHelpSubpage',
              builder: (context, params) => DiscountHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'ShortsHelpSubpage',
              path: 'shortsHelpSubpage',
              builder: (context, params) => ShortsHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'DrawerHelpSubpage',
              path: 'drawerHelpSubpage',
              builder: (context, params) => DrawerHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'TransactionInfoPage',
              path: 'transactionInfoPage',
              asyncParams: {
                'selectedTransaction':
                    getDoc(['transactions'], TransactionsRecord.fromSnapshot),
              },
              builder: (context, params) => TransactionInfoPageWidget(
                selectedTransaction:
                    params.getParam('selectedTransaction', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'AllChatsPage',
              path: 'allChatsPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AllChatsPage')
                  : AllChatsPageWidget(),
            ),
            FFRoute(
              name: 'InviteUserPage',
              path: 'inviteUserPage',
              builder: (context, params) => InviteUserPageWidget(),
            ),
            FFRoute(
              name: 'CreateGroupChatPage',
              path: 'createGroupChatPage',
              builder: (context, params) => CreateGroupChatPageWidget(),
            ),
            FFRoute(
              name: 'AddChatUsersPage',
              path: 'addChatUsersPage',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => AddChatUsersPageWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'RemoveChatUsersPage',
              path: 'removeChatUsersPage',
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => RemoveChatUsersPageWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ChatsHelpSubpage',
              path: 'chatsHelpSubpage',
              builder: (context, params) => ChatsHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'UtilityScreensHelpSubpage',
              path: 'utilityScreensHelpSubpage',
              builder: (context, params) => UtilityScreensHelpSubpageWidget(),
            ),
            FFRoute(
              name: 'EasterEggPuzzlePage',
              path: 'easterEggPuzzlePage',
              builder: (context, params) => EasterEggPuzzlePageWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Image.asset(
                    'assets/images/Logo.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
