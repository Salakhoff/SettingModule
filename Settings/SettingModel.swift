import Foundation

struct SettingModel {
    let icon: SettingIcon
    let title: String
    let isToggleShowed: Bool
}

struct SettingSectionModel {
    let title: String
    let cells: [SettingModel]
}

enum SettingIcon: String {
    case wishlist
    case download
    case darkmode
    case language
    case logout
    case privacy
}
