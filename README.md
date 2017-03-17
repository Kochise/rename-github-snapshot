# rename-github-snapshot

Windows BATCH file to rename GitHub snapshots for archival purpose

* Introduction

Sometimes I download snapshots from GitHub and save them for later purpose. If you download a second time, you get a name collision because the snapshots are composed of the name of the repository and the name of branch, most commonly '-master'. It would have been cool if GitHub also added the date of the last edit.

* Hardware and software needed

\- indows win32 and MFC compatible OS<br>
\- 7-Zip installed in "c:\Program Files\7-Zip\"<br>

* How to use it

Just place this file in the folder containing the snapshots and execute it with admin priviledges. It will recursively scan folders and replace the '-master' branch name by the date of the last edit found in the zip file (date of the repository's root folder).

* Some infos

The next step will be not to replace the branch name but just add a date to it.
