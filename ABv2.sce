scenario = "AB task on nbs presentation";
scenario_type = trials;

pcl_file="ABv2.pcl"; 

active_buttons = 40; # numbers, then letters, then /, then enter, then backspace, then space bar

default_background_color=191,191,191;
default_font="Courier New Bold";
default_font_size = 18; # Having this font and font size and the screen resolution at 1024x768x16(60Hz) makes it match the version programmed in cogent (tested by running simultaneously on two laptops side by side).
default_text_color = 0,0,0;             

$soa=200; # Start with very slow SOA for the example in the instructions. Will be reset for all later trials by pcl

begin;

text{caption="Welcome to our study! \n
Please do not talk to your neighbour \n
or look at your neighbour's computer, \n
because that could affect how you do the task. \n
Instead, please work quietly and independently, \n
like you would in an exam. \n\n
Press the space bar to continue. \n"; font_size=16;}instructions0_txt;

text{caption="In this task, \n
you will be presented with a series of words one at a time, \n
with each word very quickly following the one before. \n
 \n
Mixed into these words will be a number repeated several times, for \n
example '77777777' or '22222222'.  \n
Try to recognize which number is repeated. \n
\n
At some time after the repeated number, one of the words will also be \n
presented in a green font instead of black. \n
Try to read the green word as well. \n
\n
Press <space> to see an example."; font_size=16;}instructions1_txt;

text{caption= "After the words (and number) have been presented, you will be asked to \n
type in the number and the green word if you were able to recognize what \n
they were. So, if the number was '55555555' and the word was 'CABBAGE', \n
you would type in '5', then 'cabbage' (don't worry about capitalizing). \n
\n
We'll first run some practice trials. For these, take your time, and type \n
as accurately as possible.
\n
If you can't remember the number, make your best guess. \n
If you can't remember the green word, just type '/' \n
\n
Press <space> to continue."; font_size=16;}instructions2_txt;

text{caption= "Now it's time to start the main experiment.\n\n
Type your responses as accurately as possible.\n
When the words seem too fast, still make your best guess, because\n
you'll probably do better than you think \n
as long as you make your best effort.\n\n
Press <space> to continue."; font_size=16;}instructions3_txt;

text{caption="Congratulations, you've finished the first task. \n
To start the next task,  \n
press the [enter] key several times. \n
\n"; font_size=16;}instructions_end_txt;

##################################################################################################
##################################################################################################
##################################################################################################
##################################################################################################

#'Please enter the number of the first target (0-9)
trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=1,2,3,4,5,6,7,8,9,10; # button 1 is 1, 2 is 2, etc.. 10 is 0.
picture {text{caption="Please enter the number of the first target (0-9)";}waitfordigit_txt;  x=0; y=0;}waitfordigit_pic;
}waitfordigit_trial;

trial{
stimulus_event{
picture {text{caption="Please type in the second target \n and then press the <ENTER> key";}textinput_txt; x=0;y=0;
}textinput_pic;
duration=response;
}textinput_event;
}textinput_trial;

trial{
stimulus_event{
picture {text{caption="Press the space bar to continue.";}saveT2responsetologfile_txt; x=0;y=0;
}saveT2responsetologfile_pic;
duration=1;
code="T2response";
}saveT2responsetologfile_event;
}saveT2responsetologfile_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=40;
picture {text{caption="Press the space bar to continue.";}waitforspace_txt;  x=0; y=0;}waitforspace_pic;
}waitforspace_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=40;
picture {text instructions0_txt;  x=0; y=0;}instructions0_pic;
}instructions0_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=40;
picture {text instructions1_txt;  x=0; y=0;}instructions1_pic;
}instructions1_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=40;
picture {text instructions2_txt;  x=0; y=0;}instructions2_pic;
}instructions2_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=40;
picture {text instructions3_txt;  x=0; y=0;}instructions3_pic;
}instructions3_trial;

trial{
trial_duration=forever;
trial_type=specific_response;
terminator_button=38,40;
picture {text instructions_end_txt;  x=0; y=0;}instructions_end_pic;
}instructions_end_trial;
###############################################################################################################################
# set this generic trial to have the max [possible number of events (e.g. 30). Then have arrays in pcl corresponding to each of:
# the list of words (with the last x of them being " "),
# the duration for each event (with the first bunch being a real soa and the last bunch being 1 ms)
# the deltat for each of them - following the logic of above with deltats of 1 ms at the end of the RSVP stream.
# Then, before every trial, the word text, duration, and deltat get set for every single event (e.g. all 30) based on those pcl arrays, 
# with them being set to super-short durations and deltats and text of blank space for the last bunch.
# That way the number of events in the trial object stays constant and I don't need super-long if statements in pcl,
# yet we still vary the number of words per trial from the subject's perspective, just by varying how many of the
# words at the end of the RSVP stream present " " and have a duration of 1 ms. 

