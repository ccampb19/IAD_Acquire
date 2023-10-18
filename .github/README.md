# IAD Acquire
### Purpose
This app aims to streamline acquisition and processing of inverse adding-doubling code using Scott Prahl's [Inverse Adding-Doubling code](https://github.com/scottprahl)  
It necessarily makes some assumptions about the experimental setup, though it could be modified to suit the user's needs. 
### Contributing
Matlab binary files like the .mlapp contained herein don't play nice with Github, so some work is necessary in order to do things other than clone or fetch from this repository:  
* In Matlab, execute the following commands to let git use the Matlab diff and merge tools (mlDiff, mlMerge, and mlAutoMerge):  
    `comparisons.ExternalSCMLink.setup()`  
    `comparisons.ExternalSCMLink.setupGitConfig()`  
* Additionally, we extract the contents of the mlapp file to make them human-readable in git before committing. The app programming is still done in App Designer, but viewing differences
 between commits can now be done outside of matlab, using the files in the .extracted directory. To enable this behavior, add the file `pre-commit` (no extension) to `./git/hooks`,
 containing the following code (note: this assumes tar is located in C:\Windows\System32 and won't complain about the .mlapp not being a tar file. Adjust the path as needed).
```
#!/bin/sh

# Hook script to extract contents of .mlapp file before committing.
# Called by "git commit" with no arguments.

# Stop the script if error occurs
set -e

# Extract the main program to a nonessential folder, .extracted, which can be diff'd as normal in git
C:/Windows/System32/tar -xvf IAD_acquire.mlapp --directory .extracted
```
     
### References:
* https://www.mathworks.com/matlabcentral/answers/524615-can-i-integrate-mlapp-files-from-app-designer-with-git-source-control  
* https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
