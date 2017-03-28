//
//  BaseResponse.swift
//  youtube
//
//  Created by Thongpak on 3/25/2560 BE.
//  Copyright © 2560 Thongpak. All rights reserved.
//

import Foundation


public class BaseResponse: NSObject {
    
    public var resultCode: String?
    public var resultDesc: String?
    public var developerMessage: String?
    
    public required init(withDictionary dict: AnyObject) {
        
        self.resultCode = dict["resultCode"] as? String
        self.resultDesc = dict["resultDesc"] as? String
        self.developerMessage = dict["developerMessage"] as? String
    }
}


class ExtraPointLoginResponse: BaseResponse {
    
    var extraPointFlag: Bool?
    var extraPointMsg: String?
    
    required init(withDictionary dict: AnyObject) {
        super.init(withDictionary: dict)
        if let data = dict["data"] as? [String: AnyObject] {
            self.extraPointFlag = data["extraPointFlag"] as? String == "Y" ? true: false
            self.extraPointMsg = data["extraPointMsg"] as? String
        }
    }
}
