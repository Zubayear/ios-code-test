import Foundation

struct Custom {
    var avatar: String
    var fullname: String
    var primaryTeam: String
    var title: String
    var photo: String
    var caption: String
    
    init(avatar: String, fullname: String, primaryTeam: String, title: String, photo: String, caption: String) {
        self.fullname = fullname
        self.primaryTeam = primaryTeam
        self.title = title
        self.caption = caption
        self.avatar = avatar
        self.photo = photo
    }
}
