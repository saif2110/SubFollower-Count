//
//  ViewController.swift
//  SubFollower Count
//
//  Created by Junaid Mukadam on 17/05/21.
//

import UIKit
import Kingfisher
import WidgetKit
import KeychainSwift
import AppTrackingTransparency
import StoreKit
import InAppPurchase

class ViewController: UIViewController {
    
    @IBOutlet weak var Apptital: UILabel!
    
    @IBOutlet weak var smallWidgetthird: UILabel!
    
    @IBOutlet weak var bigWidgetthird: UILabel!
    
    @IBOutlet weak var idText: UITextField!{
        didSet{
            idText.buttonshadow()
        }
    }
    
    
    @IBOutlet weak var themeLabel: UILabel!
    
    
    //Small Widget Start
    
    @IBOutlet weak var smallWidgetBigImage: UIImageView!{
        didSet{
            self.smallWidgetBigImage.layer.cornerRadius = smallWidgetBigImage.bounds.width/2
            self.smallWidgetBigImage.layer.borderWidth = 1.5
            self.smallWidgetBigImage.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    @IBOutlet weak var smallWidgetTitel: UILabel!
    
    @IBOutlet weak var smallWidgetSmallImage: UIImageView!
    @IBOutlet weak var smallWidgetSubFollowTitel: UILabel!
    @IBOutlet weak var smallWidgetTotalTitel: UILabel!
    
    //Small Widget End
    
    
    //Medium Widget Start
    
    @IBOutlet weak var bigWidgetBigImage: UIImageView!{
        didSet{
            self.bigWidgetBigImage.layer.cornerRadius = bigWidgetBigImage.bounds.width/2
            self.bigWidgetBigImage.layer.borderWidth = 1.5
            self.bigWidgetBigImage.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    
    @IBOutlet weak var bigWidgetTitel: UILabel!
    
    
    @IBOutlet weak var bigWidgetSmallImage: UIImageView!
    
    
    @IBOutlet weak var bigWidgetSubFollowTitel: UILabel!
    
    @IBOutlet weak var bigWidgetTotalTitel: UILabel!
    
    //Medium Widget End
    
    @IBOutlet weak var submitOutlet: UIButton!{
        didSet{
            submitOutlet.layer.cornerRadius = submitOutlet.bounds.width/2
        }
    }
    
    @IBOutlet weak var smallWidget: UIView!
    
    @IBOutlet weak var mediumWidget: UIView!
    
    @IBOutlet weak var segmentioView: UISegmentedControl!
    
    @IBOutlet weak var textView: UITextField!
    
    @IBOutlet weak var themeSegment: UISegmentedControl!
    @IBOutlet weak var quetion: UIButton!
    @IBOutlet weak var setting: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.gettimesOpen() == 1 {
            DispatchQueue.main.async {
                self.present(Welcome(), animated: true, completion: nil)
            }
        }else{
            DispatchQueue.main.async {
                
                if !UserDefaults.standard.isProMember() {
                    self.present(InAppVC(), animated: true, completion: nil)
                }
                
            }
        }
        
        
        
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
            // Tracking authorization completed. Start loading ads here.
            // loadAd()
        })
        
        YoutubeAlgo()
        
        setting.layer.cornerRadius = setting.bounds.width/2
        setting.buttonshadow()
        quetion.layer.cornerRadius = setting.bounds.width/2
        quetion.buttonshadow()
        
        textView.shadow2()
        mediumWidget.shadow()
        smallWidget.shadow()
        
        idText.layer.cornerRadius = idText.bounds.height/2
        submitOutlet.layer.cornerRadius = submitOutlet.bounds.height/2
        submitOutlet.buttonshadow()
        
        segmentioView.backgroundColor = #colorLiteral(red: 0.9213220185, green: 0.9213220185, blue: 0.9213220185, alpha: 0.3102821302)
        segmentioView.layer.borderColor = UIColor.clear.cgColor
        segmentioView.selectedSegmentTintColor = UIColor.white
        
        segmentioView.layer.borderWidth = 1
        segmentioView.layer.cornerRadius = 10
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmentioView.setTitleTextAttributes(titleTextAttributes, for:.normal)
        
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.systemRed]
        segmentioView.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
        themeSegment.selectedSegmentIndex = UserDefaults.standard.getYoutubeThemeSelected()
        
        setThemeFor(Themefor:"youtube", index: UserDefaults.standard.getYoutubeThemeSelected())
        
        if UserDefaults.standard.isProMember() {
            proOutlet.isHidden = true
        }
        
        let iap = InAppPurchase.default
        iap.set(shouldAddStorePaymentHandler: { (product) -> Bool in
            return true
        }, handler: { (result) in
            switch result {
            case .success( _):
                self.PerchesedComplte()
            case .failure( _):
                print("error")
            }
        })
    }
    
