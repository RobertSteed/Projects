//
//  ViewController.swift
//  ISpy
//
//  Created by Robert Steed on 10/20/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateZoomFor(size: view.bounds.size)
    }
    
    func updateZoomFor(size: CGSize) {
        let width = size.width / imageView.bounds.width
        let height = size.height / imageView.bounds.height
        let scale = min(width, height)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
    }


}

