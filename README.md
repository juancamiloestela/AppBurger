#AppBurger

Native Mac Apps in HTML, CSS and Javascript

```
// A Cheese burger coming up!
document.addEventListener('burgerready', function() {
    // Order no. 1 is ready!
    Burger.setDockIcon('img/icon.png');
    Burger.setWindowHeight(500);
    Burger.centerWindow();
    Burger.setWindowTitle('Hello Cheese Burger!');
    
    var data;
    if (Burger.isRunningOnBrowser()){
        data = Burger.readFile('config.txt');
    }else{
        data = callSomeApiViaAjax();
    }

    eatData(data);
}, false);
```

See docs in http://juancamiloestela.github.io/AppBurger

## Todos and requested features

- Always on front mode
- Fullscreen mode for kiosks
- Success/error message after new app is generated
- Multi window support
- Explore data storage mechanisms (sqllite)
