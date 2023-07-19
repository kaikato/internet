Checkpoint 4 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: 

I would like to thank/reward these classmates for their help: dawhitten

This checkpoint took me about 10 hours to do. I did not attend the lab session.

Program Structure and Design of the NetworkInterface:
I used four data structures to keep state for this class. The first data structure is a vector of EthernetFrames (sent_frames) that I use to represent the Ethernet frames that have been 'sent.' The only operations on this structure is appending frames to the end and popping from the front so a vector is well-suited for my needs. 

The next structure is an unordered map, called awaiting_arp, representing all the datagrams awaiting an ARP reply to be sent to the correct next hop. The key is the uint32_t representation of the IP address this frame is intended to go to next, which we do not know the ethernet address of. So when we try to send a datagram to an address which the ethernet address is unknown, an ARP request is sent, but while the ARP request is outstanding, we need to store all the datagrams that are waiting to be sent. Each destination IP matches to a vector of InternetDatagrams. Each of these datagrams are destined to go to the same IP (its key). I need a structure like a vector since multiple datagrams headed to the same IP could have been attempted to be sent while the ip-to-ethernet mapping is unknown for their IP. I use an unordered map for fast lookup by IP address (as uint32_t) since there is no guarantee we receive new ip-to-eth mappings by any order corresponding to the order in which we sent ARP requests. 

The third structure (ip2eth) is another unordered map of IP addresses (as uint32_t) to a pair comprised of an EthernetAddress and a size_t representing time since creation. Like awaiting_arp, I use an unordered map here since the main utility of this structure is a way of looking up mapped values. I needed to use a pair of EthernetAddress and size_t as the value of this map since I needed to keep track of how long each mapping was 'alive'. The update_ip2eth_mapping() function called in tick() updated ip2eth to add ms_since_last_tick to each size_t value in this unorded map. If the value becomes greater than 30,000 (representing 30 seconds), then the entire entry is removed from ip2eth. 

The last structure (recent_ips_requested) is another unordered map of IP addresses (as uint32_t) to size_t representing how long since it was added to the map. I use this map to keep track of the IP addresses that were recently queried in ARP requests, in order to prevent flooding the network with ARP requests. 


Deleting old mappings also keeps size of this structure small, reducing costs of iterating through its entirety.

Implementation Challenges:
[]

Remaining Bugs:
[]

- Optional: I had unexpected difficulty with: [describe]

- Optional: I think you could make this lab better by: [describe]

- Optional: I was surprised by: [describe]

- Optional: I'm not sure about: [describe]
