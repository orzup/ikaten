import UIKit

class SelectViewController: UITableViewController {
    var selectedIndexPath: NSIndexPath!
    var collection: DataCollection!

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("selectTableCell", forIndexPath: indexPath)

        cell.textLabel!.text = collection.nameAtIndex(indexPath.row)

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewControllers = self.navigationController?.viewControllers
        let previousViewController = viewControllers![viewControllers!.count - 2] as! PreparationViewController
        let cell = previousViewController.tableView.cellForRowAtIndexPath(selectedIndexPath)

        cell!.detailTextLabel?.text = collection.dataAtIndex(indexPath.row).name
        self.navigationController?.popViewControllerAnimated(true)
    }
}
