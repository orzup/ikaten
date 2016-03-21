import UIKit
import NYSegmentedControl

class IkatenSegmentedControl : NYSegmentedControl {
    required init() {
        super.init(frame: CGRectZero)
    }

    init(items: [AnyObject], container: UIView) {
        super.init(items:items)
        container.layoutIfNeeded()

        self.frame = CGRectMake(0, 0, container.frame.width, container.frame.height)

        titleTextColor = UIColor.whiteColor()
        selectedTitleTextColor = UIColor.whiteColor()
        titleFont = UIFont(name: "ikamodoki", size: 20)
        selectedTitleFont = UIFont(name: "ikamodoki", size: 20)

        borderWidth = 1.0
        borderColor = UIColor(white: 0.0, alpha: 0.0)

        drawsGradientBackground = true
        gradientTopColor = UIColor(white: 0.31, alpha: 1.0)
        gradientBottomColor = UIColor(white: 0.31, alpha: 1.0)
        segmentIndicatorInset = 2.0
        segmentIndicatorBackgroundColor = UIColor(red: 0.18, green: 0.75, blue: 0.64, alpha: 1.0)
        segmentIndicatorAnimationDuration = 0.3
        segmentIndicatorBorderWidth = 0.0

        container.addSubview(self)
    }

    override init(frame:CGRect) {
        super.init(frame:frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
