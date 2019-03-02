#Nic Fixes for X11's
#
#Written by Polk
#Date: 2-2-19 for Softlayer Technologies
#
#--------------------------------------------------------------------------------------------------------
#Encapsulated Task offload = Disabled 

#Command disabled the Encapsulated Task offload on both drivers
Disable-NetAdapterEncapsulatedPacketTaskOffload –Name *A -NoRestart
start-sleep 3
Disable-NetAdapterEncapsulatedPacketTaskOffload –Name *B -NoRestart
start-sleep 3
#Command enables Encapsulated Task offload on the Microsoft driver
Enable-NetAdapterEncapsulatedPacketTaskOffload –Name *teamed -NoRestart
Start-sleep 10
#Result:
#PS C:\Users\Administrator\Desktop> get-NetAdapterEncapsulatedPacketTaskOffload –Name *
#
#Name                           Enabled
#----                           -------
#PrivateNetwork-Teamed          True
#PublicNetwork-Teamed           True
#PublicNetwork-B                False
#PrivateNetwork-B               False
#PublicNetwork-A                False
#PrivateNetwork-A               False
#---------------------------------------------------------------------------------------------------------
#Interrupt Moderation = disabled  
#
#Command disables Interrupt Moderation on the Intel Driver only.  Setting is not an option on Microsoft driver
Set-NetAdapterAdvancedProperty  -DisplayName  “Interrupt Moderation” -DisplayValue "Disabled" -NoRestart
Start-sleep 10
#Result:
#PS C:\Users\Administrator\Desktop> Set-NetAdapterAdvancedProperty  -DisplayName  “Interrupt Moderation” -DisplayValue "Disabled" -NoRestart
#PS C:\Users\Administrator\Desktop> get-NetAdapterAdvancedProperty  -DisplayName  “Interrupt Moderation”
#
#Name                      DisplayName                    DisplayValue                   RegistryKeyword RegistryValue
#----                      -----------                    ------------                   --------------- -------------
#PublicNetwork-B           Interrupt Moderation           Disabled                       *InterruptMo... {0}
#PrivateNetwork-B          Interrupt Moderation           Disabled                       *InterruptMo... {0}
#PublicNetwork-A           Interrupt Moderation           Disabled                       *InterruptMo... {0}
#PrivateNetwork-A          Interrupt Moderation           Disabled                       *InterruptMo... {0}
#---------------------------------------------------------------------------------------------------------
#ipV4 checksum offload = Disabled 
#
#Command disbales ipV4 checksum offload on both the Microsoft driver and the Intel Driver
Disable-NetAdapterChecksumOffload -Name * -IPIPv4 -NoRestart
Start-sleep 10
#Result:
#PS C:\Users\Administrator\Desktop> Disable-NetAdapterChecksumOffload -Name * -TcpIPv4 -NoRestart
#
#PS C:\Users\Administrator\Desktop>  get-NetAdapterChecksumOffload
#Name                           IpIPv4Enabled   TcpIPv4Enabled  TcpIPv6Enabled  UdpIPv4Enabled  UdpIPv6Enabled 
#----                           -------------   --------------  --------------  --------------  -------------- 
#PrivateNetwork-Teamed          RxTxEnabled     Disabled        RxTxEnabled     RxTxEnabled     RxTxEnabled    
#PublicNetwork-Teamed           RxTxEnabled     Disabled        RxTxEnabled     RxTxEnabled     RxTxEnabled    
#PublicNetwork-B                RxTxEnabled     Disabled        RxTxEnabled     RxTxEnabled     RxTxEnabled    
#PrivateNetwork-B               RxTxEnabled     Disabled        RxTxEnabled     RxTxEnabled     RxTxEnabled    
#PublicNetwork-A                RxTxEnabled     Disabled        RxTxEnabled     RxTxEnabled     RxTxEnabled    
#PrivateNetwork-A               RxTxEnabled     Disabled        RxTxEnabled     RxTxEnabled     RxTxEnabled    
#--------------------------------------------------------------------------------------------------------------
#UDP Checksum offload = Disabled
#
#Command disbales UdpIPv4 checksum offload on both the Microsoft driver and the Intel Driver
Disable-NetAdapterChecksumOffload -Name *A -UdpIPv4 -NoRestart
Disable-NetAdapterChecksumOffload -Name *B -UdpIPv4 -NoRestart
Disable-NetAdapterChecksumOffload -Name *Teamed -UdpIPv4 -NoRestart
Start-sleep 10
#Result:
#PS C:\Users\Administrator\Desktop> Disable-NetAdapterChecksumOffload -Name * -UdpIPv4 -NoRestart
#
#PS C:\Users\Administrator\Desktop>  get-NetAdapterChecksumOffload
#Name                           IpIPv4Enabled   TcpIPv4Enabled  TcpIPv6Enabled  UdpIPv4Enabled  UdpIPv6Enabled 
#----                           -------------   --------------  --------------  --------------  -------------- 
#PrivateNetwork-Teamed          RxTxEnabled     Disabled        RxTxEnabled     Disabled        RxTxEnabled    
#PublicNetwork-Teamed           RxTxEnabled     Disabled        RxTxEnabled     Disabled        RxTxEnabled    
#PublicNetwork-B                RxTxEnabled     Disabled        RxTxEnabled     Disabled        RxTxEnabled    
#PrivateNetwork-B               RxTxEnabled     Disabled        RxTxEnabled     Disabled        RxTxEnabled    
#PublicNetwork-A                RxTxEnabled     Disabled        RxTxEnabled     Disabled        RxTxEnabled    
#PrivateNetwork-A               RxTxEnabled     Disabled        RxTxEnabled     Disabled        RxTxEnabled    
#------------------------------------------------------------------------------------------------------------
#Jumbo Packets = disabled
#
#Command will disbale Jumbo packets on Intel Drivers, has no options on Microsoft drivers
Get-NetAdapterAdvancedProperty -DisplayName “Jumbo Packet” | Set-NetAdapterAdvancedProperty –RegistryValue “1514” -NoRestart
Start-sleep 10
#Result:
#Get-NetAdapterAdvancedProperty -DisplayName “Jumbo Packet” | Set-NetAdapterAdvancedProperty –RegistryValue “1514” -NoRestart
#
#PS C:\Users\Administrator\Desktop> Get-NetAdapterAdvancedProperty -DisplayName “Jumbo Packet”
#Name                      DisplayName                    DisplayValue                   RegistryKeyword RegistryValue  
#----                      -----------                    ------------                   --------------- -------------  
#PublicNetwork-B           Jumbo Packet                   Disabled                       *JumboPacket    {1514}         
#PrivateNetwork-B          Jumbo Packet                   Disabled                       *JumboPacket    {1514}         
#PublicNetwork-A           Jumbo Packet                   Disabled                       *JumboPacket    {1514}         
#PrivateNetwork-A          Jumbo Packet                   Disabled                       *JumboPacket    {1514}         
#----------------------------------------------------------------------------------------------------------------------
#Packet Priority & Vlan = disabled 
#
#Command disables QoS Packet Tagging on Intel driver only no options for Microsoft Driver
Get-NetAdapterAdvancedProperty -DisplayName “Packet Priority & VLAN” | Set-NetAdapterAdvancedProperty –RegistryValue “0” -NoRestart
#Result:
#PS C:\Users\Administrator\Desktop> Get-NetAdapterAdvancedProperty -DisplayName “Packet Priority & VLAN” | Set-NetAdapterAdvancedProperty –RegistryValue “0” -NoRestart
#
#PS C:\Users\Administrator\Desktop> Get-NetAdapterAdvancedProperty -DisplayName “Packet Priority & VLAN” 
#Name                      DisplayName                    DisplayValue                   RegistryKeyword RegistryValue  
#----                      -----------                    ------------                   --------------- -------------  
#PublicNetwork-B           Packet Priority & VLAN         Packet Priority & VLAN Disa... *PriorityVLA... {0}            
#PrivateNetwork-B          Packet Priority & VLAN         Packet Priority & VLAN Disa... *PriorityVLA... {0}            
#PublicNetwork-A           Packet Priority & VLAN         Packet Priority & VLAN Disa... *PriorityVLA... {0}            
#PrivateNetwork-A          Packet Priority & VLAN         Packet Priority & VLAN Disa... *PriorityVLA... {0}            
#----------------------------------------------------------------------------------------------------------------------
#Receive Buffers = 4096 ( highest setting) 
#
#Command sets the buffer size (in Kilobytes) of system memory that can be used by the adapter for received packets. For Intel driver only, no options for Microsoft Driver
Get-NetAdapterAdvancedProperty -DisplayName “Receive buffers” | Set-NetAdapterAdvancedProperty –RegistryValue “4096” -NoRestart
Start-sleep 10
#Result:
#Get-NetAdapterAdvancedProperty -DisplayName “Receive buffers” | Set-NetAdapterAdvancedProperty –RegistryValue “4096” -NoRestart
#
#PS C:\Users\Administrator\Desktop> Get-NetAdapterAdvancedProperty -DisplayName “Receive buffers”
#Name                      DisplayName                    DisplayValue                   RegistryKeyword RegistryValue  
#----                      -----------                    ------------                   --------------- -------------  
#PublicNetwork-B           Receive Buffers                4096                           *ReceiveBuffers {4096}         
#PrivateNetwork-B          Receive Buffers                4096                           *ReceiveBuffers {4096}         
#PublicNetwork-A           Receive Buffers                4096                           *ReceiveBuffers {4096}         
#PrivateNetwork-A          Receive Buffers                4096                           *ReceiveBuffers {4096}      
#----------------------------------------------------------------------------------------------------------------------
#Receive Side Scaling = Enabled
#
#Command enables Receive Side Scaling on servers with multiple CPUs. This setting affects Intel and Microsoft drivers.
Get-NetAdapterAdvancedProperty -DisplayName “Receive Side Scaling” -Name *B| Set-NetAdapterAdvancedProperty –RegistryValue “1” -NoRestart
Get-NetAdapterAdvancedProperty -DisplayName “Receive Side Scaling” -name *A| Set-NetAdapterAdvancedProperty –RegistryValue “1” -NoRestart
Get-NetAdapterAdvancedProperty -DisplayName “Receive Side Scaling” -Name *Teamed | Set-NetAdapterAdvancedProperty –RegistryValue “1” 
Start-sleep 20
#Result:
#PS C:\Users\Administrator\Desktop> Get-NetAdapterAdvancedProperty -DisplayName “Receive Side Scaling” | Set-NetAdapterAdvancedProperty –RegistryValue “1” -NoRestart
#Get-NetAdapterAdvancedProperty -DisplayName “Receive Side Scaling”
#Name                      DisplayName                    DisplayValue                   RegistryKeyword RegistryValue  
#----                      -----------                    ------------                   --------------- -------------  
#PrivateNetwork-Teamed     Receive Side Scaling           Enabled                        *RSS            {1}            
#PublicNetwork-Teamed      Receive Side Scaling           Enabled                        *RSS            {1}            
#PublicNetwork-B           Receive Side Scaling           Enabled                        *RSS            {1}            
#PrivateNetwork-B          Receive Side Scaling           Enabled                        *RSS            {1}            
#PublicNetwork-A           Receive Side Scaling           Enabled                        *RSS            {1}            
#PrivateNetwork-A          Receive Side Scaling           Enabled                        *RSS            {1} 
#----------------------------------------------------------------------------------------------------------------------
#RSS load Balancing Profile = NUMAScaling     ****************************************************************  There is no option for NUMAScaling ********************
#
#Command enables the load ballancing of network IO accoss multiple CPUs.  This command will affect Intel and Microsoft drivers so make sure name selection is correct
#************     Both commands are required to complete configuration  *************************
Set-NetAdapterRss -Name *Network-B -Profile NUMA
Set-NetAdapterRss -Name *Network-A -Profile NUMA
Start-sleep 20
Disable-NetAdapter -Name *B -Confirm:$false
Start-sleep 20
Enable-NetAdapter -name *B -Confirm:$false
#Result:
#PS C:\Users\Administrator> $rssprofile = Get-NetAdapterrss

