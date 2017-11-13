//
//  User.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/3.
//  Copyright © 2017年 YLRS. All rights reserved.
//
import HandyJSON
import Foundation
class User: HandyJSON {
    var uid         : Int?
    var username    : String?
    var avatar      : String?
    var level       : Int?
    var local       : String?
    var mobile      : String?
    var posts       : String?
    var follows     : String?
    var followers   : String?
    var favs        : String?

    required init(){}
}
