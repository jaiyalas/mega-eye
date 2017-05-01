# mega-eye

## dofu

測試用 project 。
目前確認有可以用 stack 接上 SFML(haskell) 沒問題，用的是 github 上的遠端版本。
本機端需要安裝 SFML 和 CSFML。 stack build 時要指定路徑：

```{.bash}
stack build --extra-include-dirs=/usr/local/Cellar/csfml/2.4/include/ --extra-include-dirs=/usr/local/Cellar/sfml/2.4.2/include/ --extra-lib-dirs=/usr/local/Cellar/csfml/2.4/lib --extra-lib-dirs=/usr/local/Cellar/sfml/2.4.2/lib
```

## SFML (Haskell binding)

+ SFML/
+ https://github.com/jaiyalas/SFML/

## spine

+ spine-runtime/
+ https://github.com/jaiyalas/spine-runtimes

## Spriter

+ SpriterPlusPlus/
+ https://github.com/jaiyalas/SpriterPlusPlus
