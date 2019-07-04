# 关于 ‘some’ 关键字的理解

## 简要
随着2019年6月份WWDC的大力推出之下，swiftUI横空出世，吸引了开发者的眼球，为之激动人心，其实 declaration 开发在安卓和flutter 中都有体现，  这其实是移动端的一种趋势，实施证明大量开发过程中，都已经对绝对坐标的依赖越来越少；
	另外在swiftUI 之中，我们每个页面都要继承一个叫View 的 protocol ,  其中 需要实现var  body: ‘some’ View 的关键字。。。。 what is ‘some’ ？  why use  some？

## 场景考虑
考虑以下需求：我们的支付方式很多支付方式，如：信用卡支付、app 支付、银行卡支持；
    在代码当中我们会定义一个协议 PaymentType，如下：

## 创建协议和 具体的结构体

```swift 
protocol PaymentType {
func pay() -> Void
}
```

然后我们的创建不同的支付类，如下：
```swift 
 	//创建appPayt
 	struct ApplePay: PaymentType { /* ... */
	    func pay() {
	        print("I am Apple pay")
	    }
	}
 	//创建幸用卡支持
 	struct CreditCard: PaymentType{
	    func pay() {
	        print("I am credit Card")
	    }
	}
  
```
 
 ### 创建建造者
 在程序当中为了保护代码的信息，我们是不会透露太多具体类信息给外部的，因此 我们对外开发的时候只会通过构造者方式创建ApplePay 和 CreditCard ，如下：

```swift
	func favoriteCrediCard2() -> PaymentType{
	    return CreditCard()
	}

	func favoriteAppPay2() -> PaymentType{
   		 return ApplePay()
	}

```
此时外部调用代码如下：
```swift 
	let crediCard1 = favoriteCrediCard2() //OK 
	let crediCard2  = favoriteAppPay2()  //OK 
```

## 问题的出现
到目前为止，其实上面都还是比较顺利的 ，也没什么问题，但是我们考虑这样一个场景，如果我们要判定上面 ‘crediCard1’ 和‘crediCard2’ 是否相等呢？，我们如何去做？ 其实我们都会想到一个答案，就是 ‘PaymentType’继承‘Equatable’ 如下：
>1.protocol PaymentType :Equatable

>2.func favoriteCrediCard2() -> PaymentType 会出现以下错误

>3.<font color='red'>Protocol 'PaymentType' can only be used as a generic constraint because it has Self or associated type requirements</font>

上面3 的错误是指Equatable 无法对协议进行对比，只能通过泛型实现。因为类比较只能对相同类型进行对比，所以在编译时就会报错。那么其实我们会想可以通过泛型来进行解决这个问题，如下代码：

```swift

func favoriteCrediCard1<T:PaymentType>() -> T{
    return CreditCard() as! T
}

func favoriteAppPay1<T:PaymentType>() -> T{
    return ApplePay() as! T
}

```

外部调用代码如下：
```swift
let crediCard1 = favoriteCrediCard1() //error
let crediCard2  = favoriteAppPay1() //error

```
此时又会出现 以下错误
> <font color="red"> Generic parameter 'T' could not be inferred </font>

由于类型没有指明，无法隐式推断出类型，于是乎我们又改成以下写法：

```swift
let crediCard1:CreditCard = favoriteCrediCard1() //OK 
let crediCard2:ApplePay  = favoriteAppPay1() //OK
let same1  = crediCard1 == crediCard2 //error （不同类型无法比较，编译时期就会报错）
let same2  = crediCard1 == crediCard1 //OK 


```
error：
<font color="red">Binary operator '==' cannot be applied to operands of type 'CreditCard' and 'ApplePay' </font>>


到这里我们已经完成了编译通过， 但是很明显又有两个问题出现了：

 - CreditCard 和 ApplePay这两个类怎么又暴露出去了呢？？
 - 代码通过泛型编码变得复杂

## 使用 ‘some’ 解决
那么我们如何使用‘some’ 解决呢，我们只要在协议前面添加 关键子‘some’即可，代码如下：
```swift
func favoriteCrediCard() ->some PaymentType{
    CreditCard()
}



func favoriteAppPay() -> some PaymentType{
    ApplePay()
}
```

调用代码如下：
```swift 
let creditCard1 = favoriteCrediCard()  //OK 
let creditCard2 = favoriteCrediCard()  //OK 
let same : Bool = creditCard1 == creditCard2   //会自行推断类型。当然不同类型还是会报错的
```











