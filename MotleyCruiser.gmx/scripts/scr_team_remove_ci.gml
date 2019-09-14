/// scr_team_remove_ci(crew_index)
var crew_index = argument0;
for(var i=0;i<array_length_1d(global.team); i++){    
    if(global.team[i]==crew_index){
        global.team[i]=noone;
    } 
}
