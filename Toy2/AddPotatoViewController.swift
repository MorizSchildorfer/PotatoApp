//
//  AddPotatoViewController.swift
//  Toy2
//
//  Created by Moriz Schildorfer on 11/23/18.
//  Copyright © 2018 Moriz Schildorfer. All rights reserved.
//

import UIKit


class AddPotatoViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    @IBOutlet weak var TableView: UITableView!
    var isPickerViewOpened : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoneButton.isEnabled=false
        //dismissKeyBoardWhenTappingAround()
        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //Mark: Button Taps
    @IBAction func ClearButtonTapped(_ sender: Any) {
        clearSelections()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DoneButtonTapped(_ sender: Any) {
        
        Potato.addPotato(type: type, image: #imageLiteral(resourceName: "yukon"), likes: likes, hates: hates, interested: interested)
        clearSelections()
        
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func clearSelections()->Void{
        interested = "Nobody"
        likes = ""
        hates = ""
        type = ""
        selectedRow = 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }
        else if(section == 2){
            return isPickerViewOpened ? 2 : 1
        }
        else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddPotatoCell", for: indexPath) as! AddPotatoCell
        
        
        cell.TextView.textContainer.maximumNumberOfLines = 1
        cell.TextView.textContainer.lineBreakMode = .byTruncatingTail
        cell.PickerView.isHidden = true
        cell.TextView.tag = 0
        cell.TextView.isEditable = true
        cell.TextView.isScrollEnabled = false
        if(indexPath.section == 0){
            cell.TextView.textColor = UIColor.gray
            cell.TextView.text="Type"
            
        }
        else if(indexPath.section == 1){
            if(indexPath.row == 0){
                cell.TextView.text="Likes"
                cell.TextView.textColor = UIColor.green
            }
            else{
                cell.TextView.text="Hates"
                cell.TextView.textColor = UIColor.red
            }
        }
        else{
            if(indexPath.row==0){
                if(interested == "Nobody"){
                    cell.TextView.text="Interested in  "
                }
                else{
                    cell.TextView.text="Interested in  " + interested
                }
                cell.TextView.isScrollEnabled = false
                cell.TextView.isEditable = false
                cell.TextView.isUserInteractionEnabled = false
                cell.TextView.isHidden=false
            }
            else{
                cell.TextView.isHidden = true
                cell.PickerView.isHidden = false
                cell.PickerView.selectRow(selectedRow, inComponent: 0, animated: true)
            }
            
        }
        cell.addPotatoViewControllerShortcut = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 2 && indexPath.row == 1){
            return 100
        }
        else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section==2 && indexPath.row == 0){
            isPickerViewOpened = !isPickerViewOpened
            tableView.reloadSections(IndexSet.init(integer: 2), with: .automatic)
            
        }
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
