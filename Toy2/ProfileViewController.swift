//
//  ProfileViewController.swift
//  Toy2
//
//  Created by Moriz Schildorfer on 11/22/18.
//  Copyright © 2018 Moriz Schildorfer. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    var type : String! = " "
    var profileImage : UIImage! = #imageLiteral(resourceName: "yukon")
    var likes : String! = " "
    var hates : String! = " "
    var interested : String! = " "
    
   
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var hatesLabel: UILabel!
    @IBOutlet weak var interestedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.text = type
        profileImageView.image = profileImage
        likesLabel.text = likes
        hatesLabel.text = hates
        interestedLabel.text = interested
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
