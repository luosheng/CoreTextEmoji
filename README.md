CoreTextEmoji
=============

本项目演示了在 iOS Core Text 环境中，Emoji 与中文混排出现的问题，以及可能的解决方法。

## 截图及说明
![截图](https://github.com/luosheng/CoreTextEmoji/wiki/snapshot.png)

1. 第一行为未经处理的效果，字体为系统默认字体，在 Core Text 下表现异常。理论上在简体中文环境中，「中文测试」四个字应该使用`STHeiti-Light`，但实际上「中文」使用了 `HiraMinProN`，「测试」使用了 `STHeitiSC-Medium`。
2. 第二行在每个 Emoji 符号后插入了 zero width space，字体显示效果符合预期。
3. 第三行显式指定了 `AppleColorEmoji` 为字体名。中文字体部分显示正常，但是英文字体 fallback 到了 `CourierNewPSMT`。
4. 第四行手动指定了 英文字体 -> Apple Color Emoji -> 中文字体 的 cascading 顺序，其中中文字体使用的是 `STHeitiSC-Medium`，英文字体为 `Georgia`。最终显示效果符合预期。