/// Check if an instance is visible in view
// scr_instance_in_view(instance)
ob = argument0;
return ob.x > view_xview 
&& ob.x < view_xview + view_wview
&& ob.y > view_yview
&& ob.y < view_yview + view_hview;

