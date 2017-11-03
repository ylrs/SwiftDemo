//
//  ViewController.swift
//  DemoSwift03_Optional
//
//  Created by zhangshaoyu on 16/9/12.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        Swift 的可选（Optional）类型，用于处理值缺失的情况。可选表示"那儿有一个值，并且它等于 x "或者"那儿没有值"。
        当你声明一个可选变量或者可选属性的时候没有提供初始值，它的值会默认为nil。
        如果一个可选类型的实例包含一个值，你可以用后缀操作符 ！来访问这个值。但使用操作符！去获取值为nil的可选变量会有运行时错误。
        你可以用可选链接和可选绑定选择性执行可选表达式上的操作。如果值为nil，任何操作都不会执行，也不会有运行报错。
        */
        
        
        // 定义变量，且未初始化值时，同时未使用符号" ! "，或" ? "则会报错。符号" ! "，或" ? "必须紧接在变量类型之后（未初始化值时，必须声明类型）
        var name : String!
        print("name: \(name)")
        
        name="DevZhang"
        
        if name == nil
        {
            print("name is nil")
        }
        else
        {
            print("name is \(name)")
        }
        
        if (name != nil)
        {
            print("name is \(name)")
        }
        else
        {
            print("name is nil")
        }
        
        // 可选值可以使用if语句进行判断
        let className:String? = "class 8"
        if (className != nil)
        {
            print("class name is \(className)")
        }
        // 可选值可以使用有感叹号!进行强制解析，强制解析时必须有值（如果可选值没有值时，强制解包会出现编译进行时异常crash）
        let subClassName:String = className!
        print("sub class name is \(subClassName)")
        // 使用可选绑定（即不声明变量的数据类型），避免强制解包时的异常
        if let subClassName2 = className
        {
            print(subClassName2)
        }
        // optionals可选值，数据类型后添加关键字!表示隐式解析，即确保变量总是有值，获取值时无需再进行解析。
        let gladeName:String! = "glade 3"
        print(gladeName)
        
        let subGladeName:String = gladeName
        print(subGladeName)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

