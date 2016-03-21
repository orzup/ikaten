import UIKit

class SelectViewController: UITableViewController {
    var selectedIndexPath: NSIndexPath!
    var collection: DataCollection!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("selectTableCell", forIndexPath: indexPath)

        cell.textLabel!.text = collection.jaTextAtIndex(indexPath.row)

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = self.navigationController?.viewControllers[1] as! PreparationViewController
        let cell = viewController.tableView.cellForRowAtIndexPath(selectedIndexPath)

        cell!.detailTextLabel?.text = collection.jaTextAtIndex(indexPath.row)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
