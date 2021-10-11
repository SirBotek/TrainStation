--TicketMaster--

--A program designed to handle creating and issuing tickets as well as deploying trains.

 
 local monitor = peripheral.find( "monitor" )
 local modem = peripheral.find( "modem" )

 monitor.clear()
 monitor.setCursorPos(1,1)
 monitor.write( "Finding Devices" )
 monitor.setCursorPos(1,2)
 sleep(2)
 dofile("DeviceManager")
 sleep(2)
 
 monitor.clear()
 monitor.setCursorPos(1,1)
 monitor.write("Booting Modem")
 modem.open(2)
 monitor.setCursorPos(1,2)
 
 if modem.isOpen(2) then 
  monitor.write("Modem open on channel 2")
  sleep(2)
 end
 


 while true do        
 
 local ticket = peripheral.find("openperipherals_ticketmachine")
 local monitor = peripheral.find( "monitor" )
 
 
 
 monitor.clear()
 monitor.setCursorPos(1,1)
 monitor.write("Listening...")
 monitor.setCursorPos(1,2)
 
 local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
 monitor.write("Received request for "..message) 
 ticket.createTicket( ""..message,1)
 rs.setOutput("back",true)
 sleep(1)
 rs.setOutput("back",false)
 end
