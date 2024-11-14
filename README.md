### Steps to Run the App

Open the demo_fetch.xcodeproj file with XCode and run the demo_fetch target against any simulator. By default the app is pointing to All Recipes url. You can change the url to test the Malformed Data and Empty Data urls in the /Utils/DownloadUtils.swift file. On line 28, change the url Constants.API.allRecipesUrl to Constants.API.malformedDataUrl or Constants.API.emptyDataUrl.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I prioritized architecture in this app. The foundation of any high performant app is in its design and architecture. To that end, I wanted to show a good use of MVVM design pattern. Additionally I wanted to demonstrate a good use of Dependancy Injection through the Download utility. That provides for an adequate seperation of concerns and makes unit testing much easier. I also used Protocol Oriented Programming for the design of the DownloadUtils module.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent about 5 hours on the project. A fair amount of the time was spent on architecture and tweaking it to make it clean and efficient. I also spent about equal time making sure the UI was implemented according to spec, and that the edge cases were handled appropriately and according to spec.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

I wanted to spend more time on the image caching and performance. While I did end up using a library that automatically caches images after download, to make the process more performant, we should also cancel downloads on images if their cell is no longer visible. I was not able to get that part implemented and stay within the general timeline provided for the app development. I started using a different library called Kingfisher which supports download cancellation. However, the cancel method did not want to expose properly in SwiftUI. At that point I had to change libraries and focus on caching leaving cancelation unfinished.

I also wanted to spend more time on the DownloadUtils unit tests. Mocking NSURLSession is a bit time consuming and I didn't get to complete it and stay within the bounds of the time constraints.

### Weakest Part of the Project: What do you think is the weakest part of your project?

The weakest part is the UI. While it is meets the specifications, there were no additional enhancements added. The majority of the time was focused on design, architecture and functionality.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

I used the asyncImage library (https://github.com/baskurthalit/asyncImage) for displaying and caching of the images. This was easier and quicker than implementing a custom caching mechanism.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

This was a good test project, it covered a lot of the bases. I would have loved a little more time to make it perfect but it forced you to manage your time and make trade-offs, which was a part of the exam I assume. There were also some time constraints on my end so I had to tackle this project in few small sessions instead of one continuous sitting. However, that has no impact on the final product.
