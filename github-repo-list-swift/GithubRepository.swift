//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: NSString
    var htmlURL: NSURL
    var repositoryID: NSString
    
    init(dictionary:NSDictionary){
        self.fullName = dictionary["full_name"] as! String
        //NSURL(string: String)
        
        
        let urlString = dictionary["html_url"] as! String
        self.htmlURL = NSURL(string: urlString)!
        //self.htmlURL = dictionary[ "html_url"] as? NSU

        self.repositoryID = (dictionary["id"]?.stringValue)!

        
    }
    
    
    
    
}
