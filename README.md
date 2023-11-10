# Todo LiteUp
by To Anh Kiet

### About the app
- All: Showing both complete and incomplete Todo.
- Complete: Showing complete Todo.
- Incomplete: Show incomplete Todo.
- Having a Bottom navigation bar to switch between the above screens.

![screenshot.png](assets%2Fscreenshot.png)

There are some updates should be added on in the following versions so that the app has more utilities:
- Change a task by updating data
- Due date time
- Check list items
- Notify user

### Structure
| Layer   | Class             |
|---------|-------------------|
| Data    | local data source |
| Domain  | usecases          |
| Screens | controller <-> ui |

### Test
| Layer   | Case                                            |
|---------|-------------------------------------------------|
| Data    | Create data successfully                        |
|         | Create data throw exception                     |
|         | Update data successfully                        |
|         | Update data throw exception                     |
|         | Delete data successfully                        |
|         | Delete data throw exception                     |
|         | Get list data successfully                      |
|         | Get list data throw exception                   |
|         | Get list by condition data successfully         |
|         | Get list by condition data throw exception      |
|         |                                                 |
| Domain  | Create request is successful                    |
|         | Create request has exception and return failure |
|         | Update request is successful                    |
|         | Create request has exception and return failure |
|         | Delete request is successful                    |
|         | Delete request has exception and return failure |
|         | Get list data successfully                      |
|         | Get list data has exception and return failure  |
|         |                                                 |
| Screens | Changing page and check filtered data by status |
|         | Create task: fill form and create               |
|         | Update status task: switch status doing to done |
|         | Delete task                                     |
|         |                                                 |

```bash
flutter test --coverage
genhtml -o coverage coverage/lcov.info
open coverage/index.html
```

### Clean format

```bash
cd todoliteup_1 && dart format . && cd ../todoliteup_2 && dart format . && cd ..
```

----------------------

# Nx Flutter

This project was generated using [Nx](https://nx.dev).

<p style="text-align: center;"><img src="https://raw.githubusercontent.com/nrwl/nx/master/images/nx-logo.png" width="450"></p>

🔎 **Smart, Fast and Extensible Build System**

## Setup

```shell
brew install yarn
yarn global add nx
yarn install
```

## Generate an application

```shell
nx g @nxrocks/nx-flutter:create your-app-name --template app
```

## Generate a library

```shell
nx g @nxrocks/nx-flutter:create your-lib-name --template module
```

## Running unit tests

```shell
# execute the unit tests
nx test my-app

# execute the unit tests affected by a change.
nx affected:test
```

## Understand your workspace

```shell
nx graph
```

## Nx help

- [Nx Documentation](https://nx.dev)
- [Nx Flutter Documentation](https://github.com/tinesoft/nxrocks/tree/develop/packages/nx-flutter)
