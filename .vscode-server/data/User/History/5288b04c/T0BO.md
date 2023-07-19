Checkpoint 5 Writeup
====================

My name: Kai Kato

My SUNet ID: kaiykato

I collaborated with: 

I would like to thank/reward these classmates for their help: 

This checkpoint took me about 8 hours to do. I did not attend the lab session.

Program Structure and Design of the Router:
For the overall design of the router, I took a very simple approach. I decided to accept a O(N) search through the entire routing table to find the longest prefix match route for the sake of simplicity in implementation. Firstly, I defined a struct called 'route' which contains all the information pertaining to a specific route (prefix, prefix length, next hop, interface number). I chose to use a vector to capture all the routes (as route struct) the router intends to remember. The primary operations upon this data structure is adding new routes and iterating through its entirety. Since I do not care where in the list I am inserting a specific route (I am not sorting to optimize match search) I can just add new routes to the end of the vector. Thus I found the choice of vector to be good, since it is efficient to insert elements at the end and is easy to iterate through elements. Moreover, the contiguous memory storage of vectors could improve caching and thus performance. I thought of other structures like linked lists but vectors seemed to be the best fit given my needs. 

In terms of my decision to do a simple search through the entire list of routes, I put some thought into what it would look like to perhaps do some sort of sorting to prevent having to iterate through the entire vector for each datagram that is sent. I could sort by prefix length in descending order and then stop the search once I find a match, since subsequent 'hits' would not be a better match than the existing one. However, this approach would introduce complexity when adding routes to the table. I could mitigate the costs of adding routes in arbitrary positions by using a linked list instead but I would still have to do some sort of search to find the right position. This search need not be O(n) but would be O(logn), which still introduces some runtime costs every time a route is added. This needs to be weighed with how much runtime is reduced by not having to search through the entire routing table when finding prefix matches. I reasoned that it would likely take a large number of routes in the table for this to be reasonable. I figured that for now, a simple O(n) search was still efficient enough for our router.  

Implementation Challenges:
I had difficulty due to me not passing each interface by reference in route(). 

Remaining Bugs:
Tie-breakers. 