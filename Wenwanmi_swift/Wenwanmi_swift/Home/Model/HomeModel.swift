//
//  HomeModel.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/3.
//  Copyright © 2017年 YLRS. All rights reserved.
//

import Foundation
import HandyJSON
class HomeModel: HandyJSON {
    var list        : Array<TopicModel>?
    var top         : NSArray?
    var loginuid    : String?

    required init(){}
}
