//
//  ManageOperatorsViewController.swift
//  Presero
//
//  Created by apple on 9/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ManageOperatorsViewController: BaseViewController,TopBarDelegate {
    
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var tableVeiw: UITableView!
    var operatorList = OperatorListViewModel()
    var disableColor = "757A80"
    var selectedIndex = -1
    var previousSelectedIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.operatorList = Global.shared.operatorList
        self.configureView()
        self.tableVeiw.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.btnRight.isHidden = true
            container.setTitle(title: "Manage Operators")
            container.delegate = self
            container.setMenuButton(isBack: true)
        }
        let params : ParamsAny = ["type" : "operator_list" , "token" : Global.shared.token]
        self.getOperators(params: params)
    }
    
    @IBAction func actionBottomBar(_ sender: UIButton) {
        if(sender.tag == 0){
            self.navigationController?.popViewController(animated: true)
        }
        else if(sender.tag == 1){
           
            let operater = self.operatorList.operatorList[self.selectedIndex]
            let params : ParamsAny  = ["Deleted" : true ,
                                       "token" : Global.shared.token ,
                                       "type" : "update_operator",
                                       "id": operater.id ,
                                       "LoginName" : operater.loginName ,
                                       "FirstName": operater.firstName ,
                                       "LastName" : operater.lastName ,
                                       "Email"  : operater.email ,
                                       "EncryptedPassword" : operater.encryptedPassword ,"PasswordLastChanged" : operater.passwordLastChanged,
                                       "MiddleName" : operater.middleName]
            self.deleteOperator(params: params)
        }
        else if(sender.tag == 2){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.AddOperatorViewController) as! AddOperatorViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.EditOperatorViewController) as! EditOperatorViewController
            vc.operater = self.operatorList.operatorList[self.selectedIndex]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    func configureView(){
        self.btnDelete.setTitleColor(UIColor.init(hexFromString: self.disableColor), for: .normal)
        self.btnEdit.setTitleColor(UIColor.init(hexFromString: self.disableColor), for: .normal)
        self.btnDelete.isUserInteractionEnabled = false
        self.btnEdit.isUserInteractionEnabled = false
        
    }
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
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
//MARK:- TABLE VIEW METHODS
extension ManageOperatorsViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.operatorList.operatorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.ManageOperatorTableViewCell, for: indexPath) as! ManageOperatorTableViewCell
        cell.selectionStyle = .none
        cell.configureView(operater: self.operatorList.operatorList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableVeiw.deselectRow(at: indexPath, animated: true)
        self.previousSelectedIndex = self.selectedIndex
        if(previousSelectedIndex != -1 && previousSelectedIndex != indexPath.row){
            self.operatorList.operatorList[previousSelectedIndex].isSelected = false
            self.tableVeiw.reloadRows(at: [IndexPath(row: previousSelectedIndex, section: 0)], with: .automatic)
        }
        self.selectedIndex = indexPath.row
        self.operatorList.operatorList[indexPath.row].isSelected = !self.operatorList.operatorList[indexPath.row].isSelected
        
        if(self.operatorList.operatorList[indexPath.row].isSelected){
            self.btnDelete.setTitleColor(.white, for: .normal)
            self.btnEdit.setTitleColor(.white, for: .normal)
            self.btnDelete.isUserInteractionEnabled = true
            self.btnEdit.isUserInteractionEnabled = true
            self.tableVeiw.reloadRows(at: [indexPath], with: .automatic)
            
        }
        else{
            
            self.tableVeiw.reloadRows(at: [indexPath], with: .automatic)
            self.btnDelete.setTitleColor(UIColor.init(hexFromString: self.disableColor), for: .normal)
            self.btnEdit.setTitleColor(UIColor.init(hexFromString: self.disableColor), for: .normal)
            self.btnDelete.isUserInteractionEnabled = false
            self.btnEdit.isUserInteractionEnabled = false
        }
    }
}
extension ManageOperatorsViewController{
    func deleteOperator(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            OperatorServices.shared().updateOperators(params: params) { (message, success) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.showAlertView(message: message, title: "", doneButtonTitle: "OK") { (action) in
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
    func getOperators(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            LoginService.shared().getOperators(params: params) { (message, success, operatorList) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.operatorList = operatorList!
                        Global.shared.operatorList = operatorList!
                        self.operatorList = Global.shared.operatorList
                        self.tableVeiw.reloadData()
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
}
extension Date {
    public var removeTimeStamp : Date? {
       guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
        return nil
       }
       return date
   }
}
