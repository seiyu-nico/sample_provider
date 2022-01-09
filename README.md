# sample_provider
## Providerを使う場合と使わない場合のサンプル

## 再描画の違い(v1)
```log
flutter logs
# Providerを使った場合
# 1個目追加
I/flutter (23629): build: TodoList
I/flutter (23629): build: TodoListTile
# 2個目追加
I/flutter (23629): build: TodoList
I/flutter (23629): build: TodoListTile
I/flutter (23629): build: TodoListTile

# Providerを使わない場合
# 1個目追加
I/flutter (22885): build: _TodoNotUseProviderScreenState
I/flutter (22885): build: TodoList
I/flutter (22885): build: TodoInput
I/flutter (22885): build: TodoListTile
# 2個目追加
I/flutter (22885): build: _TodoNotUseProviderScreenState
I/flutter (22885): build: TodoList
I/flutter (22885): build: TodoInput
I/flutter (22885): build: TodoListTile
I/flutter (22885): build: TodoListTile
```

## 再描画の違い(v2)
```log
flutter logs
# Providerを使った場合
# 1個目追加
I/flutter (28585): build: TodoInput
I/flutter (28585): build: TodoList
I/flutter (28585): build: TodoListTile
# 2個目追加
I/flutter (28585): build: TodoInput
I/flutter (28585): build: TodoList
I/flutter (28585): build: TodoListTile
I/flutter (28585): build: TodoListTile
# 作成済みのTodoのsutatus変更
I/flutter (28585): build: TodoListTile
I/flutter (28585): build: TodoListTile

# Providerを使わない場合
# 1個目追加
I/flutter (28585): build: _TodoNotUseProviderScreenState
I/flutter (28585): build: TodoList 
I/flutter (28585): build: TodoInput
I/flutter (28585): build: TodoListTile
# 2個目追加
I/flutter (28585): build: _TodoNotUseProviderScreenState
I/flutter (28585): build: TodoList 
I/flutter (28585): build: TodoInput
I/flutter (28585): build: TodoListTile
I/flutter (28585): build: TodoListTile
# 作成済みのTodoのsutatus変更
I/flutter (28585): build: _TodoNotUseProviderScreenState
I/flutter (28585): build: TodoList 
I/flutter (28585): build: TodoInput
I/flutter (28585): build: TodoListTile
I/flutter (28585): build: TodoListTile
```
