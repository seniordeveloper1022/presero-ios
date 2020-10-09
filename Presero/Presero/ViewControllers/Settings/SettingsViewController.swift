//
//  SettingsViewController.swift
//  Presero
//
//  Created by apple on 9/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var settingOption = ["Manage Operators"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.btnRight.isHidden = true
            container.setMenuButton()
            container.btnPateintDetails.tintColor = UIColor.init(hexFromString: "7F7F7F")
            container.setImageBtnRight(setSearchImage: false, isHiddenImage: true , image: "search-icon")
            container.viewSearch.isHidden = true
            container.titleLabel.isHidden = false
            container.btnRight.isHidden = true
            container.setTitle(title: "Settings")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.btnRight.isHidden = false
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

extension SettingsViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.SettingsMenuTableViewCell, for: indexPath) as! SettingsMenuTableViewCell
        cell.lblOption.text = self.settingOption[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.row == 0){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.ManageOperatorsViewController) as! ManageOperatorsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
