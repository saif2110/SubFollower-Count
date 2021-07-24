//
//  WidExtension.swift
//  WidExtension
//
//  Created by Junaid Mukadam on 19/05/21.
//

import WidgetKit
import SwiftUI
import Intents
import Alamofire
import KeychainSwift
import Kingfisher

let imageLink = "https://yt3.ggpht.com/ytc/AAUvwnga3eXKkQgGU-3j1_jccZ0K9m6MbjepV0ksd7eBEw=s240-c-k-c0x00ffffff-no-rj"
let ImageData = #imageLiteral(resourceName: "pewds.png").jpegData(compressionQuality: 1)
let videoCount = "20133"
let sub = "11,000,000"


let ImageDataTwitter = #imageLiteral(resourceName: "elon").jpegData(compressionQuality: 1)
let following = "20133"
let followers = "11,000,000"

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),name: "Pewdiepie", image: ImageData!, Subs: sub, vidoCount: videoCount, configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date:  Date(), name: "Pewdiepie", image: ImageData!, Subs: sub, vidoCount: videoCount, configuration: configuration)
        completion(entry)
    }
    
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        var name = ""
        var subs = ""
        var videoCount = ""
        var image = ""
        
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
                    
                    name = JSON["items"][0]["snippet"]["title"].string ?? ""
                    
                    image = JSON["items"][0]["snippet"]["thumbnails"]["medium"]["url"].string ?? ""
                    
                    subs = Int(JSON["items"][0]["statistics"]["subscriberCount"].string ?? "")!.formattedWithSeparator
                    
                    videoCount = JSON["items"][0]["statistics"]["videoCount"].string ?? ""
                    
                    if KeychainSwift().allKeys.count > 0 {
                        
                        let time = KeychainSwift().get("time")
                        if (Int(time ?? "00") ?? 00) < Int(Date().timeIntervalSince1970 * 1000) {
                            name = "Upgrade For Lifetime"
                            subs = "Plan Expired"
                        }
                    }
                    
                    
                    let url = URL(string: image)
                    KingfisherManager.shared.retrieveImage(with: url!) { result in
                        
                        
                        
                        let image = try? result.get().image
                        if let image = image {
                            
                            let currentDate = Date()
                            for hourOffset in 0 ..< 1 {
                                let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                                
                                
                                let entry = SimpleEntry(date: entryDate, name: name, image: image.jpegData(compressionQuality: 1)!, Subs: subs, vidoCount: videoCount, configuration: configuration)
                                entries.append(entry)
                            }
                            
                            let timeline = Timeline(entries: entries, policy: .atEnd)
                            completion(timeline)
                        }
                    }
                    
                    
                }else{
                    print("I am two")
                }
            }
            
        }}
    
}

struct Provider2: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry2 {
        SimpleEntry2(date: Date(), name: "Elon Musk", image: ImageDataTwitter!, followers: followers, following: following, configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry2) -> ()) {
        let entry = SimpleEntry2(date: Date(), name: "Elon Musk", image: ImageDataTwitter!, followers: followers, following: following, configuration: ConfigurationIntent())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry2] = []
        
        TwitterAlgo()
        
        func TwitterAlgo(){
            
            postWithParameterTwitter(username: UserDefaults.standard.gettwitterLink()){ JSON, Err in
                
                var name = JSON["screen_name"].string ?? ""
                
                var image = JSON["profile_image_url_https"].string ?? ""
                image = image.replacingOccurrences(of: "_normal", with: "")
                
                var followers = (JSON["followers_count"].int ?? 00).formattedWithSeparator
                
                let following = JSON["friends_count"].int ?? 00
                
                if KeychainSwift().allKeys.count > 0 {
                    
                    let time = KeychainSwift().get("time")
                    if (Int(time ?? "00") ?? 00) < Int(Date().timeIntervalSince1970 * 1000) {
                        name = "Upgrade For Lifetime"
                        followers = "Plan Expired"
                    }
                }
                
                let url = URL(string: image)
                KingfisherManager.shared.retrieveImage(with: url!) { result in
                    let image = try? result.get().image
                    if let image = image {
                        let currentDate = Date()
                        for hourOffset in 0 ..< 1 {
                            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                            
                            let entry = SimpleEntry2(date: entryDate, name: name, image: image.jpegData(compressionQuality: 1)!, followers: followers, following: String(following), configuration: configuration)
                            entries.append(entry)
                        }
                        
                        let timeline = Timeline(entries: entries, policy: .atEnd)
                        completion(timeline)
                        
                    }
                }
                
                
            }
            
        }
    }
    
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let name: String
    let image: Data
    let Subs: String
    let vidoCount : String
    let configuration: ConfigurationIntent
}

