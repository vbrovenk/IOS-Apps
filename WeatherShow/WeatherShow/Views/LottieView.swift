//
//  LottieView.swift
//  WeatherShow
//
//  Created by Vadim on 13.04.2022.
//

import SwiftUI
import Lottie

// representation of animation
struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop
    
    // setting properties for Lottie animation
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView()
        return view
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.subviews.forEach({
            $0.removeFromSuperview()
        })
        
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
    }
}
