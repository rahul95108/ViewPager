

import UIKit

class ViewController: UIViewController,ViewPagerDataSource {
    
    // MARK: - All Variables Declaration -
    
    @IBOutlet weak var viewPager: ViewPager!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var integer:Int!
    
    // MARK: - UIView Life Cycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        viewPager.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Pager Delegate Methods -
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
    }
    
    func numberOfItems(viewPager: ViewPager) -> Int {
        return 4
    }
    
    func viewAtIndex(viewPager: ViewPager, index: Int, view: UIView?) -> UIView {
        var newView = view;
        if(newView == nil){
            newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            
            let imageName = String(format: "%d", index)
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height - 52)
            
            newView?.addSubview(imageView)
        }
        let pageNumber = round(viewPager.scrollView.contentOffset.x / viewPager.scrollView.frame.size.width)
        integer = Int(pageNumber)
        self.pageControl.currentPage = Int(pageNumber)
        return newView!
    }
    
    @IBAction func btnNextAction(_ sender: Any) {
        if self.pageControl.currentPage < 3 {
            viewPager.scrollToPage(index: self.pageControl.currentPage + 2)
        }
    }
    
}