struct SimpleEntry2: TimelineEntry {
    let date: Date
    let name: String
    let image: Data
    let followers: String
    let following: String
    let configuration: ConfigurationIntent
}



struct WidExtensionEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            small
        case .systemMedium:
            medium
        default:
            Text("default")
        }
    }
    
    var small: some View {
        ZStack{
            
            let bgColor = bgColour[UserDefaults.standard.getYoutubeThemeSelected()]
            let textColor = textColour[UserDefaults.standard.getYoutubeThemeSelected()]
            let thirdColor = thirdColour[UserDefaults.standard.getYoutubeThemeSelected()]
            
            Color(UIColor(hexString:bgColor)!).edgesIgnoringSafeArea(.all)
            HStack{
                VStack(alignment: .leading, spacing: 3){
                    Image(uiImage: UIImage(data: entry.image)!)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipped()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(UIColor.systemRed), lineWidth: 1.5))
                    
                    Text(entry.name)
                        .font(.system(size: 14, weight: .bold)).foregroundColor(Color(UIColor(hexString: textColor)!))
                        .padding(.top,4)
                    
                    Text(entry.Subs)
                        .font(.system(size: 20, weight: .heavy)).foregroundColor(Color(UIColor.systemRed))
                    
                    Text("Total Subscribers")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(Color(UIColor(hexString: thirdColor)!))
                    
                    Spacer()
                    
                    
                }.padding([.top,.leading],15)
                
                Spacer()
                
            }
            
            HStack{
                Spacer()
                VStack{
                    
                    Image(uiImage: #imageLiteral(resourceName: "youtube_small"))
                    Spacer()
                }.padding([.trailing,.top],10).layoutPriority(0)
            }
        }
    }
    
    var medium: some View {
        ZStack{
            let bgColor = bgColour[UserDefaults.standard.getYoutubeThemeSelected()]
            let textColor = textColour[UserDefaults.standard.getYoutubeThemeSelected()]
            let thirdColor = thirdColour[UserDefaults.standard.getYoutubeThemeSelected()]
            
            Color(UIColor(hexString:bgColor)!).edgesIgnoringSafeArea(.all)
            HStack{
                VStack(alignment: .leading, spacing: 3){
                    Image(uiImage: UIImage(data: entry.image)!)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.red, lineWidth: 1.5))
                    
                    
                }.padding(15)
                
                VStack(alignment: .leading, spacing: 5){
                    Spacer()
                    
                    Text(entry.name)
                        .font(.system(size: 16, weight: .bold)).foregroundColor(Color(UIColor(hexString: textColor)!))
                        .padding(.top,4)
                    
                    
                    Text("Subs - " + entry.Subs)
                        .font(.system(size: 19, weight: .heavy)).foregroundColor(Color(UIColor.systemRed))
                    
                    Text("Total Videos - " + entry.vidoCount)
                        .font(.system(size: 13, weight: .medium)).foregroundColor(Color(UIColor(hexString: thirdColor)!))
                    
                    Spacer()
                }
                Spacer()
            }
            
            HStack{
                Spacer()
                VStack{
                    
                    Image(uiImage: #imageLiteral(resourceName: "youtube_small"))
                    Spacer()
                }.padding([.trailing,.top],10).layoutPriority(0)
            }
        }
    }
}

