Checkpoint 1 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: [list sunetids here]

I would like to thank/reward these classmates for their help: [list sunetids here]

This lab took me about 10 hours to do. I did not attend the lab session.

Program Structure and Design of the Reassembler:
I used a vector of pairs to store the unassembled substrings. The pairs were structured as (char, bool). The char is the byte that was part of the substring, while the bool was to signal that this particular byte had been written to. Each substring was placed in its proper index, and when the first index was written to, I pushed out all the contiguous bytes thereafter to the ByteStream.

Implementation Challenges:
I struggled to make sure overlapping substrings were written properly. The biggest struggle was figuring out why my reassembler was so slow. I realized that I was traversing the entire vector to count pending bytes when I should have just been keeping track of it while writing substrings. 

Remaining Bugs:
Unsure.

- Optional: I had unexpected difficulty with: [describe]

- Optional: I think you could make this lab better by: [describe]

- Optional: I was surprised by: [describe]

- Optional: I'm not sure about: [describe]
