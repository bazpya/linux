#!

# Taken from https://gist.github.com/jlollis/5ab887c47b4c212da560d6045650180e

sudo apt-get update
sudo apt-get install dosbox wget
mkdir -p wolf3d
cd wolf3d
wget http://image.dosgamesarchive.com/games/1wolf14.zip
unzip *.zip
dosbox INSTALL.EXE
echo "After setup cd into the new wolf3d directory"
echo "Run wolf3d.exe
