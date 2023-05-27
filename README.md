# Flutter Implementation of AirBnb UI Interaction

Flutter implementation of the Airbnb book flip UI

### Preview

https://github.com/Roaa94/flutter_airbnb_ui/assets/50345358/c5a7103d-ed64-4053-814b-3220b92db170


### Implementation Details:

The 3D-like book flip animation is implemented with Transform widgets for 3D rotation, and a Stack that conditionally shows the side of the book cover that should be visible on top as the rotation reaches halfway.

<img width="300" src="https://github.com/Roaa94/flutter_airbnb_ui/assets/50345358/4847cfc5-657e-4649-8829-2d5b473c9950"/>


```dart
// book_flip.dart
Transform(
  transform: Matrix4.identity()
    ..setEntry(3, 2, 0.001)
    ..rotateY(-pi * _flipAnimation.value),
  alignment: Alignment.centerRight,
  child: Stack(
    children: [
      // Show the book cover front when the rotation is halfway
      _flipAnimation.value >= 0.5 
          ? Positioned.fill(
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(-pi),
                alignment: Alignment.center,
                child: BookCoverFront(listingData),
              ),
            ) 
      : Positioned.fill(
          child: BookCoverBack(listingData),
        ),
    ],
  ),
)
```

The trick to make the Hero animation work is using that same widget in 3 places, the first in the initial page, the second is the next page, with the animation controller initially set to it’s end value of 1, and finally, the animated widget is returned from the `flightShuttleBuilder` param of the Hero widget, and uses its animation value to run the book flip animation.

```dart
// List page
Hero(
  tag: 'listing_hero_${listingData.id}',
  flightShuttleBuilder: (_, Animation<double> animation, __, ___, ____) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.45, end: 1).animate(animation),
      child: BookFlip( // 3️⃣
        listingData,
        animationController: animation, // This will make the Hero animation run the flip animation
      ),
    );
  },
  child: Transform.scale(
    scale: 0.45, // Make sure initial value matches the value when the animation starts ↖️
    child: BookFlip(listingData), // 1️⃣
  ),
)
  
// Details page
Hero( 
  tag: 'listing_hero_${listing.id}',
  child: BookFlip( // 2️⃣
    listingData,
    initialFlipProgress: 1, // Hero destination widget should match the animation end state
  ),
)
```
