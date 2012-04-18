require('ti.viewshadow');

var win = Ti.UI.createWindow({backgroundColor:'#fff'});

var containerView = Ti.UI.createView({

    top:10,
    width:300,
    height:400,
    borderRadius:20,
    backgroundColor:'#eee',
    shadow:{
        shadowRadius:5,
        shadowOpacity:1,
        shadowOffset:{x:5, y:5}
    }

});

var view = Ti.UI.createView({
    height:100,
    width:100,
    left:100,
    top:10,
	borderRadius:20,
    backgroundColor:"green",
    shadow:{
        shadowRadius:10,
        shadowOpacity:0.5,
        shadowOffset:{x:5, y:10}
    }
})


var btn = Ti.UI.createButton({
    title:'Show/hide view',
    height:60,
    width:200,
    left:60,
    top:160,
    borderRadius:10,
    backgroundImage:'transparent',
    backgroundColor:'#999'
});
 
btn.setShadow({
    shadowRadius:10,
    shadowOpacity:0.5,
    shadowOffset:{x:5, y:10},
	shadowColor:'#393'
});

btn.addEventListener('click', function(){

    containerView.hide();
    
    setTimeout(function(){
        containerView.show();
    }, 200);

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
	shadowColor:'#f00'
});


containerView.add(view);
containerView.add(btn);
containerView.add(lbl);
win.add(containerView);

/*win.add(view);
win.add(btn);
win.add(lbl);*/

containerView.setShadow({
    shadowRadius:10,
    shadowOpacity:0.5,
    shadowOffset:{x:5, y:10},
	shadowColor:'#393'
});


win.open();