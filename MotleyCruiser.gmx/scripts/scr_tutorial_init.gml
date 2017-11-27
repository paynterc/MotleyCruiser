/// scr_tutorial_init()
/***
1. inventory
2. launch button
3. radar

***/
global.tutorial = scr_array_size(20);
for(var i=1; i<array_length_1d(global.tutorial); i++){
    global.tutorial[i]=false;
}

