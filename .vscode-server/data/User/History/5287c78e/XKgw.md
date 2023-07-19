Checkpoint 3 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: zhuoj

I would like to thank/reward these classmates for their help: krainc

This checkpoint took me about 15 hours to do. I did attend the lab session.

Program Structure and Design of the TCPSender:
The major data structures used for the TCPSender is a vector containing segments that have yet to be 'sent' by maybe-send() and another vector containing segments that are in-flight, meaning that they have been pushed but not yet acked by the receiver (at least as far as the sender is aware). The TCPsender also keeps track of the window_size that came in from the most recent message from the TCPreceiver. It also keeps track of the next_seqno it needs to send in a segment and the seqno that has been most recently acked. 

In push(), the sender constructs a number of segments and adds it to the two vectors. When constructing the segments, the sender must carefully consider the SYN and FIN flags as well and make sure they also fit in the window. The sender makes use of sequence_numbers_in_flight() to keep track of outstanding bytes to make sure their segments will fit within the receiver's window. 

In receive(), the sender updates its window size and ackno, if appropriate. It only updates the ackno if it is a reasonable seqno and greate than the existing ackno. Then, the sender prunes its vector of outstanding messages. 

I also implemented a TCPTimer class to handle the timer components for retransmission purposes. The timer simply stores a bool that signifies whether it is 'on' or not as well as the current timer time and the rto. startTimer() 'starts' the timer by setting the time back to the RTO and turning it on. stopTimer() simply 'stops' the timer by turining it off. The timer also has methods to double the rto and reset the RTO to enable exponential backoff. 

In the tick() method, if the timer is on, the timer's time value is decremented, and if it has 'expired' (become 0), the sender 'resends' a segment by adding it back to the unsent_messages vector so a future call to maybe_send() will return that segment. Moreover, the timer may have its RTO doubled for exponential backoff, and then the timer is restarted. 

Timer methods are called within push() and receive() as well to start and stop the timer as appropriate depending on the state of the segments.

One other state that the TCPSender keeps is whether it has received a window_size from a receiver at all. The sender needs to keep this state because when the sender has yet to receive a window size, the 1-byte segment that the sender sends should undergo exponential backoff. Although the window size at this point is basicaly considered to 

Implementation Challenges:
I found it challenging at first to understand all the different states that a segment could be in, and how the different sender methods worked together. I think I needed to read the document many times and consult with TAs before I understood how these parts all fit together. 

I am glad I started working on the non-timer parts first. It was tempting to start with the timer since it comes first in the checkpoint document. 

There were small bugs here and there that I used gdb to debug. It ended up being a few assumptions I made that were incorrect and led to undesirable outputs. Also the ordering of some of my operations. I also struggled with the implementation for the window_size when it is 0 or unknown, but I realized I needed to take a simpler approach than what I was trying. I set the default window_size to 1 and then did the comparison for the while loop making segments after I adjusted the window size to 1 if window_size == 0. 

Remaining Bugs:
None that I can identify at the moment.
