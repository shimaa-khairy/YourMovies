//
//  DetailsViewControllerTableViewController.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit

class DetailsViewController:UITableViewController {
    
    public var movieDisplayed : Movie?
    let delegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var trailersCollectionView: UICollectionView!
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleTextView: UILabel!
    
    @IBOutlet weak var isMoviewFavoriteButton: UIButton!
    
    @IBOutlet weak var movieRealseDateTextView: UILabel!
    
    @IBOutlet weak var movieRateTextView: UILabel!
    
    @IBOutlet weak var movieOverviewTextView: UITextView!
    
    //@IBOutlet weak var reviewsTableViewOutlet: UITableView!
    var trailers: [Trailer] = [] //= ["first","second","third","fourth","fifth"]
    let reuseIdentifier = "CollectionCellIdentifer"
    var mPresenter  : DetailsViewControllerPresenterProtocol?
    
    var isInternetAvailable = false
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Details"
        mPresenter = DetailsViewControllerPresenter(view: self)
        //Check internet connection
        if(delegate.isInternetAvailable)!{
            self.mPresenter?.getTrailers(movieId: (self.movieDisplayed?.id)!)
            self.isInternetAvailable = true
            self.tableView.reloadData()
        }else{
            print("No connection")
        }
        //Setup the trailers collection
        self.navigationController?.title = "Details"
        trailersCollectionView.delegate = self
        trailersCollectionView.dataSource = self

        
        //Adds the rate with colors to the view
        addMovieRate()
        movieTitleTextView.text = movieDisplayed?.title
        movieOverviewTextView.text = movieDisplayed?.overview
        movieRealseDateTextView.text = movieDisplayed?.release_date
        let posterUrl : String! = "https://image.tmdb.org/t/p/w500/\(movieDisplayed!.poster_path)"
        
        if(mPresenter?.isFavorite(movieId: (movieDisplayed?.id)!) != true){
            isMoviewFavoriteButton.setImage(UIImage(named:"favorites_ic.png"), for: UIControlState.normal)

        }else{
            isMoviewFavoriteButton.setImage(UIImage(named:"favoritesFill_ic.png"), for: UIControlState.normal)
        }
        
        moviePosterImageView.sd_setImage(with: URL(string: posterUrl), placeholderImage: UIImage(named: "temp_image.jpg"))
    }
    
    @IBAction func openReviewsPage(_ sender: Any) {
        let reviewController  = self.storyboard?.instantiateViewController(withIdentifier: "reviewsView") as! ReviewsTableViewControllerView
        reviewController.displayedMovieId = movieDisplayed?.id
        //detailController.movieDisplayed = selectedMovie
        
        self.navigationController?.pushViewController(reviewController, animated: true)
    }
    func addMovieRate() {
        movieRateTextView.text = String(movieDisplayed!.vote_average)
        movieRateTextView.backgroundColor = movieDisplayed!.vote_average > 5 ?
            UIColor(red:0.95, green:0.77, blue:0.06, alpha:1.0) :
            UIColor(red:0.15, green:0.68, blue:0.38, alpha:1.0)
        movieRateTextView.textColor = movieDisplayed!.vote_average > 5 ?
            UIColor.black :
            UIColor.white

    }
    
    func playInYoutube(youtubeId: String) {
        if let youtubeURL = URL(string: "youtube://\(youtubeId)"),
            UIApplication.shared.canOpenURL(youtubeURL) {
            // redirect to app
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(youtubeId)") {
            // redirect through safari
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func addToFavoriteAction(_ sender: UIButton) {
        //Use the movie isFav bool next
        if(!(mPresenter?.isFavorite(movieId: (movieDisplayed?.id)!))!){
        sender.setImage(UIImage(named:"favoritesFill_ic.png"), for: UIControlState.normal)
            //self.addToFavorite()
            mPresenter?.addToFavorite(movie: movieDisplayed!)
    }else{
        sender.setImage(UIImage(named:"favorites_ic.png"), for: UIControlState.normal)
            //self.removeFromFavorite()
            mPresenter?.removeFromFavorite(movie: (movieDisplayed?.id)!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = super.tableView(tableView, numberOfRowsInSection: section)
        if !isInternetAvailable {
            // remove the last cell
            return count - 2
        }
        return count
    }
    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reviewTitles.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseReviewId, for: indexPath) as! ReviewTableViewCell
        //var reviewTitle = cell.viewWithTag(1) as! UILabel
        //var reviewBody = cell.viewWithTag(2) as! UITextView
        // Configure the cell...
        cell.reviewAuthor.text = reviewTitles[indexPath.row]
        cell.reviewContent.text = reviewContent[indexPath.row]
        
        return cell
    }
    
*/
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TrailerCollectionViewCell
        
        //let movieTrailerImage : UIImageView = cell.viewWithTag(1) as! UIImageView
        //let movieTrailerTitle : UILabel = cell.viewWithTag(2) as! UILabel
        let trailerDisplayed = trailers[indexPath.row]
        cell.trailerTitle.text = trailerDisplayed.name
        let trailerKey = trailerDisplayed.key
        let trialerURL = "https://img.youtube.com/vi/\(trailerKey)/sddefault.jpg"
        cell.trailerImage.sd_setImage(with: URL(string: trialerURL), placeholderImage: UIImage(named: "temp_image.jpg"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playInYoutube(youtubeId: trailers[indexPath.row].key)
    }
    
    
    
    
}
extension DetailsViewController : DetailsViewControllerView{
    func addToFavorite() {
        
    }
    
    func removeFromFavorite() {
        
    }
    func fillTrailers(trailersList: [Trailer]){
        trailers.removeAll()
        trailers.append(contentsOf: trailersList)
        trailersCollectionView.reloadData()
    }

}
