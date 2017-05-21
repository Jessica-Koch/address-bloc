require_relative 'controllers/menu_controller'

# create new MenuController when AddressBloc starts
menu = MenuController.new

system "clear" # clears command line
puts "Welcome to AddressBloc!"

# calls main_menu to display menu
menu.main_menu
