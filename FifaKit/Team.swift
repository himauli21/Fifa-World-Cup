//
//  Team.swift
//  FIFA
//
//  Created by shivam gandhi on 2019-03-07.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import Foundation
import UIKit
public class Team {
    
    public var name: String?
    public var flag: UIImage
    
    public init(name: String,flag: UIImage){
        self.name = name
        self.flag = flag
    }
    
    public func getName() -> String {
        return self.name!
    }
    
    public func getFlag() -> UIImage {
        return self.flag
    }
}
