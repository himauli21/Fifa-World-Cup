//
//  Match.swift
//  FIFA
//
//  Created by shivam gandhi on 2019-03-07.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import Foundation
import UIKit
public class Match:Team {
    
    public var date: String?
    public var group: String?
    public var time: String?
    
    public init(date: String,group: String,time: String,Name: String,Flag: UIImage){
        self.date = date
        self.group = group
        self.time = time
        super.init(name: Name, flag: Flag)
    }
    
    public func getDate() -> String {
        return self.date!
    }
    
    public func getGroup() -> String {
        return self.group!
    }
    
    public func getTime() -> String {
        return self.time!
    }
}

