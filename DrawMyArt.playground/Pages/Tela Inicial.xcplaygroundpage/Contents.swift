//: #                    DrawMyArt

import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "orange juice", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

//for family in UIFont.familyNames.sorted(){
//        let names = UIFont.fontNames(forFamilyName: family)
//        print("Family: \(family) Font names:\(names)")
//    }


// Present the view controller in the Live View window
let viewPrincipal = ViewPrincipal(screenType: .ipadPro12_9, isPortrait: false)
let viewInicial = ViewInicial(screenType: .ipadPro12_9, isPortrait: false)
let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: false)
navigation.navigationBar.isHidden = true
navigation.pushViewController(viewInicial, animated: true)
//let vc = MyViewController(screenType: .ipadPro12_9, isPortrait: false)
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)

