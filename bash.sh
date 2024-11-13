#!/bin/bash
task = ()

while true; do
echo "Please enter task the you wish to schedule"
read user_command


echo "Would you like it to be one time task or recurring task?"

echo "1) one time task"
echo "2) recurring task"
read choice

case $choice in 

1) 
	echo "Enter the time you would like the task to be executed (e.g., 'now + 1 minute' or ' 	 					Wednesday 6pm'):"
	read schedule_time
	echo "$user_command" | at $schedule_time
	echo "Command schedule for $schedule_time"
	task+=("$user_command")
	;;
	
2) 
	echo "Enter the time you would like the task to be executed (cron format, e.g., '17 * * * for 		 		5 AM daily')"
	read recurring_tasks
	(cron tab -l; echo "$recurring_tasks $user_command") | crontab -
	echo "This task is recurring $recurring_tasks."
	task+=($user_command)
	;;
esac
	
echo "Would you like to enter more tasks?"

echo "1) yes"
echo "2) no"

if [[$choice =2]]; then
	break
fi
done

for tasks in "${tasks@}"; do


