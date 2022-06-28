# Todo LiteUp
by To Anh Kiet

### About the app
- All: Showing both complete and incomplete Todo.
- Complete: Showing complete Todo.
- Incomplete: Show incomplete Todo.
- Having a Bottom navigation bar to switch between the above screens.

There are some updates should be added on in the following versions so that the app has more utilities:
- Change a task by updating data
- Due date time
- Check list items
- Notify user

### Structure
| Layer | Class |
| ---- | ---- |
| Data | local data source |
| Domain | usecases |
| Screens | controller <-> ui |

### Test
| Layer | Case |
| ---- | ---- |
| Data | Create data successfully |
|   | Create data throw exception |
|   | Update data successfully |
|   | Update data throw exception |
|   | Delete data successfully |
|   | Delete data throw exception |
|   | Get list data successfully |
|   | Get list data throw exception |
|   | Get list by condition data successfully |
|   | Get list by condition data throw exception |
|  |  |
| Domain | Create request is successful |
|   | Create request has exception and return failure |
|   | Update request is successful |
|   | Create request has exception and return failure |
|   | Delete request is successful |
|   | Delete request has exception and return failure |
|   | Get list data successfully |
|   | Get list data has exception and return failure |
|  |  |
| Screens | Changing page and check filtered data by status |
|   | Create task: fill form and create |
|   | Update status task: switch status doing to done |
|   | Delete task |
|  |  |

Coverage: 92.7 %
```bash
flutter test --coverage --pub test/*
genhtml -o coverage coverage/lcov.info
open coverage/index.html
```