    func PerchesedComplte(){
        KeychainSwift().clear()
        WidgetCenter.shared.reloadAllTimelines()
        UserDefaults.standard.setisProMember(value: true)
        self.present(myAlt(titel:"Congratulations !",message:"You are a pro member now. Enjoy seamless experience without the Ads."), animated: true, completion: nil)
    }
    
    
    func requestToRate() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    var whatSelected = "youtube" //for theme
    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
            let main_string = "SubFollow Widget"
            let string_to_color = "Widget"
            
            let range = (main_string as NSString).range(of: string_to_color)
            let attributedString = NSMutableAttributedString(string:main_string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemRed , range: range)
            
            Apptital.attributedText = attributedString
            whatSelected = "youtube"
            smallWidgetSubFollowTitel.textColor = .systemRed
            bigWidgetSubFollowTitel.textColor = .systemRed
            smallWidgetBigImage.layer.borderColor = UIColor.systemRed.cgColor
            bigWidgetBigImage.layer.borderColor = UIColor.systemRed.cgColor
            quetion.backgroundColor = .systemRed
            setting.backgroundColor = .systemRed
            submitOutlet.backgroundColor = .systemRed
            themeLabel.textColor = .systemRed
            themeLabel.text = "Youtube Themes"
            YoutubeAlgo()
            proOutlet.tintColor = .systemRed
            
            setThemeFor(Themefor:"youtube", index: UserDefaults.standard.getYoutubeThemeSelected())
            
            submitOutlet.tag = 1
            
            idText.placeholder = "Enter Youtube Username or Channel ID"
            
