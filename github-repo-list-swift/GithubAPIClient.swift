//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    

    class func getRepositoriesWithCompletion(completion: (NSArray)->()){
        
        let url = NSURL(string: "\(githubURLAPI)/repositories?client_id=\(id)&client_secret=\(secret)")
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        guard let gitHubURL = url else {
            print("things went south")
            return
        }
        
        
        session.dataTaskWithURL(gitHubURL) { (data, response, error) in
            
            if let data = data {
                //let responseData = NSString(data: data, encoding: NSUTF8StringEncoding)
                do{
                    
                    if let responseData = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray {
                    //print(responseData)
                            completion(responseData!)
                    }
                    
                }
            }
            
        }.resume()
        
    }

    
}

