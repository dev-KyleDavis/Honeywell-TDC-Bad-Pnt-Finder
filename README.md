# Honeywell-TDC-Bad-Pnt-Finder

This is a batch file script written for Windows operating system. The script starts with turning off the echo of each command in the script using @echo off. The setlocal EnableDelayedExpansion command is used to enable the use of delayed expansion of environment variables.

The script displays a warning message that it should be run only on the primary server, and running it on a secondary server will result in errors. Then it prompts the user to enter the server name, which is stored in the server_name variable.

Next, the script sets the temp_dir variable to the drive letter of the current directory and adds \temp to it. Then it creates two file paths, pnt_file_path and txt_file_path, by appending the server name entered by the user to the tpsdel_ prefix and the .pnt and .txt suffixes to them, respectively.

The script checks if the pnt_file_path file exists. If it does, it prompts the user whether they want to overwrite it or not. If the user chooses not to overwrite it, the program terminates. If the user chooses to overwrite it, the program continues.

The script then creates a temp directory if it doesn't already exist and creates empty .pnt and .txt files with the names and paths set previously.

The script then prompts the user whether they want to search for unused points (identified by search_points variable). If the user chooses to search, the script changes the current directory to temp and runs a dspprime command with the name of the .pnt file as an argument. If the dspprime command fails, an error message is displayed with the exit code. Otherwise, a success message is displayed.

If the user chooses not to search for unused points, the program terminates with a message. Finally, the script waits for the user to press any key before exiting, using the pause command.
