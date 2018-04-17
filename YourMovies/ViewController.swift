//
//  ViewController.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/15/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tabsSegmentation: UISegmentedControl!
    @IBOutlet weak var noMoviesLabel: UILabel!
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!

    let reuseIdentifier = "CellIdentifer"
    let collectionViewHeight = 567
    var cellsNumber = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tabsOnValueChange(_ sender: Any) {
        switch tabsSegmentation.selectedSegmentIndex
        {
        case 0:
            
            // set the height constraint to 0
            /*let heightConstraint = NSLayoutConstraint(item: moviesCollectionView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(collectionViewHeight))
            moviesCollectionView.addConstraint(heightConstraint)*/
            
            noMoviesLabel.text = "";
            cellsNumber = 10
            moviesCollectionView.reloadData();

            break
        case 1:
            
            cellsNumber = 0
            moviesCollectionView.reloadData();
            noMoviesLabel.text = "No Movies In Favorites."
            
            // set the height constraint to 0
            /*let heightConstraint = NSLayoutConstraint(item: moviesCollectionView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 0)
            */
            //moviesCollectionView.addConstraint(heightConstraint)
            
            break
        default:
            break
        }
    }
    

//UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
{
    
    return 4;
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
{
    
    return 1;
}


//UICollectionViewDatasource methods
func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
    return 1
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return cellsNumber
}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as UICollectionViewCell

    return cell
}

}

extension ViewController : ViewControllerView{
    func updateMoviesList(movies: [Movie]) {
        <#code#>
    }
    
    func noMoviesFound() {
        <#code#>
    }
    
    
}



