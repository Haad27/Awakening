import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
          appStateNotifier.loggedIn ? const NavBarPage() : const AuthWelcomeScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const NavBarPage()
              : const AuthWelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'auth_WelcomeScreen',
          path: '/authWelcomeScreen',
          builder: (context, params) => const AuthWelcomeScreenWidget(),
        ),
        FFRoute(
          name: 'auth_Create',
          path: '/authCreate',
          builder: (context, params) => const AuthCreateWidget(),
        ),
        FFRoute(
          name: 'auth_ForgotPassword',
          path: '/authForgotPassword',
          builder: (context, params) => const AuthForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'chat_2_main')
              : const Chat2MainWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          builder: (context, params) => const Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ProfileWidget(),
          ),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => const Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'question1',
          path: '/question1',
          builder: (context, params) => const Question1Widget(),
        ),
        FFRoute(
          name: 'question2',
          path: '/question2',
          builder: (context, params) => const Question2Widget(),
        ),
        FFRoute(
          name: 'question3',
          path: '/question3',
          builder: (context, params) => const Question3Widget(),
        ),
        FFRoute(
          name: 'question4',
          path: '/question4',
          builder: (context, params) => const Question4Widget(),
        ),
        FFRoute(
          name: 'Question5',
          path: '/question5',
          builder: (context, params) => const Question5Widget(),
        ),
        FFRoute(
          name: 'question6',
          path: '/question6',
          builder: (context, params) => const Question6Widget(),
        ),
        FFRoute(
          name: 'question7',
          path: '/question7',
          builder: (context, params) => const Question7Widget(),
        ),
        FFRoute(
          name: 'question8',
          path: '/question8',
          builder: (context, params) => const Question8Widget(),
        ),
        FFRoute(
          name: 'prequestionpage',
          path: '/prequestionpage',
          builder: (context, params) => const PrequestionpageWidget(),
        ),
        FFRoute(
          name: 'mainpage',
          path: '/mainpage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'mainpage')
              : const MainpageWidget(),
        ),
        FFRoute(
          name: 'Anxiety_relief',
          path: '/anxietyRelief',
          builder: (context, params) => const AnxietyReliefWidget(),
        ),
        FFRoute(
          name: 'Deepbreath',
          path: '/deepbreath',
          builder: (context, params) => const DeepbreathWidget(),
        ),
        FFRoute(
          name: 'guidedmindfulnessmeditation',
          path: '/guidedmindfulnessmeditation',
          builder: (context, params) => const GuidedmindfulnessmeditationWidget(),
        ),
        FFRoute(
          name: 'Relaxandrecharge',
          path: '/relaxandrecharge',
          builder: (context, params) => const RelaxandrechargeWidget(),
        ),
        FFRoute(
          name: 'ChallangereframeCopy',
          path: '/challangereframeCopy',
          builder: (context, params) => const ChallangereframeCopyWidget(),
        ),
        FFRoute(
          name: 'BodyScanMeditation',
          path: '/bodyScanMeditation',
          builder: (context, params) => const BodyScanMeditationWidget(),
        ),
        FFRoute(
          name: 'Identifyingandjournal',
          path: '/identifyingandjournal',
          builder: (context, params) => const IdentifyingandjournalWidget(),
        ),
        FFRoute(
          name: 'Physicalworkoutsession',
          path: '/physicalworkoutsession',
          builder: (context, params) => const PhysicalworkoutsessionWidget(),
        ),
        FFRoute(
          name: 'DailyAchievableGoal',
          path: '/dailyAchievableGoal',
          builder: (context, params) => const DailyAchievableGoalWidget(),
        ),
        FFRoute(
          name: 'Reachingouttoafriend',
          path: '/reachingouttoafriend',
          builder: (context, params) => const ReachingouttoafriendWidget(),
        ),
        FFRoute(
          name: 'PositiveAffirmations',
          path: '/positiveAffirmations',
          builder: (context, params) => const PositiveAffirmationsWidget(),
        ),
        FFRoute(
          name: 'Selftalk',
          path: '/selftalk',
          builder: (context, params) => const SelftalkWidget(),
        ),
        FFRoute(
          name: 'LearninganewSkill',
          path: '/learninganewSkill',
          builder: (context, params) => const LearninganewSkillWidget(),
        ),
        FFRoute(
          name: 'QuitePlace',
          path: '/quitePlace',
          builder: (context, params) => const QuitePlaceWidget(),
        ),
        FFRoute(
          name: 'cooloff',
          path: '/cooloff',
          builder: (context, params) => const CooloffWidget(),
        ),
        FFRoute(
          name: 'useofIStatment',
          path: '/useofIStatment',
          builder: (context, params) => const UseofIStatmentWidget(),
        ),
        FFRoute(
          name: 'bedtimeroutine',
          path: '/bedtimeroutine',
          builder: (context, params) => const BedtimeroutineWidget(),
        ),
        FFRoute(
          name: 'ComfortableSleepenvenvironment',
          path: '/comfortableSleepenvenvironment',
          builder: (context, params) => const ComfortableSleepenvenvironmentWidget(),
        ),
        FFRoute(
          name: 'nocaffine',
          path: '/nocaffine',
          builder: (context, params) => const NocaffineWidget(),
        ),
        FFRoute(
          name: 'Dedicatedtimeforfamilymembers',
          path: '/dedicatedtimeforfamilymembers',
          builder: (context, params) => const DedicatedtimeforfamilymembersWidget(),
        ),
        FFRoute(
          name: 'activelis',
          path: '/activelis',
          builder: (context, params) => const ActivelisWidget(),
        ),
        FFRoute(
          name: 'HelpinginChores',
          path: '/helpinginChores',
          builder: (context, params) => const HelpinginChoresWidget(),
        ),
        FFRoute(
          name: 'prayershabbit',
          path: '/prayershabbit',
          builder: (context, params) => const PrayershabbitWidget(),
        ),
        FFRoute(
          name: 'Quran',
          path: '/quran',
          builder: (context, params) => const QuranWidget(),
        ),
        FFRoute(
          name: 'gratitude',
          path: '/gratitude',
          builder: (context, params) => const GratitudeWidget(),
        ),
        FFRoute(
          name: 'StressRelief',
          path: '/stressRelief',
          builder: (context, params) => const StressReliefWidget(),
        ),
        FFRoute(
          name: 'depressionrelief',
          path: '/depressionrelief',
          builder: (context, params) => const DepressionreliefWidget(),
        ),
        FFRoute(
          name: 'angerrelief',
          path: '/angerrelief',
          builder: (context, params) => const AngerreliefWidget(),
        ),
        FFRoute(
          name: 'relationships',
          path: '/relationships',
          builder: (context, params) => const RelationshipsWidget(),
        ),
        FFRoute(
          name: 'selfesteemrelief',
          path: '/selfesteemrelief',
          builder: (context, params) => const SelfesteemreliefWidget(),
        ),
        FFRoute(
          name: 'prayers',
          path: '/prayers',
          builder: (context, params) => const PrayersWidget(),
        ),
        FFRoute(
          name: 'Sleep',
          path: '/sleep',
          builder: (context, params) => const SleepWidget(),
        ),
        FFRoute(
          name: 'HomepageM',
          path: '/homepageM',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomepageM')
              : const HomepageMWidget(),
        ),
        FFRoute(
          name: 'therpypocket',
          path: '/therpypocket',
          builder: (context, params) => const TherpypocketWidget(),
        ),
        FFRoute(
          name: 'notes1',
          path: '/notes1',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'notes1')
              : const Notes1Widget(),
        ),
        FFRoute(
          name: 'Atombomb',
          path: '/atombomb',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Atombomb')
              : const AtombombWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfileCopy',
          path: '/auth2EditProfileCopy',
          builder: (context, params) => const Auth2EditProfileCopyWidget(),
        ),
        FFRoute(
          name: 'loginCopy',
          path: '/loginCopy',
          builder: (context, params) => const LoginCopyWidget(),
        )
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authWelcomeScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/WhatsApp_Image_2024-05-20_at_23.59.01_efb6766b_-_Copy_(2).jpg',
                    fit: BoxFit.cover,
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
