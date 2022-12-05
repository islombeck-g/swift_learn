
import Foundation
struct ApiGet: Codable  {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let url: String
    let html_url: String
    let followers_url: String
    let following_url: String
    let gists_url:String
    let starred_url:String
    let subscriptions_url: String
    let organizations_url: String
    let repos_url: String
    let events_url: String
    let received_events_url: String
    let type: String
    let site_admin: Bool
    let name: String
    let company: String
    let blog: String
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String
    let twitter_username: String?
    let public_repos: Int
    let public_gists: Int
    let followers: Int
    let following: Int
    //var created_at: //"2022-02-15T13:01:58Z"
    //var updated_at: //"2022-11-09T16:04:08Z"
}
