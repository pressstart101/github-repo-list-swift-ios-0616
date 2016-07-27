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
    


//    if let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=f8511bf5329b271e0fa7&client_secret=f160d033f092a2c338d86d65d2553c5fcf01756e")
//    let session1 = NSURLSession.sharedSession()
//    session.dataTaskWithURL
//    completion(tempArray)
    
    //    class func getRepositoriesWithCompletion(completion: (NSDictionary)->()){

    //                print("blah")
    //            print("\(data)blah")
    
    
    
//    class func getUserInfo(completionHandler: (NSDictionary)->()) {
//        
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//        
//        if let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=\(githubClientID)&client_secret=\(githubClientSecret)") {
//            
//            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: {
//                (data, response, error) in
//                if let data = data {
//                    do {
//                        let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
//                        
//                        NSOperationQueue.mainQueue().addOperationWithBlock({
//                            completionHandler(responseData)
//                            
//                        })
//                        
//                    } catch {
//                        print("Fail!")
//                    }
//                    
//                }
//                
//            })
//            githubTask.resume()
//            
//        }
//    }
    
}

