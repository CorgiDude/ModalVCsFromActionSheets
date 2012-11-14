# This repo illustrates an issue with iOS 6.x.  I think.

Imagine an app where you have a UIBarButtonItem on a UIToolbar.

![Initial screen](/CorgiDude/ModalVCsFromActionSheets/raw/master/Pics/initial.png)

You show a UIActionSheet when this bar button item is pressed.

![Action sheet](/CorgiDude/ModalVCsFromActionSheets/raw/master/Pics/action-sheet.png)

Let's say it's for taking a photo or something, so you present a modal VC when an action sheet button is tapped.  All fine, right?

![Modal VC is shown](/CorgiDude/ModalVCsFromActionSheets/raw/master/Pics/modal-vc.png)

…Wrong, when dismissed on iOS 6.x!

![Button has vanished](/CorgiDude/ModalVCsFromActionSheets/raw/master/Pics/no-more-button.png)

This looks fine on iOS 5.x though:

![5.0 and 5.1 are unaffected](/CorgiDude/ModalVCsFromActionSheets/raw/master/Pics/meanwhile-in-5.x-land.png)

So many bugs in 4.x, so many bugs in 6.x, I'm thinking of targeting 5.x *only* :(