# 11 distractors always follow T2. So, max RSVP length is 6+7+11=24
trial{
stimulus_event{picture {text{caption="+";   }fixn_txt;  x=0; y=0;}fixn_pic; duration=1000; }fixn_event; 	

stimulus_event{picture{text{caption="PONTIFICATION";}word1_txt; x=0; y=0;}word1_pic; duration=$soa; deltat=1000;}word1_event; 
	
stimulus_event{picture{text{caption="LOGROLLING";}word2_txt; x=0; y=0;}word2_pic; duration=$soa; deltat=$soa;}word2_event; 
stimulus_event{picture{text{caption="BIOGRAPHY";}word3_txt; x=0; y=0;}word3_pic; duration=$soa; deltat=$soa;}word3_event; 
stimulus_event{picture{text{caption="AMPHITHEATER";}word4_txt; x=0; y=0;}word4_pic; duration=$soa; deltat=$soa;}word4_event; 
stimulus_event{picture{text{caption="ESTABLISHMENT";}word5_txt; x=0; y=0;}word5_pic; duration=$soa; deltat=$soa;}word5_event; 
stimulus_event{picture{text{caption="MERETRICIOUS";}word6_txt; x=0; y=0;}word6_pic; duration=$soa; deltat=$soa;}word6_event; 
stimulus_event{picture{text{caption="555555555555";}word7_txt; x=0; y=0;}word7_pic; duration=$soa; deltat=$soa;}word7_event; 
stimulus_event{picture{text{caption="EXCEEDINGLY";}word8_txt; x=0; y=0;}word8_pic; duration=$soa; deltat=$soa;}word8_event; 
stimulus_event{picture{text{caption="MOTORCYCLE";}word9_txt; x=0; y=0;}word9_pic; duration=$soa; deltat=$soa;}word9_event; 
stimulus_event{picture{text{caption="BIOGRAPHY";}word10_txt; x=0; y=0;}word10_pic; duration=$soa; deltat=$soa;}word10_event; 
stimulus_event{picture{text{caption="BEATIFICATION";}word11_txt; x=0; y=0;}word11_pic; duration=$soa; deltat=$soa;}word11_event; 
stimulus_event{picture{text{caption="EXIGENCIES";}word12_txt; x=0; y=0;}word12_pic; duration=$soa; deltat=$soa;}word12_event; 
stimulus_event{picture{text{caption="OBSERVATORY";}word13_txt; x=0; y=0;}word13_pic; duration=$soa; deltat=$soa;}word13_event; 
stimulus_event{picture{text{caption="CABBAGE";}word14_txt; x=0; y=0;}word14_pic; duration=$soa; deltat=$soa;}word14_event; 
stimulus_event{picture{text{caption="ANTHROPOLOGY";}word15_txt; x=0; y=0;}word15_pic; duration=$soa; deltat=$soa;}word15_event; 
stimulus_event{picture{text{caption="EXTRAPOLATION";}word16_txt; x=0; y=0;}word16_pic; duration=$soa; deltat=$soa;}word16_event; 
stimulus_event{picture{text{caption="ORGANIZATION";}word17_txt; x=0; y=0;}word17_pic; duration=$soa; deltat=$soa;}word17_event; 
stimulus_event{picture{text{caption="BOOTSTRAPPING";}word18_txt; x=0; y=0;}word18_pic; duration=$soa; deltat=$soa;}word18_event; 
stimulus_event{picture{text{caption="FERTILIZER";}word19_txt; x=0; y=0;}word19_pic; duration=$soa; deltat=$soa;}word19_event; 
stimulus_event{picture{text{caption="OSCILLATION";}word20_txt; x=0; y=0;}word20_pic; duration=$soa; deltat=$soa;}word20_event; 
stimulus_event{picture{text{caption="etc";}word21_txt; x=0; y=0;}word21_pic; duration=$soa; deltat=$soa;}word21_event; 
stimulus_event{picture{text{caption="etc.";}word22_txt; x=0; y=0;}word22_pic; duration=$soa; deltat=$soa;}word22_event; 
stimulus_event{picture{text{caption="etc..";}word23_txt; x=0; y=0;}word23_pic; duration=$soa; deltat=$soa;}word23_event; 
stimulus_event{picture{text{caption="etc...";}word24_txt; x=0; y=0;}word24_pic; duration=$soa; deltat=$soa;}word24_event; 
}AB_trial;


trial{
stimulus_event{
picture {text{caption=" ";}savetologfile_txt; x=0;y=0;
}savetologfile_pic;
duration=1;
code="accuracytalliesgohere";
}savetologfile_event;
}savetologfile_trial;