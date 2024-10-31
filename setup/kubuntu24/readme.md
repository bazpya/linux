### Dotfiles

#### /etc/pulse/default.pa

This makes Pulse Audio recognise devices,
particularly headset microphone,
plugged into the headset jack on my linux box.

#### ~/.config/autostart/dropbox.desktop

This disables autostart of Dropbox by this line:
Exec=dropbox stop
Once you manually run Dropbox it modifies the file
and the app autostarts ever after.
To prevent that, make this file immutable by:  
sudo chattr +i -V ./dropbox.desktop

