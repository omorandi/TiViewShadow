require('ti.viewshadow');

var win = Ti.UI.createWindow({backgroundColor:'#fff'});
 
var view = Ti.UI.createView({
    height:100,
    width:100,
    left:100,
    top:100,
    backgroundColor:"green",
    shadow:{
        shadowRadius:10,
        shadowOpacity:0.5,
        shadowOffset:{x:5, y:10}
    }
})
 
var btn = Ti.UI.createButton({
    title:'Shadow from module',
    height:60,
    width:200,
    left:60,
    top:300
});
 
btn.setShadow({
    shadowRadius:10,
    shadowOpacity:0.5,
    shadowOffset:{x:5, y:10}
});
win.add(view);
 
win.add(btn);

win.open();