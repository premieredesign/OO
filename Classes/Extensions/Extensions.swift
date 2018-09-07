//
//  Extensions.swift
//  OO
//
//  Created by Clinton Johnson on 9/7/18.
//

import Foundation
import UIKit

// Extension for adding color RGB
public extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}


// Extension for Adding Blur effect underneath a view
public extension UIViewController {
    public func addingBlurEffect(beneath uView: UIView, style: String) {
        if (style == "dark") {
             let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
             let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            blurEffectView.frame = CGRect(x: 0, y: uView.frame.origin.y, width: uView.frame.width, height: uView.frame.height)
            blurEffectView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
            
            uView.insertSubview(blurEffectView, aboveSubview: uView)
        }
        if (style == "light") {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            blurEffectView.frame = CGRect(x: 0, y: uView.frame.origin.y, width: uView.frame.width, height: uView.frame.height)
            blurEffectView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
            
            uView.insertSubview(blurEffectView, aboveSubview: uView)
        }
    }
}

// Extension for UIview
public extension UIView {
    // Simple add constraints using Visual Format
    public func layItOutVisually(with format: String, forViews: UIView...) {
        var dictionary = [String: UIView]()
        /*
         Create Dictionary Object to {key: value}
        */
        for (index, view) in forViews.enumerated() {
            let key = "LIOV\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            dictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: dictionary))
    }
    
    // Simply add constraints method
    @available(iOS 9.0, *)
    public func plant(leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, paddingLeft: CGFloat?, paddingRight: CGFloat?, paddingTop: CGFloat?, paddingBottom: CGFloat?, width: CGFloat?, height: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            topAnchor.constraint(equalTo: top!, constant: paddingTop ?? 0),
            bottomAnchor.constraint(equalTo: bottom!, constant: -paddingBottom!),
            leadingAnchor.constraint(equalTo: leading!, constant: paddingLeft ?? 0),
            trailingAnchor.constraint(equalTo: trailing!, constant: -paddingRight!)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


// Extension for ImageView
public let imageCache = NSCache<AnyObject, AnyObject>()

public class CustomImageView: UIImageView {
    
    public var imageUrlString: String?
    
    public func downloaderFrom(url: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        
        guard let urlString = URL(string: url) else {return}
        
        imageUrlString = url
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: urlString) { (data, res, err) in
            guard
                let httpUrlRes = res as? HTTPURLResponse, httpUrlRes.statusCode == 200,
                let mimeType = res?.mimeType, mimeType.hasPrefix("image"),
                let data = data, err == nil,
                let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async {
                let imageToCache = image
                
                if self.imageUrlString == url {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
            }
            }.resume()
    }
    public func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        downloaderFrom(url: link, contentMode: mode)
    }
}


// Extension for Tab Bar controller