            themeSegment.selectedSegmentIndex = UserDefaults.standard.getYoutubeThemeSelected()
            
            
        }else{
            
            let main_string = "SubFollow Widget"
            let string_to_color = "Widget"
            
            let range = (main_string as NSString).range(of: string_to_color)
            let attributedString = NSMutableAttributedString(string:main_string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: TwitterBlue , range: range)
            
            Apptital.attributedText = attributedString
            whatSelected = "twitter"
            smallWidgetSubFollowTitel.textColor = TwitterBlue
            bigWidgetSubFollowTitel.textColor = TwitterBlue
            smallWidgetBigImage.layer.borderColor = TwitterBlue.cgColor
            bigWidgetBigImage.layer.borderColor = TwitterBlue.cgColor
            quetion.backgroundColor = TwitterBlue
            setting.backgroundColor = TwitterBlue
            submitOutlet.backgroundColor = TwitterBlue
            themeLabel.textColor = TwitterBlue
            themeLabel.text = "Twitter Themes"
            proOutlet.tintColor = TwitterBlue
            
            setThemeFor(Themefor:"twitter", index: UserDefaults.standard.getTwitterThemeSelected())
            
            TwitterAlgo(username: UserDefaults.standard.gettwitterLink())
            
            submitOutlet.tag = 2
            
            idText.placeholder = "Enter Twitter Username"
            
            
            themeSegment.selectedSegmentIndex = UserDefaults.standard.getTwitterThemeSelected()
            
        }
        
    }
    
    
    @IBAction func submit(_ sender: UIButton) {
        
        if idText.text!.count > 0 {
            
            if sender.tag == 1 {
                UserDefaults.standard.setyoutubeLink(value: self.idText.text!)
                YoutubeAlgo()
            }else{
                TwitterAlgo(username: idText.text!)
            }
            
            requestToRate()
            
        }else{
            
            self.present(myAlt(titel:"Error",message:"Please Enter Valid Username / ID"), animated: true, completion: nil)
        }
        
    }
    
    func YoutubeAlgo(){
        
        var url = "https://www.googleapis.com/youtube/v3/channels?id=\(UserDefaults.standard.getyoutubeLink())&key=AIzaSyCDIJWetcLylh7Yglxp051YznI6lk6vNzw&part=snippet,statistics"
        
        postWithParameter(Url: url) { JSON, Err in
            if JSON["pageInfo"]["totalResults"] == 0 {
                url = "https://www.googleapis.com/youtube/v3/channels?forUsername=\(UserDefaults.standard.getyoutubeLink())&key=AIzaSyCDIJWetcLylh7Yglxp051YznI6lk6vNzw&part=snippet,statistics"
                
                youtubrAPI()
            }else{
                youtubrAPI()
            }
        }
        
        func youtubrAPI(){
            
            postWithParameter(Url: url) { JSON, Error in
                if JSON["pageInfo"]["totalResults"] == 1 {
                    
                    let titel = JSON["items"][0]["snippet"]["title"].string ?? ""
                    
                    let image = JSON["items"][0]["snippet"]["thumbnails"]["medium"]["url"].string ?? ""
                    
                    let subs = Int(JSON["items"][0]["statistics"]["subscriberCount"].string ?? "")!.formattedWithSeparator
                    
                    let vidoCount = JSON["items"][0]["statistics"]["videoCount"].string ?? ""
                    
                    WidgetCenter.shared.reloadAllTimelines()
                    
                    self.smallWidgetTitel.text = titel
                    self.bigWidgetTitel.text = titel
                    self.smallWidgetSubFollowTitel.text = subs
                    self.bigWidgetSubFollowTitel.text = "Subs - " + subs
                    self.smallWidgetBigImage.kf.setImage(with: URL(string: image))
                    self.bigWidgetBigImage.kf.setImage(with: URL(string: image))
                    self.bigWidgetTotalTitel.text = "Video Count - " + vidoCount
                    self.smallWidgetTotalTitel.text = "Total Subscribers"
                    self.smallWidgetSmallImage.image = #imageLiteral(resourceName: "youtube_small")
                    self.bigWidgetSmallImage.image = #imageLiteral(resourceName: "youtube_small")
                    
                }else{
                    self.present(myAlt(titel:"Incorrect Username / ID",message:"Please enter valid Youtube Username / Channel ID."), animated: true, completion: nil)
                }
            }
        }
    }
    
    func TwitterAlgo(username:String){
        
        postWithParameterTwitter(username: username) { JSON, Err in
            
            let titel = JSON["screen_name"].string ?? ""
            
            var image = JSON["profile_image_url_https"].string ?? ""
            image = image.replacingOccurrences(of: "_normal", with: "")
            
            let subs = JSON["followers_count"].int ?? 00
            
            let vidoCount = JSON["friends_count"].int ?? 00
            
            
            if !JSON["errors"].exists() && !username.contains(" ") {
                UserDefaults.standard.settwitterLink(value: username)
                WidgetCenter.shared.reloadAllTimelines()
                
                self.smallWidgetTitel.text = titel
                self.bigWidgetTitel.text = titel
                self.smallWidgetSubFollowTitel.text = subs.formattedWithSeparator
                self.bigWidgetSubFollowTitel.text = "Followers - " + String(subs)
                self.smallWidgetBigImage.kf.setImage(with: URL(string: image))
                self.bigWidgetBigImage.kf.setImage(with: URL(string: image))
                self.bigWidgetTotalTitel.text = "Following - " + String(vidoCount)
                self.smallWidgetTotalTitel.text = "Total Followers"
                
              
              if UserDefaults.standard.getTwitterThemeSelected() == 0 {
                
                self.smallWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.black)
                self.bigWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.black)
                
              }else{
                self.smallWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.white)
                self.bigWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.white)
                
              }
              
                
                
            }else{
                
                self.present(myAlt(titel:"Invalid Twitter Username",message:"Please enter valid username & try again"), animated: true, completion: nil)
            }
        }
        
    }
    
    
    @IBAction func themeSegment(_ sender: UISegmentedControl) {
        if whatSelected == "youtube"{
            
            setThemeFor(Themefor:"youtube", index: sender.selectedSegmentIndex)
            
        }else{
            
            setThemeFor(Themefor:"twitter", index: sender.selectedSegmentIndex)
        }
        
    }
    
    func setThemeFor(Themefor:String = "youtube",index:Int) {
        
        smallWidget.backgroundColor = UIColor(hexString: bgColour[index])
        mediumWidget.backgroundColor = UIColor(hexString: bgColour[index])
        
        smallWidgetTitel.textColor = UIColor(hexString: textColour[index])
        bigWidgetTitel.textColor = UIColor(hexString: textColour[index])
      
      if Themefor == "twitter" {
        //make even follower (middle) text theme wise i.e black,white,white cuz its no more blue (twitter color)
        smallWidgetSubFollowTitel.textColor = UIColor(hexString: textColour[index])
        bigWidgetSubFollowTitel.textColor = UIColor(hexString: textColour[index])
        
        
        // twitter image color according to theme black and white
      
        if index == 0 {
          
          self.smallWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.black)
          self.bigWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.black)
          
        }else{
          
          self.smallWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.white)
          self.bigWidgetSmallImage.image = #imageLiteral(resourceName: "twitter").withTintColor(.white)
          
        }
        
      }
      
      
      
      
      
  
        smallWidgetthird.textColor = UIColor(hexString: thirdColour[index])
        
        bigWidgetthird.textColor = UIColor(hexString: thirdColour[index])
        
        if Themefor == "youtube"{
            UserDefaults.standard.setYoutubeThemeSelected(value: index)
        }else{
            UserDefaults.standard.setTwitterThemeSelected(value: index)
        }
      
      
      
    }
    
    
    
    @IBOutlet weak var proOutlet: UIButton!
    @IBAction func pro(_ sender: Any) {
        let vc = InAppVC()
        present(vc, animated: true, completion: nil)
    }
    
    
}


