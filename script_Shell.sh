#! /usr/bin/bash
# to write script I took some information from https://www.guru99.com/introduction-to-shell-scripting.html
# I am using vscode
# to Download the file https://raw.githubusercontent.com/swcarpentry/shell-novice/f32646f/data/shell-lesson-data.zip we use this command :
wget https://raw.githubusercontent.com/swcarpentry/shell-novice/f32646f/data/shell-lesson-data.zip


# to unzip it we use:
unzip -q shell-lesson-data.zip

# Read the .xml files in folder data/elements and copy them in another (new) folder named elements_by_atomic_number, so to do it i did:

mkdir elements_by_atomic_number
cd shell-lesson-data
cd data
cd elements

# To copy all .xml elements I used:

cp *.xml /home/bochra/script_Shell/elements_by_atomic_number

# to change the name, I do that, I know that I have a mistake some where but I couldn't solve it 
for file in *.xml
do
  number=$(get_number ${file})
  name=$(get_name ${file})
    mv ${file} ${number}_${name}.xml
  
done

cd ..

cd ..
cd ..
#chmod a g + w o -r -w 
# to Change file permissions to be writable by the group and have no read/write permissions for other users. I took information from: https://kb.iu.edu/d/abdb
# g = group + w ==> wrire O other -r can't read and - w can't write
sudo chmod -R g+w elements_by_atomic_number
sudo chmod -R o-r-w elements_by_atomic_number


# to Create a tar.gz file with these new files, removing all intermediate files and folders created. I used thes commands:
tar -czvf elements_by_atomic_number.tar.gz elements_by_atomic_number
cp elements_by_atomic_number.tar.gz /home/bochra/script_Shell
rm -r shell-lesson-data
rm shell-lesson-data.zip
