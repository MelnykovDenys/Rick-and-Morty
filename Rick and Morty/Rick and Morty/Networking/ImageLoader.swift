//
//  ImageLoader.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import Foundation

import UIKit

class ImageLoader {
    
    static let shared = ImageLoader()
    
    private var task: URLSessionDownloadTask?
    private var session = URLSession.shared
    private var cache: NSCache<NSString, UIImage> = NSCache()
    
    func obtainAvatarWithURL(urlImage: String, completionHandler: @escaping (UIImage) -> ()) {
        if let image = self.cache.object(forKey: urlImage as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholder = UIImage(named: "emptyAvatar") ?? UIImage()
            DispatchQueue.main.async {
                completionHandler(placeholder)
            }
            let url: URL! = URL(string: urlImage)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: urlImage as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            })
            task?.resume()
        }
    }
}

