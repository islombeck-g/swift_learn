//
//  Jobs.swift
//  authApi
//
//  Created by Islombek Gofurov on 27.02.2023.
//

import Foundation


struct Jobs:Identifiable, Hashable{
    var id: String
    var companyName:String
    var employmentType:String
    var experiences:Int
    var industryOfCompany:String
    var jobName:String
    var location:String
    var photo:String
    var salary:Int
    var about:String
    var skills:[String]
    
    
}





