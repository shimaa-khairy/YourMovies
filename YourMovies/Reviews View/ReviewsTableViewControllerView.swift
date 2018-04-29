//
//  ReviewsTableViewController.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/27/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit

class ReviewsTableViewControllerView: UITableViewController {

/*    let reviewTitles = ["rew1", "rew2", "rew3","rew4"]
    let reviewContent = ["zsxdcfvg bhnjxdcfvg bhnjdcfvg bhnjdcfvgbhn jdcf vgbhn gvbhnjmkcfvgbhnj", "zsxdcfvg bhnjxdcfvg bhnjdcfvg bhnjdcfvgbhn jdcf vgbhn gvbhnjmkcfvgbhnj", "zsxdcfvg bhnjxdcfvg bhnjdcfvg bhnjdcfvgbhn jdcf vgbhn gvbhnjmkcfvgbhnj","zsxdcfvg bhnjxdcfvg bhnjdcfvg bhnjdcfvgbhn jdcf vgbhn gvbhnjmkcfvgbhnj"]
*/
    var displayedMovieId: Int?
    var mReviews = [Review]()
    var mPresenter : ReviewsTableViewControllerPresenterProctol?
    override func viewDidLoad() {
        super.viewDidLoad()

        mPresenter = ReviewsTableViewContollerpresenter(view: self)
        mPresenter?.getAllReviews(movieId: displayedMovieId!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        self.navigationItem.title = "Reviews"
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mReviews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReviewTableViewCell
        //var reviewTitle = cell.viewWithTag(1) as! UILabel
        //var reviewBody = cell.viewWithTag(2) as! UITextView
        // Configure the cell...
        let reviewDisplayed = mReviews[indexPath.row]
        cell.reviewAuthor.text = reviewDisplayed.author
        cell.reviewContent.text = reviewDisplayed.content
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
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

extension ReviewsTableViewControllerView : ReviewsTableControllerViewProctol{
    func fillAllReviews(reviews : [Review]){
        //Add to list of reviews then reload table
        mReviews.removeAll()
        mReviews.append(contentsOf: reviews)
        self.tableView.reloadData()
    }
    
    
}
