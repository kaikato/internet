Checkpoint 3 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: zhuoj

I would like to thank/reward these classmates for their help: krainc

This checkpoint took me about 15 hours to do. I did attend the lab session.

Program Structure and Design of the TCPSender:
The major data structures used for the TCPSender is a vector containing segments that have yet to be 'sent' by maybe-send() and another vector containing segments that are in-flight, meaning that they have been pushed but not yet acked by the receiver (at least as far as the sender is aware). The TCPsender also keeps track of the window_size that came in from the most recent message from the TCPreceiver. It also keeps track of the next_seqno it needs to send in a segment and the seqno that has been most recently acked. 

Implementation Challenges:
[]

Remaining Bugs:
[]

- Optional: I had unexpected difficulty with: [describe]

- Optional: I think you could make this lab better by: [describe]

- Optional: I was surprised by: [describe]

- Optional: I'm not sure about: [describe]