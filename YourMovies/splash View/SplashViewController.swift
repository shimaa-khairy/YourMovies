//
//  SplashViewController.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/24/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logoImageVIew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.logoImageVIew.transform = CGAffineTransform(rotationAngle: CGFloat(180 * M_PI))
        }) { (succeed) -> Void in
            
            let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: "home_view")
            
            self.present(initialViewController!, animated: true, completion: nil)
             }
        */
        UIView.animate(withDuration: 2, delay: 0.0, options: .curveLinear, animations: {
            self.logoImageVIew.transform = CGAffineTransform(rotationAngle: CGFloat(90))//Double.pi
        }, completion: { finished in
            let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: "home_view")
            //home_view
            
            self.present(initialViewController!, animated: true, completion: nil)
            
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
