// import 'package:dartz/dartz.dart';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:todoliteup/core/error/failures.dart';
// import 'package:todoliteup/domain/usecases/ts_create_task.dart';
// import 'package:todoliteup/domain/usecases/ts_delete_task.dart';
// import 'package:todoliteup/domain/usecases/ts_get_task_detail.dart';
// import 'package:todoliteup/domain/usecases/ts_get_tasks.dart';
// import 'package:todoliteup/domain/usecases/ts_update_task.dart';
//
// import 'package:todoliteup/injection_container.dart' as di;
// import 'package:todoliteup/models/task.dart';
// import 'package:todoliteup/screens/home/controllers/home_controller.dart';
// import 'package:todoliteup/screens/home/home_binding.dart';
// import 'package:todoliteup/screens/home/home_page.dart';
//
// import 'home_test.mocks.dart';
//
// @GenerateMocks([CreateTask, UpdateTask, DeleteTask, GetTasks, GetTaskDetail])
// void main() {
//   final createTask = MockCreateTask();
//   final updateTask = MockUpdateTask();
//   final deleteTask = MockDeleteTask();
//   final getTasks = MockGetTasks();
//   final getTaskDetail = MockGetTaskDetail();
//
//   setUp(() async {
//     GetIt.instance.registerLazySingleton<CreateTask>(() => createTask);
//     GetIt.instance.registerLazySingleton<UpdateTask>(() => updateTask);
//     GetIt.instance.registerLazySingleton<DeleteTask>(() => deleteTask);
//     GetIt.instance.registerLazySingleton<GetTasks>(() => getTasks);
//     GetIt.instance.registerLazySingleton<GetTaskDetail>(() => getTaskDetail);
//     HomeBinding().dependencies();
//   });
//   tearDown(() async {
//     di.sl.reset();
//     await GetIt.instance.reset();
//   });
//
//   setUpGet() {
//     when(getTasks.call(null)).thenAnswer(
//       (_) async => Right([
//         MTask(title: "title0", description: "description", status: 0),
//         MTask(title: "title1", description: "description", status: 1),
//         MTask(title: "title2", description: "description", status: 1),
//       ]),
//     );
//     when(getTasks.call(MTask.stDone)).thenAnswer(
//       (_) async => Right([
//         MTask(title: "title1", description: "description", status: 1),
//         MTask(title: "title2", description: "description", status: 1),
//       ]),
//     );
//     when(getTasks.call(MTask.stDoing)).thenAnswer(
//       (_) async => Right([
//         MTask(title: "title0", description: "description", status: 0),
//       ]),
//     );
//   }
//
//   setUpGetSingle() {
//     when(getTasks.call(null)).thenAnswer(
//       (_) async => Right([
//         MTask(title: "title0", description: "description", status: 0),
//       ]),
//     );
//     when(getTasks.call(MTask.stDone)).thenAnswer((_) async => const Right([]));
//     when(getTasks.call(MTask.stDoing)).thenAnswer(
//       (_) async => Right([
//         MTask(title: "title0", description: "description", status: 0),
//       ]),
//     );
//   }
//
//   setUpNone() {
//     when(getTasks.call(null)).thenAnswer((_) async => Left(CacheFailure()));
//     when(getTasks.call(MTask.stDone))
//         .thenAnswer((_) async => Left(CacheFailure()));
//     when(getTasks.call(MTask.stDoing))
//         .thenAnswer((_) async => Left(CacheFailure()));
//   }
//
//   group('UI home testing', () {
//     testWidgets('Home page changing', (WidgetTester tester) async {
//       // arrange
//       setUpGet();
//       await tester.pumpWidget(
//         const GetMaterialApp(
//           home: HomePage(),
//         ),
//       );
//       await tester.pump();
//
//       // assert
//       expect(find.text("title0"), findsOneWidget);
//       // act
//       await tester.tap(find.byIcon(Icons.assignment_turned_in_outlined));
//       await tester.pump();
//       await tester.pump();
//       // assert
//       expect(Get.find<HomeController>().pageController.page, 2);
//       expect(find.text("title0"), findsNothing);
//
//       // act
//       await tester.tap(find.byIcon(Icons.assignment_late_outlined));
//       await tester.pump();
//       await tester.pump();
//       // assert
//       expect(find.text("title0"), findsOneWidget);
//     });
//
//     testWidgets('UI change status task testing', (WidgetTester tester) async {
//       // arrange
//       setUpGetSingle();
//       final data =
//           MTask(title: "title0", description: "description", status: 1);
//       when(updateTask.call(data)).thenAnswer((_) async => const Right(true));
//       await tester.pumpWidget(
//         const GetMaterialApp(
//           home: HomePage(),
//         ),
//       );
//       await tester.pump();
//       // act
//       await tester.tap(find.byType(ExpandablePanel));
//       await tester.pumpAndSettle();
//       await tester.tap(find.byIcon(Icons.check_circle_outline));
//       await tester.pumpAndSettle();
//       // assert
//       verify(updateTask.call(data));
//     });
//
//     testWidgets('UI delete task testing', (WidgetTester tester) async {
//       // arrange
//       setUpGetSingle();
//       when(deleteTask.call(0)).thenAnswer((_) async => const Right(true));
//       await tester.pumpWidget(
//         const GetMaterialApp(
//           home: HomePage(),
//         ),
//       );
//       await tester.pump();
//       // act
//       await tester.tap(find.byType(ExpandablePanel));
//       await tester.pumpAndSettle();
//       await tester.tap(find.byType(OutlinedButton));
//       await tester.pumpAndSettle();
//       // assert
//       verify(deleteTask.call(0));
//     });
//
//     testWidgets('UI create task testing', (WidgetTester tester) async {
//       // arrange
//       setUpNone();
//       final data = MTask(title: "title0", description: "description");
//       when(createTask.call(data)).thenAnswer((_) async => const Right(24));
//       await tester.pumpWidget(
//         const GetMaterialApp(
//           home: HomePage(),
//         ),
//       );
//       await tester.pump();
//       // act
//       await tester.tap(find.byIcon(Icons.add));
//       await tester.pumpAndSettle();
//       await tester.enterText(find.byKey(const ValueKey(0)), "title0");
//       await tester.enterText(find.byKey(const ValueKey(1)), "description");
//       await tester.tap(find.byType(ElevatedButton));
//       await tester.pumpAndSettle();
//       // assert
//       verify(createTask.call(data));
//     });
//   });
// }
