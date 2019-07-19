## 如何快速入门iOS

## Swift快速入门

- 1.语法快速入门 [英文链接](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html), [中文翻译](https://www.cnswift.org/the-basics), 大约看个一两天吧.
- 2.语法进阶可以看下王巍写的<<Swifter swift开发者必备tip>>可以提高你的代码质量, 基本是必须看的.也是一两天吧.

## iOS相关的技能篇

- 布局技术:AutoLayout, Frame, Flex(UIStackView)可以不着急看.
- 内存管理: 知道什么是ARC, 什么样的代码会形成保留环造成循环引用导致内存泄漏.
-  UI控件: 至少知道这几个常用的控件能做什么, 用的时候可以自己查怎么初始化和赋值控件属性.下面的都是官网的链接, 如果不熟悉可以自行搜索.
	-  [UIView](https://developer.apple.com/documentation/uikit/uiview)
	-  [UILabel](https://developer.apple.com/documentation/uikit/uilabel)
	-  [UIButton](https://developer.apple.com/documentation/uikit/uibutton)
	-  [UIImageView](https://developer.apple.com/documentation/uikit/uiimageview)
	-  [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
	-  [UICollectionView](https://developer.apple.com/documentation/uikit/uicollectionview)

- 第三方框架, 至少要会用的:
	- AutoLayout布局: SnapKit
	- CocoaPods 可以安装这些第三方依赖, 使用也很简单
	- 网络: Moya, Alamofire
	- 异步加载图片: KingFisher
	- 字典转模型: Codeable 或者 ObjectMapper
	- 中间的loading: SVProgressHUD
	- 上拉下拉刷新: MJRefresh

- 上述都是最基础和常用的, 如果作为一个初学者还想补全自己的基础知识的话, 推荐<<iOS编程>>也叫<<iOS Programming>>, 视频的话推荐斯坦福德课程[链接](https://github.com/ApolloZhu/Developing-iOS-11-Apps-with-Swift), 后期你专业一点了我建议看Apple的官方文档[链接](https://developer.apple.com/documentation).

## Objc

如果你打算深入做iOS, 那Objc是必会的. 推荐看下我的帖子:[链接](http://www.cocoachina.com/bbs/read.php?tid-1731856.html)