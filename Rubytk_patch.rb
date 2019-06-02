#!/usr/bin/env ruby

#----------------------------------------------------------------------
#-RubyTK patch to fix RubyTk for versions 2.4.0/2.6.0
#-rubytk was removed from the compiler in 2.4.0.
#-This patch is to fix the compatibility issue that keeps the TK gem
#-from installing.  It will also install the TK gem.
#-After running this Script, RubyTk should be working again.
#-After alot of heart ache and research, I've created this script to
#-keep others from having to deal with what I had to get it working again.
#-this works with the tcl8.6-dev
#----------------------MAY 08, 2019-------------------------------------
#This script was written by Cufe_Haco.  Information found on
#https://stackoverflow.com/questions/54293774/ruby-graphical-user-interface-tk-on-linux-ubuntu-dont-work
#-----------------------------------------------------------------------

class TK_Patch
puts Time.now
puts "Updating/installing tcl8.6-dev and tk8.6-dev"
`sudo apt-get install tcl8.6-dev`
`sudo apt-get install tk8.6-dev`
sleep(1)
puts "Installing Ruby-All-dev"
sleep(1)
`sudo apt-get install ruby-all-dev`.chomp
sleep(1)
 puts "creating softlinks"
  `sudo ln -s /usr/lib/x86_64-linux-gnu/tcl8.6/tclConfig.sh /usr/lib/tclConfig.sh`
`sudo ln -s /usr/lib/x86_64-linux-gnu/tk8.6/tkConfig.sh /usr/lib/tkConfig.sh`
`sudo ln -s /usr/lib/x86_64-linux-gnu/libtcl8.6.so.0 /usr/lib/libtcl8.6.so.0`
`sudo ln -s /usr/lib/x86_64-linux-gnu/libtk8.6.so.0 /usr/lib/libtk8.6.so.0`

  sleep(1)
puts "Installing TK GEM with TCL8.6-dev"
sleep(1)
`sudo gem install tk -- --with-tcltkversion=8.6 \
--with-tcl-lib=/usr/lib/x86_64-linux-gnu \
--with-tk-lib=/usr/lib/x86_64-linux-gnu \
--with-tcl-include=/usr/include/tcl8.6 \
--with-tk-include=/usr/include/tcl8.6 \
--enable-pthread`.chomp

puts "testing TK GEM"
sleep(1)
puts Time.now
require 'tk'

root = TkRoot.new {title "TK Test!!!!"}
root['geometry'] = '400x200'
label = TkLabel.new {text "Tk test label!" ; pack}
button = TkButton.new {text "EXIT" ; command {proc exit} ; pack}
Tk.mainloop
sleep(1)
puts Time.now
exit(0)
end

Tk_Patch.new
