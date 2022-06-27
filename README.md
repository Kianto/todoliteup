# Todo LiteUp
by To Anh Kiet

### About the app
● All: Showing both complete and incomplete Todo.
● Complete: Showing complete Todo.
● Incomplete: Show incomplete Todo.
● Having a Bottom navigation bar to switch between the above screens.

### Structure
| Layer | Class |
| ---- | ---- |
| Data | local data source |
| Domain | usecases |
| Screens | controller <-> ui |

### Test
```bash
flutter test --coverage --pub test/*
genhtml -o coverage coverage/lcov.info
open coverage/index.html
```