#PS C:\Users\Administrator> echo $rssprofile.profile
#Name                                            : PrivateNetwork-Teamed
#InterfaceDescription                            : Microsoft Network Adapter Multiplexor Driver #2
#Enabled                                         : True
#NumberOfReceiveQueues                           : 0
#Profile                                         : NUMAStatic
#BaseProcessor: [Group:Number]                   : 0:0
#MaxProcessor: [Group:Number]                    : 1:34
#MaxProcessors                                   : 4
#RssProcessorArray: [Group:Number/NUMA Distance] : 0:0/0  0:2/0  0:4/0  0:6/0  0:8/0  0:10/0  0:12/0  0:14/0
#                                                  0:16/0  0:18/0  0:20/0  0:22/0  0:24/0  0:26/0  0:28/0  0:30/0
#                                                  0:32/0  0:34/0  1:0/0  1:2/0  1:4/0  1:6/0  1:8/0  1:10/0
#                                                  1:12/0  1:14/0  1:16/0  1:18/0  1:20/0  1:22/0  1:24/0  1:26/0
#                                                  1:28/0  1:30/0  1:32/0  1:34/0  
#IndirectionTable: [Group:Number]                : 
#
#Name                                            : PublicNetwork-Teamed
#InterfaceDescription                            : Microsoft Network Adapter Multiplexor Driver
#Enabled                                         : True
#NumberOfReceiveQueues                           : 0
#Profile                                         : NUMAStatic
#BaseProcessor: [Group:Number]                   : 0:0
#MaxProcessor: [Group:Number]                    : 1:34
#MaxProcessors                                   : 4
#RssProcessorArray: [Group:Number/NUMA Distance] : 0:0/0  0:2/0  0:4/0  0:6/0  0:8/0  0:10/0  0:12/0  0:14/0
#                                                  0:16/0  0:18/0  0:20/0  0:22/0  0:24/0  0:26/0  0:28/0  0:30/0
#                                                  0:32/0  0:34/0  1:0/0  1:2/0  1:4/0  1:6/0  1:8/0  1:10/0
#                                                  1:12/0  1:14/0  1:16/0  1:18/0  1:20/0  1:22/0  1:24/0  1:26/0
#                                                  1:28/0  1:30/0  1:32/0  1:34/0  
#IndirectionTable: [Group:Number]                : 
#
#Name                                            : PublicNetwork-B
#InterfaceDescription                            : Intel(R) Ethernet Controller X710/X557-AT 10GBASE-T #3
#Enabled                                         : True
#NumberOfReceiveQueues                           : 8
#Profile                                         : NUMA
#BaseProcessor: [Group:Number]                   : 0:0
#MaxProcessor: [Group:Number]                    : 1:34
#MaxProcessors                                   : 32
#RssProcessorArray: [Group:Number/NUMA Distance] : 0:0/0  0:2/0  0:4/0  0:6/0  0:8/0  0:10/0  0:12/0  0:14/0
#                                                  0:16/0  0:18/0  0:20/0  0:22/0  0:24/0  0:26/0  0:28/0  0:30/0
#                                                  0:32/0  0:34/0  1:0/32767  1:2/32767  1:4/32767  1:6/32767  1:8/32767  1:10/32767
#                                                  1:12/32767  1:14/32767  1:16/32767  1:18/32767  1:20/32767  1:22/32767  1:24/32767  1:26/32767
#                                                  1:28/32767  1:30/32767  1:32/32767  1:34/32767  
#IndirectionTable: [Group:Number]                : 0:32	0:34	0:32	0:34	0:32	0:34	0:32	0:34	
#                                                  0:32	0:34	0:32	0:34	0:32	0:34	0:32	0:34	
#Name                                            : PrivateNetwork-B
#InterfaceDescription                            : Intel(R) Ethernet Controller X710/X557-AT 10GBASE-T #2
#Enabled                                         : True
#NumberOfReceiveQueues                           : 8
#Profile                                         : NUMA
#BaseProcessor: [Group:Number]                   : 0:0
#MaxProcessor: [Group:Number]                    : 1:34
#MaxProcessors                                   : 32
#RssProcessorArray: [Group:Number/NUMA Distance] : 0:0/0  0:2/0  0:4/0  0:6/0  0:8/0  0:10/0  0:12/0  0:14/0
#                                                  0:16/0  0:18/0  0:20/0  0:22/0  0:24/0  0:26/0  0:28/0  0:30/0
#                                                  0:32/0  0:34/0  1:0/32767  1:2/32767  1:4/32767  1:6/32767  1:8/32767  1:10/32767
#                                                  1:12/32767  1:14/32767  1:16/32767  1:18/32767  1:20/32767  1:22/32767  1:24/32767  1:26/32767
#                                                  1:28/32767  1:30/32767  1:32/32767  1:34/32767  
#IndirectionTable: [Group:Number]                : 0:0	0:2	0:4	0:6	0:8	0:10	0:12	0:14	
#                                                  0:0	0:2	0:4	0:6	0:8	0:10	0:12	0:14	
#                                                  0:0	0:2	0:4	0:6	0:8	0:10	0:12	0:14	
#                                                  0:0	0:2	0:4	0:6	0:8	0:10	0:12	0:14	
#                                                  0:0	0:2	0:4	0:6	0:8	0:10	0:12	0:14	
#Name                                            : PublicNetwork-A
#InterfaceDescription                            : Intel(R) Ethernet Controller X710/X557-AT 10GBASE-T
#Enabled                                         : True
#NumberOfReceiveQueues                           : 8
#Profile                                         : NUMA
#BaseProcessor: [Group:Number]                   : 0:0
#MaxProcessor: [Group:Number]                    : 1:34
#MaxProcessors                                   : 32
#RssProcessorArray: [Group:Number/NUMA Distance] : 0:0/0  0:2/0  0:4/0  0:6/0  0:8/0  0:10/0  0:12/0  0:14/0
#                                                  0:16/0  0:18/0  0:20/0  0:22/0  0:24/0  0:26/0  0:28/0  0:30/0
#                                                  0:32/0  0:34/0  1:0/32767  1:2/32767  1:4/32767  1:6/32767  1:8/32767  1:10/32767
#                                                  1:12/32767  1:14/32767  1:16/32767  1:18/32767  1:20/32767  1:22/32767  1:24/32767  1:26/32767
#                                                  1:28/32767  1:30/32767  1:32/32767  1:34/32767  
#IndirectionTable: [Group:Number]                : 0:0	0:0	0:0	0:0	0:0	0:0	0:0	0:0	
#                                                  0:0	0:0	0:0	0:0	0:0	0:0	0:0	0:0	
#                                                  0:0	0:0	0:0	0:0	0:0	0:0	0:0	0:0	
#                                                  0:0	0:0	0:0	0:0	0:0	0:0	0:0	0:0	
#Name                                            : PrivateNetwork-A
#InterfaceDescription                            : Intel(R) Ethernet Controller X710/X557-AT 10GBASE-T #4
#Enabled                                         : True
#NumberOfReceiveQueues                           : 8
#Profile                                         : NUMA
#BaseProcessor: [Group:Number]                   : 0:0
#MaxProcessor: [Group:Number]                    : 1:34
#MaxProcessors                                   : 32
#RssProcessorArray: [Group:Number/NUMA Distance] : 0:0/0  0:2/0  0:4/0  0:6/0  0:8/0  0:10/0  0:12/0  0:14/0
#                                                  0:16/0  0:18/0  0:20/0  0:22/0  0:24/0  0:26/0  0:28/0  0:30/0
#                                                  0:32/0  0:34/0  1:0/32767  1:2/32767  1:4/32767  1:6/32767  1:8/32767  1:10/32767
#                                                  1:12/32767  1:14/32767  1:16/32767  1:18/32767  1:20/32767  1:22/32767  1:24/32767  1:26/32767
#                                                  1:28/32767  1:30/32767  1:32/32767  1:34/32767  
#IndirectionTable: [Group:Number]                : 0:16	0:18	0:20	0:22	0:24	0:26	0:28	0:30	
#                                                  0:16	0:18	0:20	0:22	0:24	0:26	0:28	0:30