
public class TutorialPageViewController: UIPageViewController {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = []
    
    private var pageControl = UIPageControl()
    
    private var counter = 0
    
    // Controllable variable for users. An array which contains all the storyboard ids
    // of the viewControllers to be rendered
    public var controllerStoryboardIds: [String] = []{
        didSet{
            newColoredViewController(controllerStoryboardIds)
            // class method by pageViewController: set up the viewControllers we wanna page through
            if let firstViewController = orderedViewControllers.first {
                setViewControllers([firstViewController],
                    direction: .Forward,
                    animated: false,
                    completion: nil)
            }
            
            pageControl.numberOfPages = orderedViewControllers.count
        }
    }
    
    // whether pageLooping is available
    public var enablePageLooping: Bool = false
    
    public var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            setViewControllers([orderedViewControllers[currentPage]], direction: .Forward, animated: false, completion: nil)
            counter = pageControl.currentPage
        }
    }
    
    public var pageControlIsHidden = false {
        didSet{
            pageControl.hidden = pageControlIsHidden
        }
    }
    
    public var pageControlXPosition:CGFloat?{
        didSet{
            pageControl.frame = CGRect(x: pageControlXPosition!, y: pageControl.frame.origin.y, width: pageControl.frame.width, height: pageControl.frame.height)
        }
    }
    
    public var pageControlYPosition:CGFloat?{
        didSet{
            pageControl.frame = CGRect(x: pageControl.frame.origin.x, y: pageControlYPosition!, width: pageControl.frame.width, height: pageControl.frame.height)
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        let pageControlHeight: CGFloat = 50
        pageControl.frame = CGRect(x: 0, y: CGRectGetHeight(view.frame) - pageControlHeight, width: CGRectGetWidth(view.frame), height: pageControlHeight)
        
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = currentPage
        pageControl.addTarget(self, action: "didTapPageControl:", forControlEvents: .TouchUpInside)
        
        counter = pageControl.currentPage
        
        view.addSubview(pageControl)
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Bring the pageControl to front so that its background color is transparent
        for subView in self.view.subviews as! [UIView] {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            } else if subView is UIPageControl {
                self.view.bringSubviewToFront(subView)
            }
        }
    }
    
    // MARK: - Helper Methods:
    private func newColoredViewController(ViewControllerNames: [String]) -> [UIViewController] {
        
        for viewControllerStoryBoardId in ViewControllerNames{
            
            orderedViewControllers.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(viewControllerStoryBoardId)"))
        }
        
        return orderedViewControllers
    }
    
    private func didTapPageControl(pageControl: UIPageControl){
        
        counter++
        
        if let currentViewController = viewControllers?[0]{
            let currentPageIndex = orderedViewControllers.indexOf(currentViewController)
            var upcomingTutorialPage = pageControl.currentPage
            
            let direction:UIPageViewControllerNavigationDirection = (currentPageIndex < upcomingTutorialPage) ? .Forward : .Reverse
            
            if counter >= orderedViewControllers.count {
                pageControl.currentPage = 0
                upcomingTutorialPage = 0
                counter = 0
            }
            
            setViewControllers([orderedViewControllers[upcomingTutorialPage]], direction: direction, animated: true, completion: nil)
        }
    }
}

// MARK: UIPageViewControllerDataSource

extension TutorialPageViewController: UIPageViewControllerDataSource {
    
    // protocal function: render previous page
    public func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return nil
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }
    
    // protocal function: render later page
    public func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            guard orderedViewControllersCount != nextIndex else {
                
                if enablePageLooping{
                    
                    return orderedViewControllers.first
                    
                }else{
                    return nil
                }
                
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
            
    }
    
    //    // protocal function: render page control
    //    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    //        return orderedViewControllers.count
    //    }
    //
    //    // protocal function: determine the current page
    //    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    //        guard let currentViewController = viewControllers?.first,
    //            currentViewControllerIndex = orderedViewControllers.indexOf(currentViewController) else {
    //                return 0
    //        }
    //
    //        return currentViewControllerIndex
    //    }
}

extension TutorialPageViewController:UIPageViewControllerDelegate{
    
    public func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed{
            
            guard let currentViewController = pageViewController.viewControllers?[0],
                currentViewControllerIndex = orderedViewControllers.indexOf(currentViewController) else{
                    fatalError("No controller to be rendered")
            }
            pageControl.currentPage = currentViewControllerIndex
            counter = pageControl.currentPage
        }
    }
}
