import Foundation

struct Root: Codable {
    let results: Results
}

struct Results: Codable {
    let resources: [Resource]
}

struct Resource: Codable {
    let event: Event
    let owner: Owner
    let caption, video: String
    let photo: String
    let uploaded: String
}

struct Event: Codable {
    let title, startEvent, endEvent: String

    enum CodingKeys: String, CodingKey {
        case title
        case startEvent = "start_event"
        case endEvent = "end_event"
    }
}

struct Owner: Codable {
    let fullname, username: String
    let primaryTeam: PrimaryTeam
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case fullname, username
        case primaryTeam = "primary_team"
        case avatar
    }
}

enum PrimaryTeam: String, Codable {
    case manUtd = "Man Utd"
    case sheffWed = "Sheff Wed"
    case sheffieldUtd = "Sheffield Utd"
}
