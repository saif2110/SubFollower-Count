//
//  UserDef.swift
//  EVV
//
//  Created by Abhisar Bhatnagar on 20/11/19.
//  Copyright © 2019 Saif Mukadam. All rights reserved.
//

import Foundation
import SwiftyJSON

let TwitterBlue:UIColor = #colorLiteral(red: 0.2153705359, green: 0.6007890105, blue: 0.9002060294, alpha: 1)

let bgColour = ["#fefffeff","#f2d4d4ff","#121212ff"]
let textColour = [UIColor.black.htmlRGBaColor,"#cb0e74ff","#ffffffff"]
let thirdColour = [UIColor.lightGray.htmlRGBaColor,"#cb0e74ff",#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).htmlRGBaColor]


enum UserDefaultsKeys : String {
    
    case youtubeLink
    case twitterLink
    
    case YoutubeRefresh
    case TwitterRefresh
    
    
    case YoutubeThemeSelected
    case TwitterThemeSelected
    
    case timesOpen
    
    case isProMember
    
    
}
//setisProMember



extension UserDefaults {
    
    func setyoutubeLink(value: String){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.youtubeLink.rawValue)
    }
    
    func getyoutubeLink() -> String{
        return UserDefaults(suiteName: "group.SubFollower")!.string(forKey: UserDefaultsKeys.youtubeLink.rawValue) ?? "PewDiePie"
    }
    
    
    func settwitterLink(value: String){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.twitterLink.rawValue)
    }
    
    
    func gettwitterLink() -> String{
        return UserDefaults(suiteName: "group.SubFollower")!.string(forKey: UserDefaultsKeys.twitterLink.rawValue) ?? "elonmusk"
    }
    
    
    func setYoutubeRefresh(value: Int){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.YoutubeRefresh.rawValue)
    }
    
    func getYoutubeRefresh() -> Int{
        return UserDefaults(suiteName: "group.SubFollower")!.integer(forKey: UserDefaultsKeys.YoutubeRefresh.rawValue)
    }
    
    
    func setTwitterRefresh(value: Int){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.TwitterRefresh.rawValue)
    }
    
    func getTwitterRefresh() -> Int{
        return UserDefaults(suiteName: "group.SubFollower")!.integer(forKey: UserDefaultsKeys.TwitterRefresh.rawValue)
    }
    
    
    func settimesOpen(value: Int){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.timesOpen.rawValue)
    }
    
    func gettimesOpen() -> Int{
        return UserDefaults(suiteName: "group.SubFollower")!.integer(forKey: UserDefaultsKeys.timesOpen.rawValue)
    }
    
    
    func setisProMember(value: Bool){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.isProMember.rawValue)
    }
    
    func isProMember() -> Bool{
        return UserDefaults(suiteName: "group.SubFollower")!.bool(forKey: UserDefaultsKeys.isProMember.rawValue)
    }
    
    
    func setYoutubeThemeSelected(value: Int){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.YoutubeThemeSelected.rawValue)
    }
    
    func getYoutubeThemeSelected() -> Int{
        return UserDefaults(suiteName: "group.SubFollower")!.integer(forKey: UserDefaultsKeys.YoutubeThemeSelected.rawValue)
    }
   
    
    func setTwitterThemeSelected(value: Int){
        UserDefaults(suiteName:
                        "group.SubFollower")!.set(value, forKey: UserDefaultsKeys.TwitterThemeSelected.rawValue)
    }
    
    func getTwitterThemeSelected() -> Int{
        return UserDefaults(suiteName: "group.SubFollower")!.integer(forKey: UserDefaultsKeys.TwitterThemeSelected.rawValue)
    }
   
    
}

import UIKit

