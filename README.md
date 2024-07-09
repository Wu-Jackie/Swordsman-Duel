# Swordsman-Duel

基于动态规划思想，利用ArkTS语言实现的算法分析与设计课设

> 相关知识学习可参考[本文章](https://wu-jackie.github.io/2024/07/09/ArkTS/)

- 运行环境

[DevEco Studio 3.1.1](https://developer.huawei.com/consumer/cn/deveco-studio/archive/)

- 补充

本问题具有“赢者不具有传递性“的特性，即在决斗链中，A能战胜B，B能战胜C，但A未必能战胜C

- 测试实例

```
1                    //测试数据的组数
3                    //决斗的总人数（2<=n<=500）
0;1;0;0;0;1;1;0;0    //以;分隔的n×n矩阵
3                    //最后可能获胜的人数
```

> n行n列的矩阵，矩阵中的第i行第j列如果为1表示第i个人与第j个人决斗时第i个人会胜出，为0则表示第i个人与第j个人决斗时第i个人会失败。

- 运行图片

<div>
    <img align="left" src="./README/Index.png" alt="Index" width="45%" />
    <img align="right" src="./README/Introduction.png" alt="Introduction" width="45%" />
    <img align="left" src="./README/Input.png" alt="Input" width="45%" />
    <img align="right" src="./README/Show.png" alt="Show" width="45%" />
</div>
