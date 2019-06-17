# Binding

 Binding 是解决子View 修改父View 属性的一种方式交互方式。  


##  例子

以下代码是 通过 showPrice 控制List 是否展示 price 明细显示；同时，按钮本身根据 showPrice 进行文字切换为 "hide"或者"show"


``` Swift

import SwiftUI 

struct Order {
    var name:String
    var price :Float
}


struct KBBinding : View {
    var orders:[Order] = [Order(name: "apple", price: 10.0),
                  Order(name: "computer", price: 7000.0),
                 Order(name: "alien", price: 5200.0),
                Order(name: "pandan", price: 1200.0)]
    
    @State var showPrice = true
    var body: some View {
        List(orders.identified(by:\.name)){
            order in
            HStack(alignment:.center){
                Text(order.name)
                Spacer()
                if self.showPrice {
                        Text("\(String(format: "%.2f¥", order.price))").font(Font.system(.caption)).foregroundColor(.red)
                }
            
            }
        }.navigationBarTitle(Text("Bind"),displayMode: .automatic)
            .navigationBarItems(trailing: ToggleButton(toggle: $showPrice))
    }
}

struct ToggleButton:View {
    @Binding var toggle :Bool
    var body: some View{
        Button(action: {
            self.toggle.toggle()
        }, label: {
            Text(self.toggle ? "Hide" :"Show")
        })
    }
}

#if DEBUG
struct KBBinder_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView{
              KBBinding()
        }
    }
}
#endif

```

如果将  Binding 替换成 State ，则ToggleButton 只会影响自己本身的状态。 
```Swift
 @Binding var toggle :Bool  -->  @State var toggle :Bool

```

## 说明
其实像我们的TextEidt 文字输入也是Binding 的一种形式，TextEdit 修改内容之后，会直接影响父View的值，以及它相关联的View