extension UIColor
{
    static let aluminum = UIColor(red:153/255, green:153/255, blue:153/255, alpha:1.0)
    static let aqua = UIColor(red:0/255, green:128/255, blue:255/255, alpha:1.0)
    static let asparagus = UIColor(red:128/255, green:120/255, blue:0/255, alpha:1.0)
    static let banana = UIColor(red:255/255, green:255/255, blue:102/255, alpha:1.0)
    static let blueberry = UIColor(red:0/255, green:0/255, blue:255/255, alpha:1.0)
    static let bubblegum = UIColor(red:255/255, green:102/255, blue:255/255, alpha:1.0)
    static let cantalope = UIColor(red:255/255, green:204/255, blue:102/255, alpha:1.0)
    static let carnation = UIColor(red:255/255, green:111/255, blue:207/255, alpha:1.0)
    static let cayenne = UIColor(red:128/255, green:0/255, blue:0/255, alpha:1.0)
    static let clover = UIColor(red:0/255, green:128/255, blue:0/255, alpha:1.0)
    static let eggplant = UIColor(red:64/255, green:0/255, blue:128/255, alpha:1.0)
    static let fern = UIColor(red:64/255, green:128/255, blue:0/255, alpha:1.0)
    static let flora = UIColor(red:102/255, green:255/255, blue:102/255, alpha:1.0)
    static let grape = UIColor(red:128/255, green:0/255, blue:255/255, alpha:1.0)
    static let honeydew = UIColor(red:204/255, green:255/255, blue:102/255, alpha:1.0)
    static let ice = UIColor(red:102/255, green:255/255, blue:255/255, alpha:1.0)
    static let iron = UIColor(red:76/255, green:76/255, blue:76/255, alpha:1.0)
    static let lavender = UIColor(red:204/255, green:102/255, blue:255/255, alpha:1.0)
    static let lead = UIColor(red:25/255, green:25/255, blue:25/255, alpha:1.0)
    static let lemon = UIColor(red:255/255, green:255/255, blue:0/255, alpha:1.0)
    static let licorice = UIColor(red:0/255, green:0/255, blue:0/255, alpha:1.0)
    static let lime = UIColor(red:128/255, green:255/255, blue:0/255, alpha:1.0)
    static let magenta = UIColor(red:255/255, green:0/255, blue:255/255, alpha:1.0)
    static let magnesium = UIColor(red:179/255, green:179/255, blue:179/255, alpha:1.0)
    static let maraschino = UIColor(red:255/255, green:0/255, blue:0/255, alpha:1.0)
    static let maroon = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
    static let mercury = UIColor(red:230/255, green:230/255, blue:230/255, alpha:1.0)
    static let midnight = UIColor(red:0/255, green:0/255, blue:128/255, alpha:1.0)
    static let mocha = UIColor(red:128/255, green:64/255, blue:0/255, alpha:1.0)
    static let moss = UIColor(red:0/255, green:128/255, blue:64/255, alpha:1.0)
    static let nickel = UIColor(red:128/255, green:128/255, blue:128/255, alpha:1.0)
    static let ocean = UIColor(red:0/255, green:64/255, blue:128/255, alpha:1.0)
    static let orchid = UIColor(red:102/255, green:102/255, blue:255/255, alpha:1.0)
    static let plum = UIColor(red:128/255, green:0/255, blue:128/255, alpha:1.0)
    static let salmon = UIColor(red:255/255, green:102/255, blue:102/255, alpha:1.0)
    static let seafoam = UIColor(red:0/255, green:255/255, blue:128/255, alpha:1.0)
    static let silver = UIColor(red:204/255, green:204/255, blue:204/255, alpha:1.0)
    static let sky = UIColor(red:102/255, green:204/255, blue:255/255, alpha:1.0)
    static let snow = UIColor(red:255/255, green:255/255, blue:255/255, alpha:1.0)
    static let spindrift = UIColor(red:102/255, green:255/255, blue:204/255, alpha:1.0)
    static let spring = UIColor(red:0/255, green:255/255, blue:0/255, alpha:1.0)
    static let steel = UIColor(red:102/255, green:102/255, blue:102/255, alpha:1.0)
    static let strawberry = UIColor(red:255/255, green:0/255, blue:128/255, alpha:1.0)
    static let tangerine = UIColor(red:255/255, green:128/255, blue:0/255, alpha:1.0)
    static let teal = UIColor(red:0/255, green:128/255, blue:128/255, alpha:1.0)
    static let tin = UIColor(red:127/255, green:127/255, blue:127/255, alpha:1.0)
    static let tungsten = UIColor(red:51/255, green:51/255, blue:51/255, alpha:1.0)
    static let turquoise = UIColor(red:0/255, green:255/255, blue:255/255, alpha:1.0)
}


extension UIColor {
    var rgbComponents:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r,g,b,a)
        }
        return (0,0,0,0)
    }
    // hue, saturation, brightness and alpha components from UIColor**
    var hsbComponents:(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var brightness:CGFloat = 0
        var alpha:CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha){
            return (hue,saturation,brightness,alpha)
        }
        return (0,0,0,0)
    }
    var htmlRGBColor:String {
        return String(format: "#%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255))
    }
    var htmlRGBaColor:String {
        return String(format: "#%02x%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255),Int(rgbComponents.alpha * 255) )
    }
}

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        
        return nil
    }
}


extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
