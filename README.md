# Customizing Your App's Navigation Bar

Create custom titles, prompts, and buttons in your app’s navigation bar.

## Overview

`UINavigationBar` enables you to display your app's navigational controls in a bar along the top of the iOS device's screen. You can use it to design a distinctive navigation bar that matches your app’s design and creates intuitive interaction for your users.

This sample code project demonstrates how to use `UINavigationController` and `UIViewController` classes as building blocks in your application's user interface.

The project walks you through a set of examples that customize  the look and behavior of [`UINavigationController`](https://developer.apple.com/documentation/uikit/uinavigationcontroller) and [`UINavigationBar`](https://developer.apple.com/documentation/uikit/uinavigationbar), including views, prompts, buttons and titles of your applications navigation bar.

The sample code demonstrates different ways to modify the navigation bar directly using the appearance proxy, and indirectly by modifying the view controller's [`UINavigationItem`](https://developer.apple.com/documentation/uikit/uinavigationitem). Among the levels of customization are varying bar styles, and applying custom left and right buttons known as [`UIBarButtonItems`](https://developer.apple.com/documentation/uikit/uibarbuttonitem).

## Change the Bar Style

You can change the bar style to match the overall appearance of your app's design.

Tap the "Style" button to the left of the main page to change the navigation bar's style or [`UIBarStyle.`](https://developer.apple.com/documentation/uikit/uibarstyle). This button takes you to an action sheet where you can change the background's appearance to default, black-opaque, or black-translucent.

To change the bar style to black-translucent:

``` swift
self.navigationController!.navigationBar.barStyle = .black
self.navigationController!.navigationBar.isTranslucent = true
self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)
```
[View in Source](x-source-tag://BarStyleExample)

NOTE: A navigation controller determines its [`preferredStatusBarStyle`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621416-preferredstatusbarstyle) based on the navigation bar style. As a result, the status bar matches the bar style, without any extra code required.

## Customize the Right View

You can apply a custom `UIView` to the right side of the navigation bar instead of using a `UIBarButtonItem`.

This part of the sample demonstrates placing three kinds of `UIBarButtonItems` on the right side of the navigation bar: a button with a title, a button with an image, and a button with a `UISegmentedControl`. An additional segmented control allows the user to toggle between the three. The initial bar button is defined in the storyboard, by dragging a `UIBarButtonItem` out of the object library and into the navigation bar.  It also shows how to create and add each button type using code.

This code shows how to set a segmented control as the right bar button item:

``` swift
let segmentBarItem = UIBarButtonItem(customView: segmentedControl)
navigationItem.rightBarButtonItem = segmentBarItem
```
[View in Source](x-source-tag://CustomRightViewExample)

## Customize the Title View

You also can configure the navigation bar to use a `UIView` as the title, using `UISegmentedControl` as the custom title view (center).

This code shows how to set a segmented control as the title view:

``` swift
self.navigationItem.titleView = segmentedControl
```
[View in Source](x-source-tag://CustomTitleViewExample)

## Modify the Navigation Prompt

You can provide a prompt or single line of text to the top of the navigation bar.

This part of the sample demonstrates how to use the [`prompt`](https://developer.apple.com/documentation/uikit/uinavigationitem/1624930-prompt) property of a `UINavigationItem` to display a custom line of text above the navigation bar.

Here's how to set the navigation item's prompt:

``` swift
navigationItem.prompt = "Navigation prompts appear at the top."
```
[View in Source](x-source-tag://PromptExample)

## Customize Appearance

You can apply a custom background to a `UINavigationBar` by adding a bar tint color or background image.

Here's how to set the background image of a navigation bar:

``` swift
let navigationBarAppearance = self.navigationController!.navigationBar
navigationBarAppearance.setBackgroundImage(backImageForDefaultBarMetrics, for: .default)
navigationBarAppearance.setBackgroundImage(backImageForLandscapePhoneBarMetrics, for: .compact)
```
[View in Source](x-source-tag://BackgroundImageExample)

## Customize the Back Button

In addition, you can use an image as the back button without any back button text and without the back arrow that normally appears next to the back button, like so:

``` swift
var backButtonBackgroundImage = #imageLiteral(resourceName: "Menu")

backButtonBackgroundImage =
    backButtonBackgroundImage.resizableImage(withCapInsets:
        UIEdgeInsets(top: 0, left: backButtonBackgroundImage.size.width - 1, bottom: 0, right: 0))

let barAppearance =
    UINavigationBar.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
barAppearance.backIndicatorImage = backButtonBackgroundImage
barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage

// Provide an empty backBarButton to hide the 'Back' text present by default in the back button.
let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
navigationItem.backBarButtonItem = backBarButtton
```
[View in Source](x-source-tag://BackImageButtonExample)

## Modify Your Large Title

Another option for customizing your navigation bar includes setting its title at a larger size, thus increasing the size of the `UINavigationBar`. For more information, refer to the `LargeTitleViewController` source file.

The code below shows how to set the background image of a navigation bar:

``` swift
if #available(iOS 11.0, *) {
	self.navigationController?.navigationBar.prefersLargeTitles = true
}
```
[View in Source](x-source-tag://LargeTitleExample)
