//
//  SideMenuViewController.swift
//  Presero
//
//  Created by Rizwan Ali on 27/07/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SideMenuViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func actionLogout(_ sender: UIButton){
        if let sideMenu = navigationController?.parent as? KYDrawerController{
            sideMenu.setDrawerState(.closed, animated: true)
            let container = (sideMenu.mainViewController as? UINavigationController)?.topViewController as! MainContainerViewController
            
            container.logoutUser()
        }
       
    }

}
//MARK: - EXTENSION TABLE VIEW METHODS
extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sideMenuCell) as! SideMenuTableViewCell
        cell.configure(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let drawer = self.navigationController?.parent as! KYDrawerController
               drawer.setDrawerState(.closed, animated: true)
               let mainVC = (drawer.mainViewController as! UINavigationController).topViewController as! MainContainerViewController
//        if let sideMenu = navigationController?.parent as? KYDrawerController{
//            sideMenu.setDrawerState(.closed, animated: true)
//        }
        if(indexPath.row == 0){
           mainVC.showHomeController()
        }
        else if(indexPath.row == 1){
            mainVC.showSettingsController()
        }
    }
    
}
