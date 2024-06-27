# TestRelativeFilePath

Test with 
- two supposed relative path
 - not supported on macOS and window
  - because we do not suppose relative to what? (current executing dir? yes maybe for command line tool it could have a sens, but not implemented )
 - seems partially supported on linux but getting .parent.parent etc... will failed, because only on file path splitting, and not OS file system feature
- one absolute path (just to show that file exists)

then we print info on file, file.parent and file.parent.parent

## macOS 🍎

### Project/TestRelativeFilePath.4DProject

```diff
-Error: file does not exist:/Project/TestRelativeFilePath.4DProject
-Error: parent does not exist:/Project/
-Error: parent of parent does not exist: NULL
```

### ./Project/TestRelativeFilePath.4DProject

```diff
-Error: file does not exist:/Project/TestRelativeFilePath.4DProject
-Error: parent does not exist:/Project/
-Error: parent of parent does not exist: NULL
```

### /Users/runner/work/TestRelativeFilePath/TestRelativeFilePath/Project/TestRelativeFilePath.4DProject

```diff
Notice: file exists:/Users/runner/work/TestRelativeFilePath/TestRelativeFilePath/Project/TestRelativeFilePath.4DProject
Notice: parent exists:/Users/runner/work/TestRelativeFilePath/TestRelativeFilePath/Project/
Notice: parent of parent exists:/Users/runner/work/TestRelativeFilePath/TestRelativeFilePath/
```

## ubutool4d 🐧

### Project/TestRelativeFilePath.4DProject

```diff
Notice: file exists:Project/TestRelativeFilePath.4DProject
Notice: parent exists:Project/
-Error: parent of parent does not exist: NULL
```

> so parent of parent not exist because file path become an empty string. BUT if file exists it's parent of parent must also??

### ./Project/TestRelativeFilePath.4DProject

```diff
Notice: file exists:./Project/TestRelativeFilePath.4DProject
Notice: parent exists:./Project/
Notice: parent of parent exists:./
```

> just by chance exists, but .parent.parent.parent will not exists

### /home/runner/work/TestRelativeFilePath/TestRelativeFilePath/Project/TestRelativeFilePath.4DProject

```diff
Notice: file exists:/home/runner/work/TestRelativeFilePath/TestRelativeFilePath/Project/TestRelativeFilePath.4DProject
Notice: parent exists:/home/runner/work/TestRelativeFilePath/TestRelativeFilePath/Project/
Notice: parent of parent exists:/home/runner/work/TestRelativeFilePath/TestRelativeFilePath/
```

## win 🪟

### Project/TestRelativeFilePath.4DProject

```diff
-Error: file does not exist:/Project/TestRelativeFilePath.4DProject
-Error: parent does not exist:/Project/
-Error: parent of parent does not exist: NULL
```

### ./Project/TestRelativeFilePath.4DProject

```diff
-Error: file does not exist:/./Project/TestRelativeFilePath.4DProject
-Error: parent does not exist:/./Project/
-Error: parent of parent does not exist:/./
```


### D:/a/TestRelativeFilePath/TestRelativeFilePath/Project/TestRelativeFilePath.4DProject

```diff
Notice: file exists:D:/a/TestRelativeFilePath/TestRelativeFilePath/Project/TestRelativeFilePath.4DProject
Notice: parent exists:D:/a/TestRelativeFilePath/TestRelativeFilePath/Project/
Notice: parent of parent exists:D:/a/TestRelativeFilePath/TestRelativeFilePath/
```
