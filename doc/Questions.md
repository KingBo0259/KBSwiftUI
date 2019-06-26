# 踩坑记录

## 环境

Xcode : Version 11.0 beta (11M336w)

Mac : 10.15 Beta (19A471t)

 

## 1、Form 标签无法找到

 SwiftUI Demo 应该是支持**Form**表单形式布局的，但是我们写**Form** 时候，编译会报错，没有找到.
提示信息如下

``` Swift
Use of unresolved identifier 'Form'
```

## 2、TabbedView 只支持 Text 或者 Image 无法进行 Text 和Image 组合

``` SWiftUI 
1、第一种 Image
 Text("Tab1")
                .tabItemLabel(Image("tab_home")
                                .resizable())
                .tag(1)


2、文本
  Text("这里为什么Image 和Text 一起布局有问题呢？？ SwiftUI bug？")
               
               .lineLimit(nil) .padding().tabItemLabel(Text("首页")).tag(2)

3、无法实习 文本 和Image 组合，如：
  Text("组合").tabItemLabel {
                    Image(systemName: "square.and.pencil")
                    Text("Tab1")
                }
备注: 此时会报错 [请看这里](https://stackoverflow.com/questions/56604914/tabbedview-using-swiftui-in-xcode11beta-11m336w)


```

## 3、如何修改NavigationBar title字体颜色？

我的设置如下，
``` Swift 
第一种
         Xxx .navigationBarTitle(Text("TEST")).foregroundColor(.orange)
第二种
 .navigationBarTitle((Text("测试页面12")
                                        .color(.red)
                                        .font(.largeTitle)
                                        .underline()),displayMode: .inline)

```
但是两种都是无效的， how can I do it？

## 4、 如何修改Navigation 背景颜色？

全局的可以通过 设置如下
``` Swift
      let navi = UINavigationBar.appearance()
        navi.barTintColor = UIColor.white

```

但是如何控制单个页面 的 背景颜色呢？？

## 5、presentation 弹出ActionSheet时候 只有生效一次,再次点击就无效


如下：

``` Swift

struct KBActionSheet : View {
    @State var showingSheet = false
    
    var sheet : ActionSheet {
        ActionSheet(title: Text("Action"), message: Text("Quote mark"), buttons: [.default(Text("Woo"), onTrigger: {
            self.showingSheet = false
        }),.default(Text("Woo12"), onTrigger: {
            self.showingSheet = false
        }),.cancel()])
    }
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show ActionSheet")
            }.presentation(self.showingSheet ? sheet :nil)
    }
}

```


## 6、onDisappear 不会触发

``` Swift 
.onAppear{
    print("Profile appeared")
}.onDisappear{
    print("Profile disappeared")//代码不会触发
}
```

## 7、Swift Packages 用来管理包依赖时候，发现搜索不到仓库资源
最新的Xcode 11.0 beta 在 Project 选项中 多了一个SwiftPackages 选项，但是自己测试使用时，发现无法获取三方库资源，网络请求一直加载之中

## 8、ScrollView 如何实现翻页效果 ？
目前**ScrollView**好像没有这个功能啊 
答：封装UIScollerPage 去实现

## 9、 How to pop a NavigationButton programmatically?
目前好像如果使用 NavigationButton push 一个页面，好像无法使用 编码方式进行进行pop 功能。坐等Apple去fix
[How to pop a NavigationButton programmatically?](https://forums.developer.apple.com/thread/117585)

## 10、 怎样实现present 自定义页面呢？
目前我们知道可以通过 present 方式进行弹出以下几种

 ####  1. presentation 弹出 Alert
  ``` swift 
  struct KBAlertView : View {
    @State var showingAlert = false

    var body: some View {
        VStack {
            
            Button(action: {
                self.showingAlert = true
            }) {
                Text("show Alert")
                }.presentation($showingAlert) { () -> Alert in
                    //由于第一个存在。这里就不会被触发
                    Alert(title: Text("I am present message"), message: Text("wear sunscreen"), primaryButton: .default(Text("Got it!")),secondaryButton: .cancel())
            }
        }
        
    }
}
  ``` 


  #### 2、presentation 弹出 ActionSheet 

  ``` swift 
  struct KBActionSheet : View {
    @State var showingSheet = false
    
    var sheet : ActionSheet {
        ActionSheet(title: Text("Action"), message: Text("Quote mark"), buttons: [.default(Text("Woo"), onTrigger: {
            self.showingSheet = false
        }),.default(Text("Woo12"), onTrigger: {
            self.showingSheet = false
        }),.cancel()])
    }
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show ActionSheet")
            }.presentation(self.showingSheet ? sheet :nil)
    }
}
```

#### 3、 presentation 弹出 Modal 并且可以实现弹出自定义View 并且可以编码方式进行关闭当前页面

``` swift 
struct KBModalDetailView:View {
    @Binding var dismissFlag: Bool
    
    var body:some View {
        Group {
            Text("Detail")
            Button(action: {
                self.dismissFlag.toggle()
            }) {
                Text("Dismiss")
            }
        }
    }
}

struct KBModalView : View {
    @State var dismissFlag = false

    var body: some View {
        Button(action: {
            self.dismissFlag.toggle()
        })
        { Text("Show") }
            .presentation(!dismissFlag ? nil :
                    Modal(KBModalDetailView(dismissFlag: $dismissFlag)) {
                    print("dismissed \(self.dismissFlag)")
                }
               
            )
        
    }
}
```

#### 4、使用PresentationButton 直接弹出自定义View ，但是无法进行编码进行主动dismiss
(常见的场景如： present  用户登录页面，然后登录成功之后，需要马上关闭登录页面)

``` swift 
        PresentationButton(Text("Click to Present View"), destination: KBPresentViewDetail())

```






