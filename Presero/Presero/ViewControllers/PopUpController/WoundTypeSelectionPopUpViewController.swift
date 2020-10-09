//
//  WoundTypeSelectionPopUpViewController.swift
//  Presero
//
//  Created by apple on 9/29/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import IQDropDownTextField
protocol WoundTypeSelectionPopUpViewControllerDelegate : class{
    func getWoundInfo(name : String , type : String , id : Int)
    func close()
}

class WoundTypeSelectionPopUpViewController: BaseViewController {
    @IBOutlet weak var txtfName: UITextField!
    @IBOutlet weak var txtfType: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var woundList = WoundListViewModel()
    var isOpen = false
    var woundId = -1
    
    weak var delegate : WoundTypeSelectionPopUpViewControllerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = true
        if(self.woundList.woundList.count > 0){
            self.txtfType.text = self.woundList.woundList[0].name
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionClose(_ sender: Any) {
        if let del = self.delegate{
            del.close()
            self.alertView?.close()
        }
    }
    
    @IBAction func actionDropDown(_ sender: Any) {
        if(self.isOpen){
            self.isOpen = !isOpen
            self.tableView.isHidden = true
        }
        else{
            self.isOpen = !isOpen
            self.tableView.isHidden = false
        }
    }
    @IBAction func actionSubmit(_ sender: Any) {
        if let del = self.delegate{
            del.getWoundInfo(name: self.txtfName.text ?? kBlankString, type: self.txtfType.text ?? kBlankString , id : self.woundId)
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

extension WoundTypeSelectionPopUpViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.woundList.woundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WoundTypeTableViewCell", for: indexPath) as! InjuryTypeTableViewCell
        cell.lblType.text = self.woundList.woundList[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.woundId = Int(self.woundList.woundList[indexPath.row].id) ?? -1
        self.txtfType.text = self.woundList.woundList[indexPath.row].name
        self.isOpen = false
        self.tableView.isHidden = true
    }
    
}
