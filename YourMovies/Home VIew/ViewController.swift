//
//  ViewController.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/15/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tabsSegmentation: UISegmentedControl!
    @IBOutlet weak var noMoviesLabel: UILabel!
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!

    var isPop = true //Most popular flag
    var isOnPage = 1 //All Movies
    let reuseIdentifier = "CellIdentifer"
    let collectionViewHeight = 567
    var cellsNumber : Int? = 0
    var button : UIButton?
    var listOfMovies : [Movie]? = []
    var mPresenter  : ViewControllerPresenterProtocol?
    //var typeDisplayed = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        mPresenter = ViewControllerPresenter(view: self)
        //check the user prefs for the state it's wanted to display
        //let buttonImage = resizeImage(image: UIImage(named:"popular_ic.png")!, newWidth: 20)
        //changeTypeMenuBtn.image = buttonImage?.withRenderingMode(.alwaysOriginal)
        button = UIButton(type: .system)
        let buttonImage = resizeImage(image: UIImage(named:"popular_ic.png")!, newWidth: 20)
        button?.setImage(buttonImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        button?.setTitle("Most Popular", for: .normal)
        button?.addTarget(self, action: #selector(changeTypeOfMoviesList), for: .touchUpInside)
        button?.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button!)
        mPresenter?.getMostPopulerMovies()
        //makeTempMovies()
    }

    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    @objc func changeTypeOfMoviesList() {
        var buttonImage : UIImage?
        //switch it to the real user prefs
        if(!isPop){
            buttonImage = resizeImage(image: UIImage(named:"popular_ic.png")!, newWidth: 20)
            button?.setTitle("Most Popular", for: .normal)
            isPop = true
            mPresenter?.getMostPopulerMovies()
        }else{
            buttonImage = resizeImage(image: UIImage(named:"top_rated_ic.png")!, newWidth: 20)
            button?.setTitle("Top Rated", for: .normal)
            isPop = false
            mPresenter?.getTopRatedMovies()
        }
        
        button?.setImage(buttonImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeTempMovies() {
        for index in 0...5 {
            let movie = Movie()
            movie.id = index
            movie.isFavorite = true
            movie.overview = "When the creator of a virtual reality world called the OASIS dies, he releases a video in which he challenges all OASIS users to find his Easter Egg, which will give the finder his fortune."
            movie.poster_path = "https://marketplace.canva.com/MACFQTmLl08/2/0/thumbnail_large/canva-tiger-minimalist-movie-poster-MACFQTmLl08.jpg"
            movie.release_date = "201\(index)"
            movie.title = "Title \(index)"
            movie.vote_average = Float(index) * 1.5
            
            listOfMovies?.append(movie)
        }
        
        cellsNumber = listOfMovies?.count
    
    }
    @IBAction func tabsOnValueChange(_ sender: Any) {
        
        //remember to change the data to the returned list from the network or db
        switch tabsSegmentation.selectedSegmentIndex
        {
        case 0:
            
            // set the height constraint to 0
            /*let heightConstraint = NSLayoutConstraint(item: moviesCollectionView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(collectionViewHeight))
            moviesCollectionView.addConstraint(heightConstraint)*/
            
            //noMoviesLabel.text = "";
            //cellsNumber = (listOfMovies?.count)!
            //moviesCollectionView.reloadData();
            //makes sure that the type is popular
            var buttonImage : UIImage?
            buttonImage = resizeImage(image: UIImage(named:"popular_ic.png")!, newWidth: 20)
            button?.setTitle("Most Popular", for: .normal)
            isPop = true
            button?.setImage(buttonImage?.withRenderingMode(.alwaysOriginal), for: .normal)

            isOnPage = 1
            mPresenter?.getMostPopulerMovies()
            break
        case 1:
            
            isOnPage = 2
            mPresenter?.getAllFavoriteMovies()
            
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

    override func viewWillAppear(_ animated: Bool) {
        if(isOnPage == 2){
            mPresenter?.getAllFavoriteMovies()
        }
    }

//UICollectionViewDatasource methods
func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
    return 1
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return cellsNumber!
}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as UICollectionViewCell

        let moviePosterView : UIImageView = cell.viewWithTag(1) as! UIImageView
        let movieTitle : UILabel = cell.viewWithTag(2) as! UILabel
        
        movieTitle.text = listOfMovies![indexPath.row].title
        let posterUrl = "https://image.tmdb.org/t/p/w500/\(listOfMovies![indexPath.row].poster_path)"
        moviePosterView.sd_setImage(with: URL(string: posterUrl), placeholderImage: UIImage(named: "image_placeholder.png"))

    return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie : Movie = listOfMovies![indexPath.row]
        
        let detailController  = self.storyboard?.instantiateViewController(withIdentifier: "temp") as! DetailsViewController
        
        detailController.movieDisplayed = selectedMovie
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ViewController : ViewControllerView{
    func updateMoviesList(movies: [Movie]) {
        listOfMovies?.removeAll()
        listOfMovies?.append(contentsOf: movies)
        cellsNumber = listOfMovies?.count
        
        moviesCollectionView.reloadData()
    }
    
    func noMoviesFound() {
        cellsNumber = 0
        noMoviesLabel.text = "No Movies In Favorites."

    }
    
    
}



