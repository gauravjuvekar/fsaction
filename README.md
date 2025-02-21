# fsaction

Simple script along with a systemd user service to watch a directory for new
files and run arbitrary scripts on them.

Add a `.fsaction` executable in any directory and start the systemd unit for
that directory. The executable will be called with the argument of any new file
that is added to the directory.

I use this to sort files downloaded from the web (with arbitrary names). By
default, they go into the "Downloads" folder, where a custom script moves them
to more organized directories based on the file name and contents.
