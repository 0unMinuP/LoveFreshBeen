//
//  MainAD.swift
//  LoveFreshBeen
//
//  Created by Gao on 17/2/7.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit
import YYModel

// -----------------------------
//{
//    "code": 0,
//    "msg": "success",
//    "reqid": "933552221c3e63423e081b932739dba7",
//    "data": {
//        "title": "",
//        "img_name": "http:\/\/img01.bqstatic.com\/upload\/activity\/2016011111271995.jpg",
//        "img_big_name": "http:\/\/img01.bqstatic.com\/upload\/activity\/2016011111271981.jpg",
//        "img_url": "",
//        "starttime": "1450409894",
//        "endtime": "1454255999"
//    }
//}
// -----------------------------

class AD: NSObject {
    var title: String?
    var img_name: String?
    var starttime: String?
    var endtime: String?
}



class MainAD: NSObject {
    var code: Int = -1
    var msg: String?
    var data: AD?
    
    // 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
    class func modelContainerPropertyGenericClass() -> [AnyHashable: Any] {
        return ["data": AD.self]
    }
    
    
    class func loadADData(_ completion:(_ data: MainAD?, _ error: NSError?) -> Void) {
        
        guard let path = Bundle.main.path(forResource: "AD", ofType: nil) else{
            return
        }

        let url = URL(fileURLWithPath: path)
        
        guard let jsonString = try? String(contentsOf: url) else{
            return
        }

        let mainAD = MainAD.yy_model(withJSON: jsonString)
        
        if mainAD != nil {
            completion(mainAD, nil)
        }

    }
}


