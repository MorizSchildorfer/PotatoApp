//
//  Potato.swift
//  Toy2
//
//  Created by Moriz Schildorfer on 11/22/18.
//  Copyright © 2018 Moriz Schildorfer. All rights reserved.
//

import UIKit

class Potato: NSObject {
    struct PotatoCellInfo {
        let type : String!
        let image : UIImage!
        let likes : String!
        let hates : String!
    }
    
    static var count : Int = 0
    
    static var potatoArr : [PotatoCellInfo]! = [PotatoCellInfo]()
    
    class func addPotato(type : String!, image: UIImage!, likes : String!, hates : String!) -> Void{
        potatoArr.append(PotatoCellInfo(type: type, image: image, likes: likes, hates: hates))
        count += 1
    }
}
