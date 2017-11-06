//
//  Config.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/3.
//  Copyright © 2017年 YLRS. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
let BaseURL     = "http://api.wwmapp.cn/"
let BaseToken   = "6a268af196fc1afbb5329424236ba710"
let BaseVersion = "4.12.0"
let BaseClient  = "ios"

let BaseHeader         : HTTPHeaders = [
    "Accept"           : "*/*",
    "Accept-Encoding"  : "gzip, deflate",
    "Accept-Language"  : "zh-Hans-CN;q=1",
    "Content-Encoding" : "gzip",
    "User-Agent"       : "Wenwanmi/4.12.0 (iPhone; iOS 11.1; Scale/2.00)"
]
let BaseParam : Dictionary = [
    "version" : BaseVersion,
    "client"  : BaseClient,
    "token"   : BaseToken
]
enum kRefreshData:Int {
    case kRefreshNew = 1
    case kRefreshMore
}
/// 获取系统版本号
let kSystemVersion = (UIDevice.current.systemVersion as NSString);
/// 是否IOS7系统
let kIsIOS7OrLater = (UIDevice.current.systemVersion as NSString).floatValue >= 7 ? true : false;
/// 是否IOS8系统
let kIsIOS8OrLater = (UIDevice.current.systemVersion as NSString).floatValue >= 8 ? true : false;
/// 是否IOS9系统
let kIsIOS9OrLater = (UIDevice.current.systemVersion as NSString).floatValue >= 9 ? true : false;

// MARK: - 常用宽高

/// 屏幕Bounds
let kScreenBounds = UIScreen.main.bounds;
/// 屏幕宽度
let kScreenWidth = UIScreen.main.bounds.size.width;
/// 屏幕高度
let kScreenHeight = UIScreen.main.bounds.size.height;
/// 导航栏高度
let kNavBarHeight = 44.0;
/// 状态栏高度
let kStatusBarHeight = 20.0;
/// Tab栏高度
let kTabBarHeight = 49.0;

/// 根据RGBA生成颜色(格式为：22,22,22,0.5)
var RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}

/// 根据RGB生成颜色(格式为：22,22,22)
var RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}

/// 根据色值生成颜色(无透明度)(格式为0xffffff)
var ColorWithHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
}

/// 黑色
let kBColor = ColorWithHex(0x000000);
/// 白色
let kWColor = ColorWithHex(0xffffff)
/// 无色
let kCColor = UIColor.clear
let kG1Color = ColorWithHex(0x323232);
let kG2Color = ColorWithHex(0x646464);
let kG3Color = ColorWithHex(0x969696);
let kG4Color = ColorWithHex(0xc8c8c8); // 仅使用标题栏分割线
let kG5Color = ColorWithHex(0xdcdcdc); // 主页面分割线
let kG6Color = ColorWithHex(0xf0f0f0); // 仅用于背景灰
let kBgColor  = ColorWithHex(0xf8f8f8); // 界面背景颜色
let kHolderTipColor = ColorWithHex(0xafafaf); // 提示：输入框，这个提示语的颜色
let kButtonBlueColor = ColorWithHex(0x41acff);

let kLightColor = ColorWithHex(0x666666);
let kGrayTitleColor = ColorWithHex(0x999999);
let kGrayTipColor = ColorWithHex(0x757575);

let k323232Color = ColorWithHex(0x323232);
let k646464Color = ColorWithHex(0x646464);
let k969696Color = ColorWithHex(0x969696);
let kf0f0f0Color = ColorWithHex(0xf0f0f0);

/// 三大色调
let kEssentialColor = ColorWithHex(0x46a0f0);  // 主色调，蓝色
let kAssistOrangeColor = ColorWithHex(0xff8c28);  // 辅色调，橙色
let kAssistGreenColor = ColorWithHex(0x5abe00);  // 辅色调，绿色

//字典拼接字典
func += <KeyType, ValueType> ( left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
