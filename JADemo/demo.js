require('UIColor')
defineClass('ViewController', {
viewWillAppear: function(animated) {
        self.super().viewWillAppear(animated);
        self.view().setBackgroundColor(UIColor.blackColor());
    },
});

