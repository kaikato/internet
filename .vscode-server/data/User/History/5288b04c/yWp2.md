Checkpoint 5 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: 

I would like to thank/reward these classmates for their help: 

This checkpoint took me about 8 hours to do. I did not attend the lab session.

Program Structure and Design of the Router:
For the overall design of the router, I took a very simple approach. I decided to accept a O(N) search through the entire routing table to find the longest prefix match route for the sake of simplicity in implementation. Firstly, I defined a struct called 'route' which contains all the information pertaining to a specific route (prefix, prefix length, next hop, interface number). I chose to use a vector to capture all the routes (as route struct) the router intends to remember. The primary operations upon this data structure is adding new routes and iterating through its entirety. Since I do not care where in the list I am inserting a specific route (I am not sorting to optimize match search) I can just add new routes to the end of the vector. Thus I found the choice of vector to be good, since it is efficient to insert elements at the end and is easy to iterate through elements. Moreover, the contiguous memory storage of vectors could improve caching and thus performance. I thought of other structures like linked lists but vectors seemed to be the best fit given my needs. 

Could sort routes by prefix size and stop iterating once found. 

Implementation Challenges:
I had difficulty due to me not passing each interface by reference in route(). 

Remaining Bugs:
Tie-breakers. 
