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
    
    class func loadPotatos( completion : @escaping  (Array<Dictionary<String,String>>)->Void)-> Void {
        let url = URL(string : "https://www.carltonsegbefia.com/apps/potatos.json")
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if(error != nil){
                print("Failed potato loading")
                return
            }
            print("Potats are in")
            let result = try? JSONSerialization.jsonObject(with: data!, options: []) as! Array<Dictionary<String, String>>
            
            completion(result!)
 
        }
        task.resume()
    }
}
