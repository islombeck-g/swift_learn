
//https://github.com/nerdishbynature/octokit.swift


import Foundation
import OctoKit

let config = TokenConfiguration("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")
var me = [String]()
func somefunc()-> [String]{
    
    Octokit(config).user(name: "octocat") { response in
      switch response {
      case .success(let user):
          me.append("User login: \(user.login!)")
      case .failure(let error):
          print("Error: \(error)")
      }
    }
return me
}
