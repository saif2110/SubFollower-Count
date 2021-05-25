//
//  SettingVC.swift
//  SubFollower Count
//
//  Created by Junaid Mukadam on 22/05/21.
//

import UIKit


class SettingVC: UIViewController{
    
    @IBOutlet weak var youtubeRefresh: UIView!
    @IBOutlet weak var youtubeNoti: UIView!
    @IBOutlet weak var twitterRefresh: UIView!
    @IBOutlet weak var twitterNoti: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
                    if let error = error {
                        print("Request Authorization Failed (\(error), \(error.localizedDescription))")
                    }
                    else{
                       //Success.. do something on success
                    }
        }
        
        applyTheme(view: youtubeRefresh)
        applyTheme(view: twitterRefresh)
        applyTheme(view: youtubeNoti)
        applyTheme(view: twitterNoti)
        
        YoutubeRefreshOutlet.selectedSegmentIndex = UserDefaults.standard.getYoutubeRefresh()
        
        TwitterRefreshOutlet.selectedSegmentIndex = UserDefaults.standard.getTwitterRefresh()
        
    }
    
    func applyTheme(view:UIView){
        view.layer.cornerRadius = 10
        view.shadow2()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var YoutubeRefreshOutlet: UISegmentedControl!
    
    @IBOutlet weak var TwitterRefreshOutlet: UISegmentedControl!
    
    @IBOutlet weak var YoutubeNotificationOutlet: UISegmentedControl!
    
    @IBOutlet weak var TwitterNotificationOutlet: UISegmentedControl!
    
    
    @IBAction func YoutubeRefreshRate(_ sender: UISegmentedControl) {
        UserDefaults.standard.setYoutubeRefresh(value: sender.selectedSegmentIndex)
    }
    
    @IBAction func TwitterRefreshRate(_ sender: UISegmentedControl) {
        UserDefaults.standard.setTwitterRefresh(value: sender.selectedSegmentIndex)
    }
    
    
}
