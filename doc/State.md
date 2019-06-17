# @State

SwiftUI 天然实现了 MVVM 模式，程序猿只关心自己的值，从而达到直接变更相关连的UI 。 而这种关键字就是使用State来实现。


## Demo

如下例子：

``` Swift

import SwiftUI

struct KBState : View {
    @State var randomVale:String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Button(action: {
                arc4random()
                let value = arc4random()%100 + 1
                self.randomVale = "\(value)"
            }) {
                Text("Random Number")
            }
           
            
            Text(randomVale.count>0 ? randomVale :"show random value(1~100)")
            Spacer()
        }.padding()
    }
}

#if DEBUG
struct KBState_Previews : PreviewProvider {
    static var previews: some View {
        KBState()
    }
}
#endif

```

其实是我的例子使用randomValue来控制 Text 显示的内容，当点击按钮时候，random值会变，然后之间变更UI；非常的方便
