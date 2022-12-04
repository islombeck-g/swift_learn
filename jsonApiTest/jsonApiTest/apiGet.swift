//
//  apiGet.swift
//  jsonApiTest
//
//  Created by Islombek Gofurov on 04.12.2022.
//

import Foundation
struct ApiGet: Codable  {
    var login: String
       var id: Int
       var node_id: String
       var avatar_url: URL
       var url: URL
       var html_url: URL
       var followers_url: URL
       var following_url: URL
       var gists_url:URL
       var starred_url:URL
       var subscriptions_url: URL
       var organizations_url: URL
       var repos_url: URL
       var events_url: URL
       var received_events_url: URL
       var type: String
       var site_admin: Bool
       var name: String
       var company: String
       var blog: String
       var location: String
       var email: String
       var hireable: String
       var bio: String
       var twitter_username: String
       var public_repos: Int
       var public_gists: Int
       var followers: Int
       var following: Int
       //var created_at: //"2022-02-15T13:01:58Z"
       //var updated_at: //"2022-11-09T16:04:08Z"
}
