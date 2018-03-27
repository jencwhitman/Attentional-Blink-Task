
scenario = "AB ratings on nbs presentation";
scenario_type = trials;

pcl_file="ratingsv2.pcl"; 

# the 2 mouse buttons
active_buttons = 2; 
button_codes= 1,2;

default_background_color=255,255,255; 
default_font="arial";
default_font_size = 14;
default_text_color = 0,0,0;            

begin;

picture{}default;
############################################################################################################################
############################################################################################################################
# picture stuff for likert scale

$scale_y=0; #0; #'-280';
$middle_scale_x='0';
$legend_x_off=140; #'80';
$question_x_off=105; #'100';
$scale_height='320+14'; # an extra 14 pixels so we can fit the slider centered at 0% or 100%
$scale_width=40; #'36';
$scale_outer_xoffset='280'; # for display with 7 scales for 7 frequency estimates
$scale_inner_xoffset='140';
$scale_far_outer_xoffset='420'; # for display with 7 scales for 7 frequency estimates


box{width = '$scale_height+3'; height = '$scale_width+3'; color = 90, 90, 90;} scale_outline_box;
box{width = $scale_height; height = $scale_width; color = 200, 200, 200;} scale_inside_box;
box{width = 14; height = 30; color = 90, 90, 90;} scale_slider_outline_box;
box{width = 10; height = 24; color = 200, 200, 200;} scale_slider_box;

box{width = 2; height =$scale_width; color=200,200,200;} wide_marker_box; #color = 90, 90, 90;} wide_marker_box;
box{width = 2; height ='$scale_width/4'; color = 90, 90, 90;} narrow_marker_box;


box {width = 2; height=2; color = 255,255,255; } scale_highlight_box_outside; # essentially makes this invisible
box {width = 172; height=62; color = 90,90,90; } scale_highlight_box_inside;

#############################################################################
picture{ # scale is rotated 90 degrees from previous study, so x and y are switched

box scale_outline_box; 			x=$scale_y; y=$middle_scale_x;				# picture part number 1
box scale_inside_box; 			x=$scale_y; y=$middle_scale_x;
box wide_marker_box; 	   	x=$scale_y; y=$middle_scale_x;
box scale_slider_outline_box; x=$scale_y; y=$middle_scale_x;				# pic part 4
box scale_slider_box; 			x=$scale_y; y=$middle_scale_x;

box wide_marker_box; 	   	x=$scale_y; y=$middle_scale_x;				# part number 6

text{caption="very good";}upper_scale_label_txt; x='$scale_y+$scale_height/2'; y='$middle_scale_x+$legend_x_off-60'; 
text{caption="very bad";}lower_scale_label_txt; x='$scale_y-$scale_height/2'; y='$middle_scale_x+$legend_x_off-60'; 

text{caption=" ";}question_txt; x=$scale_y; y='$middle_scale_x+$question_x_off'; # picture part number 9

text{caption="How emotionally arousing was this word?";}bettervsworserating_title_txt; x=0; y=180; #330;

#### labels for middle of scale - left blank except for on the climate concern question
text{caption=" ";}middle_of_scale_label_1_txt; x='$scale_y-$scale_height/2+1*$scale_height/3'; y='$middle_scale_x+$legend_x_off-60'; 
text{caption=" ";}middle_of_scale_label_2_txt; x='$scale_y-$scale_height/2+2*$scale_height/3'; y='$middle_scale_x+$legend_x_off-60'; 

box narrow_marker_box; 	   	x='$scale_y-3*$scale_height/8'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y-3*$scale_height/8'; y='$middle_scale_x-3*$scale_width/8';

box narrow_marker_box; 	   	x='$scale_y-2*$scale_height/8'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y-2*$scale_height/8'; y='$middle_scale_x-3*$scale_width/8';

box narrow_marker_box; 	   	x='$scale_y-1*$scale_height/8'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y-1*$scale_height/8'; y='$middle_scale_x-3*$scale_width/8';


box narrow_marker_box; 	   	x='$scale_y'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y'; y='$middle_scale_x-3*$scale_width/8';

box narrow_marker_box; 	   	x='$scale_y+1*$scale_height/8'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y+1*$scale_height/8'; y='$middle_scale_x-3*$scale_width/8';

box narrow_marker_box; 	   	x='$scale_y+2*$scale_height/8'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y+2*$scale_height/8'; y='$middle_scale_x-3*$scale_width/8';

box narrow_marker_box; 	   	x='$scale_y+3*$scale_height/8'; y='$middle_scale_x+3*$scale_width/8';
box narrow_marker_box; 	   	x='$scale_y+3*$scale_height/8'; y='$middle_scale_x-3*$scale_width/8';

} likert_scale_better_vs_worse_pic;

############################################################################################################################
############################################################################################################################
############################################################################################################################

trial{ stimulus_event{picture default; code="resp code"; duration=1;}resp_code_event;}resp_code_trial;

trial{
stimulus_event{
picture likert_scale_better_vs_worse_pic;
#duration=response; # this line's just for debugging the display. remove before making response subroutine.
}better_vs_worse_rating_event;
}likert_better_vs_worse_rating_trial;  

text{ caption="We would now like you to rate some words in terms of : \n\n\n
1. How emotionally arousing you find them to be. \n
You should rate how exciting or agitating each word is, \n
regardless of whether it is good or bad. \n
For example, winning 10 million dollars in the lottery \n
and being chased by a bear are both extremely arousing. \n\n\n
and \n\n
2. How much the word is associated with climate change. \n\n
For each word, you will answer these questions in random order.\n
Please use the mouse to respond. The rating scale will be provided for you.\n
Press the left mouse button to continue.\n";}instructions_txt;

text{ caption="Remember that the questions change randomly, \n
so it's very important that you read what it says for each rating. \n\n
Press the left mouse button to begin.";}instructions2_txt;

text{ caption="Congratulations, you're now done the 2nd task. \n
Please open google chrome and click the bookmark for \n
HSP online debriefing. If it doesn't work, \n
you may need to reconnect to the wifi. \n
Select the triangular icon made of white bars,\n
and connect to UBC secure. Your UBC CWL\n
user ID and password should work. It may be\n
necessary to disconnect and then reconnect again.\n
The experimenter can provide the information you need\n
to answer the debriefing questions.\n";}instructions_end_txt;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=1;
picture {text instructions_txt;  x=0; y=0;}instructions_pic;
}instructions_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=1;
picture {text instructions2_txt;  x=0; y=0;}instructions2_pic;
}instructions2_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=1;
picture {text instructions_end_txt;  x=0; y=0;}instructions_end_pic;
}instructions_end_trial;