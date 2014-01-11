#!/usr/bin/env ruby

require "rubygems"
require "pry"
require 'colored'

File.join(File.dirname(__FILE__),'..','lib','datapimp-clients.rb')

require 'rbcurse/core/util/app'
require 'rbcurse/core/include/appmethods'
require 'rbcurse/core/widgets/rlist'

App.new do

  def refresh

  end

  app_header "Datapimp", text_center: "I got issues", color: "white", bgcolor: "blue"
  message "Press F10 to bounce"

  form.help_manager.help_text = "Sup baby boo?"

  flow :margin_top => 1, :height => FFI::NCurses.LINES-2 do
    lb = listbox :list => ['one','two'], :suppress_borders => false, :title => "[ brew packages ]",
      :left_margin => 1, :width_pc => 50, :name => 'lb1'
    lb.show_selector = false
  end

  label({:text => "F1 Help, F10 Quit. : for menu. Press F4 and F5 to test popup, space or enter to select", :row => Ncurses.LINES-1, :col => 0, :name => 'lab'})


end
