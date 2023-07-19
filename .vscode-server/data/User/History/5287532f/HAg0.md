Checkpoint 2 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: [list sunetids here]

I would like to thank/reward these classmates for their help: [list sunetids here]

This lab took me about 5 hours to do. I did attend the lab session.

Program Structure and Design of the TCPReceiver and wrap/unwrap routines:
The TCPReceiver class has private variables to store the zero point, the final index, and if the
SYN was received or not. In the receive() function, the receiver uses the message to unwrap
the absolute sequence number while setting some of the aforementioned private variables. 
Then, receive() calculates the stream_index and uses this to insert the message payload into 
the Reassember using insert(). In the send() function, the program constructs the response to a 
received message. It calculates the window size from the Writer stream and then also calculates
the wrapped value of the next index needed. 

In the wrap routine, I simply return zero_point + n using the provided helper function for the 
operator+. Since the operation computes a uint32_t, the addition does the wrapping for us, essentially. 

In the unwrap routine, I calculate the raw value minus the zero_point, careful about when the zero_point is greater than the raw value to avoid underflow. I then calculate how many 'blocks' of 2^32 fit within the checkpoint to get a sense of how many 2^32 I would need to add to my current unwrapped value to get in the ballpark of the checkpoint. Thereafter, I do a comparison to make sure I get the value closest to the checkpoint and return this uint64_t.

Implementation Challenges:
[]

Remaining Bugs:
[]

- Optional: I had unexpected difficulty with: [describe]

- Optional: I think you could make this lab better by: [describe]

- Optional: I was surprised by: [describe]

- Optional: I'm not sure about: [describe]

- Optional: I made an extra test I think will be helpful in catching bugs: [describe where to find]