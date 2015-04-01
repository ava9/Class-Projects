#! /bin/bash 

#display use case for user
echo 'Example case : sh act_reminder.sh (make sure myweekly_act.txt is in same directory)'

#extract date
day=$(date | cut -d ' ' -f 1)

#awk script uses : as delimiter in myweekly_act.txt to find tasks
#email list of tasks from weekly activites list

awk -v day="$day" ' BEGIN {FS = " : ";}
{
	if ($1 == day) {
		tasks = $2;
		taskCount = 0;
		for (counter = 0;  counter < (NF - 2); counter++){
			tasks = tasks " : " $counter; 
			system("echo "tasks" | mailx -s \"Reminder: Tasks for today!\" ava9@cornell.edu"); 
		}
	} 
}' < myweekly_act.txt
#pass in to awk the weekly activites list
