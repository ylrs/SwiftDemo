//
//  ViewController.swift
//  DemoSwift04_constant
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
        常量一旦设定，在程序运行时就无法改变其值。
        常量可以是任何的数据类型如：整型常量，浮点型常量，字符常量或字符串常量。同样也有枚举类型的常量：
        常量类似于变量，区别在于常量的值一旦设定就不能改变，而变量的值可以随意更改。
        常量声明：常量使用关键字 let 来声明，而变量使用关键字 var 来声明
        
        常量的命名
        1、可以由字母，数字和下划线组成。
        2、常量需要以字母或下划线开始。
        3、区分大小写，所以字母大写与小写是不一样的。
        
        */
        
        // 定义整型常量
        let age:Int = 10
        print("age = \(age)")
        
        // 定义浮点型常量
        let money = 199.34
        print(money)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

