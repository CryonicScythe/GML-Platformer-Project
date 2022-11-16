/// @desc Core Player Logic

//Get Player Inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

//Horizontal collision
if (place_meeting(x+hsp,y,spr_InvisibleWall))
{
	while (!place_meeting(x+sign(hsp),y,spr_InvisibleWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0
}
x = x + hsp;

//Vertical collision
if (place_meeting(x,y+vsp,spr_InvisibleWall))
{
	while (!place_meeting(x,y+sign(vsp),spr_InvisibleWall))
	{
		y = y + sign(vsp);
	}
	
}
y = y + hsp;