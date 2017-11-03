//
//  TopicModel.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/3.
//  Copyright © 2017年 YLRS. All rights reserved.
//
import HandyJSON
import Foundation
class TopicModel: HandyJSON {
    var user        : User?
    var tid         : String?
    var pics        : NSArray?
    var content     : String?
    var views       : String?
    var mid         : Int?
    var type        : String?
    
    required init(){}
}
