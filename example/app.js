require('ti.viewshadow');

var win = Ti.UI.createWindow({backgroundColor:'#fff'});
 
var view = Ti.UI.createView({
    height:100,
    width:100,
    left:100,
    top:10,
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
    top:160
});
 
btn.setShadow({
    shadowRadius:10,
    shadowOpacity:0.5,
    shadowOffset:{x:5, y:10}
});



var lbl = Ti.UI.createLabel({
    text:'Shadow #00f',
	color:'#f00',
	font:{
		fontSize:30
	},
    height:60,
    width:200,
    left:60,
    top:300
});
 
lbl.setShadow({
    shadowRadius:5,
    shadowOpacity:1,
    shadowOffset:{x:0, y:0},
	shadowColor:'#00f'
});


win.add(view);
 
win.add(btn);
win.add(lbl);

win.open();