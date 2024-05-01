import Foundation

class SettingService {
    static let shared = SettingService()
    
    private init() {}
    
    let section: [SettingSectionModel] = [
        SettingSectionModel(title: "Media", cells: [
            SettingModel(
                icon: .wishlist,
                title: "Wishlist",
                isToggleShowed: false
            ),
            
            SettingModel(
                icon: .download,
                title: "Download",
                isToggleShowed: false
            )
        ]),
        
        SettingSectionModel(title: "Preferences", cells: [
            SettingModel(
                icon: .darkmode,
                title: "Dark Mode",
                isToggleShowed: true
            ),
            
            SettingModel(
                icon: .language,
                title: "Language",
                isToggleShowed: false
            )
        ]),
        
        SettingSectionModel(title: "Account", cells: [
            SettingModel(
                icon: .logout,
                title: "Logout",
                isToggleShowed: false
            ),
            
            SettingModel(
                icon: .privacy,
                title: "Privacy",
                isToggleShowed: false
            )
        ]),
    ]
}
