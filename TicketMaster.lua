--TicketMaster--

--A program designed to handle creating and issuing tickets as well as deploying trains.

 
 local monitor = peripheral.find( "monitor" )
 local modem = peripheral.find( "modem" )
 local term = monitor
 
 monitor.clear()
 monitor.setCursorPos(1,1)
 monitor.write( "Finding Devices" )
 monitor.setCursorPos(1,2)
 sleep(2)
 dofile("DeviceManager")
 sleep(2)
 
 monitor.clear()
 term.setCursorPos(1,1)
 monitor.write("Booting Modem")
 modem.open(1)
 term.setCursorPos(1,2)
 
 if modem.isOpen(1) then 
  term.write("Modem open on channel 1")
  sleep(2)
 end
 
 local ticket = peripheral.find( "openperipherals_ticketmachine" )
 local monitor = peripheral.find( "monitor" )
 local term = monitor

 while true do        
 term.clear()
 term.setCursorPos(1,1)
 term.write("Listening...")
 term.setCursorPos(1,2)
 local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
 term.write("Pickup request for "..message)
 ticket.createTicket(""..message, 1)
 rs.setOutput("back",true)
 sleep(1)
 rs.setOutput("back",false)
 end