struct WidExtensionEntryViewTwitter : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider2.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            smallTwitter
        case .systemMedium:
            mediumTwitter
        default:
            Text("default")
        }
    }
    
    var smallTwitter: some View {
        ZStack{
            
            let bgColor = bgColour[UserDefaults.standard.getTwitterThemeSelected()]
            let textColor = textColour[UserDefaults.standard.getTwitterThemeSelected()]
            let thirdColor = thirdColour[UserDefaults.standard.getTwitterThemeSelected()]
            
            Color(UIColor(hexString:bgColor)!).edgesIgnoringSafeArea(.all)
            HStack{
                VStack(alignment: .leading, spacing: 3){
                    Image(uiImage: UIImage(data: entry.image)!)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipped()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(TwitterBlue), lineWidth: 1.5))
                    
                    Text(entry.name)
                        .font(.system(size: 16, weight: .bold)).foregroundColor(Color(UIColor(hexString: textColor)!))
                        .padding(.top,4)
                    
                    
                    Text(entry.followers)
                        .font(.system(size: 20, weight: .heavy)).foregroundColor(Color(TwitterBlue))
                    
                    Text("Total Followers")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(Color(UIColor(hexString: thirdColor)!))
                    
                    
                    Spacer()
                    
                    
                }.padding([.top,.leading],15)
                
                Spacer()
                
            }
            
            HStack{
                Spacer()
                VStack{
                    
                    Image(uiImage: #imageLiteral(resourceName: "twitter_small"))
                    Spacer()
                }.padding([.trailing,.top],10).layoutPriority(0)
            }
        }
    }
    
    var mediumTwitter: some View {
        ZStack{
            
            let bgColor = bgColour[UserDefaults.standard.getTwitterThemeSelected()]
            let textColor = textColour[UserDefaults.standard.getTwitterThemeSelected()]
            let thirdColor = thirdColour[UserDefaults.standard.getTwitterThemeSelected()]
            
            Color(UIColor(hexString:bgColor)!).edgesIgnoringSafeArea(.all)
            HStack{
                VStack(alignment: .leading, spacing: 3){
                    Image(uiImage: UIImage(data: entry.image)!)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipped()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(TwitterBlue), lineWidth: 1.5))
                    
                    
                }.padding()
                
                VStack(alignment: .leading, spacing: 5){
                    Spacer()
                    
                    Text(entry.name)
                        .font(.system(size: 16, weight: .bold)).foregroundColor(Color(UIColor(hexString: textColor)!))
                        .padding(.top,4)
                    
                    Text("Follow - " + entry.followers)
                        .font(.system(size: 18, weight: .heavy)).foregroundColor(Color(TwitterBlue))
                    
                    Text("Following - " + entry.following)
                        .font(.system(size: 13, weight: .medium)).foregroundColor(Color(UIColor(hexString: thirdColor)!))
                    Spacer()
                }
                Spacer()
            }
            
            HStack{
                Spacer()
                VStack{
                    
                    Image(uiImage: #imageLiteral(resourceName: "twitter_small"))
                    Spacer()
                }.padding([.trailing,.top],10).layoutPriority(0)
            }
        }
    }
}

@main
struct WidgetsBudle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        WidExtension()
        WidExtension2()
    }
}

struct WidExtension: Widget {
    let kind: String = "WidExtension"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidExtensionEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall,.systemMedium])
        .configurationDisplayName("Add Youtube Widget")
        .description("Add Youtube Widget to Homescreen")
    }
}


struct WidExtension2: Widget {
    let kind: String = "WidExtension2"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider2()) { entry in
            WidExtensionEntryViewTwitter(entry: entry)
        }
        .supportedFamilies([.systemSmall,.systemMedium])
        .configurationDisplayName("Add Twitter Widget")
        .description("Add Twitter Widget to Homescreen")
    }
}




struct WidExtension_Previews: PreviewProvider {
    static var previews: some View {
        WidExtensionEntryView(entry: SimpleEntry(date: Date(),name: "Pewdiepie",image:  ImageData!, Subs: sub, vidoCount: videoCount, configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}







